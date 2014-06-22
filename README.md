* BUILD

     docker build  -t docker-sitespeed.io .

* RUN

     docker run -v /tmp:/result -t docker-sitespeed.io  /opt/sitespeed.io/bin/sitespeed.io-xvfb -u http://www.sitespeed.io -c firefox

   the report is at /tmp/sitespeed-result/www.sitespeed.io/index.html