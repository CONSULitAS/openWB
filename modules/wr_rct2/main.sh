#!/bin/bash
OPENWBBASEDIR=$(cd `dirname $0`/../../ && pwd)
RAMDISKDIR="${OPENWBBASEDIR}/ramdisk"
MODULEDIR=$(cd `dirname $0` && pwd)
DMOD="PV"
#DMOD="MAIN"
Debug=$debug

#For development only
#Debug=1

if [ ${DMOD} == "MAIN" ]; then
        MYLOGFILE="${RAMDISKDIR}/openWB.log"
else
        MYLOGFILE="${RAMDISKDIR}/nurpv.log"
fi


python3 "$OPENWBBASEDIR/modules/bezug_rct2/rct_read_wr.py" "--ip=$bezug1_ip">>${MYLOGFILE} 2>&1
ret=$?
openwbDebugLog ${DMOD} 2 "RET: ${ret}"

pvwatt=$(<${RAMDISKDIR}/pvwatt)
echo $pvwatt
