#!/bin/csh -f

set jobfile = "condor.job"

echo "Universe     = vanilla"            >  $jobfile
echo "Executable   = showhost2.csh"      >> $jobfile
echo "Notification = Never"              >> $jobfile
echo "Initialdir   = /sphenix/tg/tg01/commissioning/INTT/work/hachiya/batchtest/example3_1" >> $jobfile
echo "request_memory = 4096MB"           >> $jobfile
echo "# the importance of this PeriodicHold will be explained in the next section" >> $jobfile
echo "PeriodicHold = (NumJobStarts>=1 && JobStatus == 1)" >> $jobfile
echo ""                                  >> $jobfile

@ i = 0

while ( $i < 10 )

  set arg1 = "value1_$i"
  set arg2 = "value2_$i"

  echo "Arguments    = ${arg1} ${arg2}"    >> $jobfile
  echo "Output       = condor_$i.out"      >> $jobfile
  echo "Error        = condor_$i.err"      >> $jobfile
  echo "Log          = /tmp/condor_$i.log" >> $jobfile
  echo "Queue"                             >> $jobfile
  echo "#--------------------------------" >> $jobfile
  echo ""                                  >> $jobfile

  @ i ++

end

#condor_submit ${jobfile}

