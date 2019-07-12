############################################################################
# Test streaming + O_DIRECT 
############################################################################


stream_format=xbstream
stream_extract_cmd="xbstream -xv <"
xtrabackup_options="--o_direct"

. inc/xb_stream_common.sh
