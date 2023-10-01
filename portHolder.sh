PIDS=`ps -ef $LIMIT_UID| awk '{ print $2 }' | sed 1d`
for p in $PIDS ;do
    pfiles $p 2> /dev/null | grep "port: $PORTNUM" > /dev/null 2>&1
      if test 0 -eq $? ;then
        if test -z "$PRINT_ARGS" ;then
          ps -p $p | sed 1d
        else
          pargs -l $p
        fi
      fi
  done
