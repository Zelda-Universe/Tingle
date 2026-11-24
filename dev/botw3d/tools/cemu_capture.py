#!/usr/bin/env python3
"""Capture a few frames of Cemu (started with MTL_CAPTURE_ENABLED=1) to an Xcode
.gputrace file, by attaching lldb and driving MTLCaptureManager inside Cemu.

python3 cemu_capture.py <output.gputrace> [seconds]
macOS asks for an administrator's approval to attach unless Developer Mode is on.
"""
import os, subprocess, sys, tempfile

out = os.path.abspath(sys.argv[1]); secs = float(sys.argv[2]) if len(sys.argv) > 2 else 0.1
pid = subprocess.check_output(['pgrep', '-f', 'Cemu.app/Contents/MacOS/Cemu']).split()[0].decode()
script = '''
import lldb, time
def halt(p):
    # wait until the process has really stopped: expressions fail while it's still running
    p.Stop()
    for _ in range(100):
        if p.GetState() == lldb.eStateStopped: return True
        time.sleep(0.1)
    print('>> did not stop'); return False
def run(debugger, cmd, result, internal):
    t = debugger.GetSelectedTarget(); p = t.GetProcess()
    def ev(s):
        o = lldb.SBExpressionOptions(); o.SetLanguage(lldb.eLanguageTypeObjC); o.SetIgnoreBreakpoints(True); o.SetTimeoutInMicroSeconds(20000000)
        v = t.EvaluateExpression(s, o); print('>>', v.GetValue() or v.GetSummary(), v.GetError().GetCString() if v.GetError().Fail() else '')
        return v
    mgr = '((id)[NSClassFromString(@"MTLCaptureManager") sharedCaptureManager])'
    ev('(BOOL)[%%s supportsDestination:(long)2]' %% mgr)
    ev('id $d = (id)[[NSClassFromString(@"MTLCaptureDescriptor") alloc] init]; (void)[$d setCaptureObject:(id)((id(*)(void))MTLCreateSystemDefaultDevice)()]; (void)[$d setDestination:(long)2]; (void)[$d setOutputURL:(id)[NSURL fileURLWithPath:@"%(out)s"]]; id $err = (id)0; (BOOL)[%%s startCaptureWithDescriptor:$d error:&$err]' %% mgr)
    ev('(id)[$err description]')
    debugger.SetAsync(True); p.Continue(); time.sleep(%(secs)s); ok = halt(p); debugger.SetAsync(False)\n    if not ok: p.Detach(); return
    ev('(void)[%%s stopCapture]' %% mgr)
    debugger.SetAsync(True); p.Continue(); time.sleep(1.5); halt(p); debugger.SetAsync(False)
    ev('(BOOL)[%%s isCapturing]' %% mgr)
    p.Detach()
''' % dict(out=out, secs=secs)
f = tempfile.NamedTemporaryFile('w', suffix='.py', delete=False); f.write(script); f.close()
subprocess.call(['xcrun', 'lldb', '-p', pid, '-b', '-o', 'command script import ' + f.name, '-o', 'command script add -f %s.run cap' % os.path.basename(f.name)[:-3], '-o', 'cap'])
print('wrote', out, os.path.exists(out))
