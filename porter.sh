pfiles /proc/* 2>/dev/null | awk -v port=$1 '
/^[0-9]/ { cmd=$0; type="unknown"; continue }
$1 == "SOCK_STREAM" { type="tcp" }
$1 == "SOCK_DGRAM" { type="udp" }
$2 == "AF_INET" {
        if ((port!="")&&($5!=port)) continue;
        if (cmd!="") {
                printf("%s\n    %s:%s/%s\n",cmd,$3,$5,type); cmd="";
        }
}'
