#!/bin/bash
curl http://hashiui.anna.lan/api/nomad/global -d '{"type":"NOMAD_ROLLING_RESTART_JOB", "payload":"homeassistant"}'
