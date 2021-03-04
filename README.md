# docker-gugucomic
this repo is still under non-active developement. please do not use.

installation(1):
docker run --name=gugucomic -p 8585:80 jas0nc/docker-gugucomic

installation(2):
docker run --name=gugucomic -p 8585:80 -v /path/to/CBZ:/var/www/html/CBZ -v /path/to/config:/var/www/html/config jas0nc/docker-gugucomic