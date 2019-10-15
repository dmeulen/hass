#!/bin/bash -x
#docker run -v ${WORKSPACE}:/config/ homeassistant/home-assistant:0.99.3 python -m homeassistant --script check_config --config /config
docker run -v jenkins_home:/jenkins/ homeassistant/home-assistant:0.99.3 ls /jenins/jobs/deploy_home-assistant/workspace
