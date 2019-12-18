#!/bin/bash
url='54.236.8.50'
attempts=5
timeout=5
online=false

echo "Checking status of $url."

for (( i=1; i<=$attempts; i++ ))
do
  code=`curl -sL --connect-timeout 20 --max-time 30 -w "%{http_code}\\n" "$url" -o /dev/null`

  if [ "$code" = "200" ]; then
    echo "Website $url is up."
    online=true
    break
  else
    echo "Website $url is down. Waiting $timeout seconds."
    sleep $timeout
  fi
done

if $online; then
  echo "Website is online."
  exit 0
else
  echo "Website is down."
  exit 1
fi
