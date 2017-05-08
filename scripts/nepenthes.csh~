#!/bin/csh
date
cd workspaces/cuda8_workspace/SMIRFsoup/Debug/
set host = `hostname | awk -F. '{print $1}'`

set utc = $1

set archives_base = /data/mopsr/rawdata

if("$2" != "") then
    set archives_base = $2
end
    

./SMIRFsoup -u 2psrs.${host} -U  . -i $utc  -S . -Z -A $archives_base
