#!/bin/bash

MOZIO_PATH=/home/chinomng/mozio
MOZIO_REPOSITORIES="mozio ondemand mozio-commons"

for REPO in ${MOZIO_REPOSITORIES}; do
  DISPLAY=:0 notify-send "Pulling docker-compose from '${REPO}'...";
  echo "Pulling docker-compose from '${REPO}'..."
  /usr/local/bin/docker-compose --file ${MOZIO_PATH}/${REPO}/docker-compose.yml pull
  echo "docker-compose pull"
done

# remove all the untagged images to save space
/usr/bin/docker images | grep "<none>" | awk '{ print $3 }' | xargs -I '{}' /usr/bin/docker rmi --force '{}'


# http://blog.yohanliyanage.com/2015/05/docker-clean-up-after-yourself/
# remove all the containers in "exited" status
/usr/bin/docker rm -v $(/usr/bin/docker ps -a -q -f status=exited)

# remove "dangling" images
/usr/bin/docker rmi $(/usr/bin/docker images -f "dangling=true" -q)

# more work on "dangling" ones
/usr/bin/docker volume rm $(/usr/bin/docker volume ls -qf dangling=true)
