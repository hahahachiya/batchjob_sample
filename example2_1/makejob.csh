#!/bin/csh -f

@ i = 0

while ( $i < 10 )

  set jobfile = "condor_$i.job"

  echo "Universe     = vanilla"            >  $jobfile
  echo "Executable   = showhost.csh"       >> $jobfile
  echo "Notification = Never"              >> $jobfile
  echo "Output       = condor_$i.out"      >> $jobfile
  echo "Error        = condor_$i.err"      >> $jobfile
  echo "Log          = /tmp/condor_$i.log" >> $jobfile
  echo "Initialdir   = /sphenix/tg/tg01/commissioning/INTT/work/hachiya/batchtest/example2_1" >> $jobfile
  echo "request_memory = 4096MB"           >> $jobfile
  echo "# the importance of this PeriodicHold will be explained in the next section" >> $jobfile
  echo "PeriodicHold = (NumJobStarts>=1 && JobStatus == 1)" >> $jobfile
  echo "Queue"                             >> $jobfile

  condor_submit ${jobfile}

  @ i ++

end
