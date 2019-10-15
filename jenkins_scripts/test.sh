#!/bin/bash -x
# I know, fugly. Need to fix this
docker run -v jenkins_home:/jenkins/ homeassistant/home-assistant:0.99.3 python -m homeassistant --script check_config --config /jenkins/jobs/deploy_home-assistant/workspace

