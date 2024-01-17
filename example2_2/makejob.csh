#!/bin/csh -f

set jobfile = "condor.job"

echo "Universe     = vanilla"            >  $jobfile
echo "Executable   = showhost.csh"       >> $jobfile
echo "Notification = Never"              >> $jobfile
echo "Initialdir   = /sphenix/tg/tg01/commissioning/INTT/work/hachiya/batchtest/example2_2" >> $jobfile
echo "request_memory = 4096MB"           >> $jobfile
echo "# the importance of this PeriodicHold will be explained in the next section" >> $jobfile
echo "PeriodicHold = (NumJobStarts>=1 && JobStatus == 1)" >> $jobfile
echo ""                                  >> $jobfile

@ i = 0

while ( $i < 10 )


  echo "Output       = condor_$i.out"      >> $jobfile
  echo "Error        = condor_$i.err"      >> $jobfile
  echo "Log          = /tmp/condor_$i.log" >> $jobfile
  echo "Queue"                             >> $jobfile
  echo "#--------------------------------" >> $jobfile
  echo ""                                  >> $jobfile

  @ i ++

end

#condor_submit ${jobfile}

