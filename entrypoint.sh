#! bin/bash
/etc/init.d/go-server start 
/etc/init.d/go-agent start
sed -i -e 's/127.0.0.1/goserver/g' /etc/default/go-agent
tail -f /var/log/go-server/go-server.log
