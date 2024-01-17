#!/bin/csh
setenv HOME /phenix/u/$LOGNAME
source /etc/csh.login
foreach i (/etc/profile.d/*.csh)
  source $i
end
source $HOME/.login
source /opt/sphenix/core/bin/sphenix_setup.csh -n
source /opt/sphenix/core/bin/setup_local.csh /sphenix/user/hachiya/INTT/INTT/general_codes/hachiya/F4AInttRead/install

set nevents  = $1
set ifile    = $2
set ofile    = $3
set dacfile  = $4
set bcofile  = $5
set adc7flag = $6
set runno    = $7

root -b -q  Fun4All_Intt_RecoCluster.C\($nevents,\"$ifile\",\"$ofile\",\"$dacfile\",\"$bcofile\",$adc7flag,$runno\)
  
echo "all done"
