#!/bin/csh

if($#argv < 3) then
    echo "usage: run_dspsr  <dada.key> <file string> <output string> <verb>"
    exit
endif		 

set key = $1
set file_string = $2
set out_string = $3
set verb = $4

dada_dbmetric -k $key

if($? == 0) then
    if($verb != "" ) dada_header -k $key

    set candidate_file = `dada_header -k $key | grep $file_string | awk '{print $2}'`
    set out = `dada_header -k $key | grep $out_string | awk '{print $2}'`
    
    if($verb != "" ) then 
	echo "Waiting for $candidate_file"
    endif

    while( ! -f $candidate_file )
	echo "waiting..."
	sleep 2
    end

    cd $out
    set verb_flag = ""

    echo "DADA INFO:" > dada.key
    echo "key $key" >> dada.key
    pwd
    echo "running /home/vivek/software/linux_64/bin/dspsr -e car -L 60 -Lmin 60 -A -w $candidate_file  dada.key"

    /home/vivek/software/linux_64/bin/dspsr -e car -L 60 -Lmin 60 -A -w $candidate_file  dada.key

endif 
