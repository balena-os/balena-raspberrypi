#!/bin/sh

set -e

git submodule update --init autohat
cd autohat
APPLICATION_NAME=`echo $testNode | tr '[:upper:]' '[:lower:]'`

cat <<EOM >start.sh
#!/bin/sh
cd /autohat
robot --exitonerror --exitonfailure raspberrypi3.robot
exit 0
EOM
chmod a+x start.sh

docker build -t ${APPLICATION_NAME} .
tar -xf ../../deploy/resin.img.tar.gz

docker stop ${APPLICATION_NAME} || true
docker rm ${APPLICATION_NAME} || true
docker run -d -v `pwd`:/autohat --privileged \
    --env INITSYSTEM=on \
    --env RESINRC_RESIN_URL=${RESINRC_RESIN_URL} \
    --env email=${RESIN_EMAIL} \
    --env password=${RESIN_PASSWORD} \
    --env device_type=${device_type} \
    --env application_name=${APPLICATION_NAME} \
    --env image=/autohat/resin.img \
    --env rig_device_id=${rig_device_id} \
    --env rig_sd_card=${rig_sd_card} \
    --privileged \
    --name=${APPLICATION_NAME} \
    ${AUTOHAT_IMAGE} ${APPLICATION_NAME}
    
docker exec -t ${APPLICATION_NAME} /autohat/start.sh
docker stop ${APPLICATION_NAME} || true
docker rm ${APPLICATION_NAME} || true
