#!/bin/sh
# usefull to identify disks on FreeNAS

echo
echo $(basename $0) - Mounted Drives on $(hostname)
cat /etc/version
date
echo
diskinfo="$(glabel status | tail -n +2 | awk '{split($3,a,"p"); print a[1],$1}')"
echo "+========+==========================+==================+============================================+"
echo "| Device |         DISK DESCRIPTION        |  SERIAL  NUMBER  |                              GPTID                                        |"
echo "+========+==========================+==================+============================================+"

for d in $(echo "$diskinfo" | cut -d" " -f 1)
do
   diskinf=$(diskinfo -v $d | grep '# Disk ')
   diskdescription=$(echo "$diskinf" | grep '# Disk desc' | cut -d# -f 1 | xargs)
   diskserialno=$(echo "$diskinf" | grep '# Disk ident' | cut -d# -f 1 | xargs)
   diskgptid=$(echo "$diskinfo" | grep ^$d | cut -d" " -f 2)
   printf "| %-6s | %-24s | %-16s | %-42s |\n" "$d" "$diskdescription" "$diskserialno" "$diskgptid"
   echo "+--------+--------------------------+------------------+--------------------------------------------+"
done
