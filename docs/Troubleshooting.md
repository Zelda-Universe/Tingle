Q: X doesn't work!
A: Make sure the schema is updated, i.e., schema migrations are run.  Also, this may only break cases that try to write to the database, as it is more common we are adding to the schema structure.

Q: Reset/Lost password isn't working, or isn't sending mail.
A: Remember to change the `mailEnabled` setting to `true` when the proper configuration is added through the other settings.
