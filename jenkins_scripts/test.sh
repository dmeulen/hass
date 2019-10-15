#!/bin/bash -x
#docker run -v ${WORKSPACE}:/config/ homeassistant/home-assistant:0.99.3 python -m homeassistant --script check_config --config /config
docker run -v ${PWD}/:/config/ homeassistant/home-assistant:0.99.3 ls /config
