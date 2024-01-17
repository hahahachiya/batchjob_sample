#!/bin/csh

setenv HOME /phenix/u/$LOGNAME
source /etc/csh.login
foreach i (/etc/profile.d/*.csh)
  source $i
end
source $HOME/.login
#source /opt/sphenix/core/bin/sphenix_setup.csh -n


echo $HOST
echo "Argument1 $1"
echo "Argument2 $2"

/sphenix/tg/tg01/commissioning/INTT/work/hachiya/batchtest/hello
