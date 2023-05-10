s|zeldamaps|tingle|g
s|Server version.+?$|Server version|g
s|Dump completed on .+?$| Dump completed on|g
s| ?/\*!80016 DEFAULT ENCRYPTION='N' \*/||g
s| ON DELETE NO ACTION ON UPDATE NO ACTION||g
s|bigint\([0-9]+\)|bigint|g
s|int\([0-9]+\)|int|g
s|tinyint\([0-9]+\)|tinyint|g
s|datetime\([0-9]+\)|datetime|g
