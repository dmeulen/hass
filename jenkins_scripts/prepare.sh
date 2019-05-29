#!/bin/bash
export NOMAD_IP_http="127.0.0.1"
export NOMAD_PORT_http="3128"
python3 -m venv ${WORKSPACE}/hass
. ${WORKSPACE}/hass/bin/activate
pip3 install --upgrade homeassistant
if [[ ! -e ./consul-template ]]; then
  wget https://releases.hashicorp.com/consul-template/0.19.5/consul-template_0.19.5_linux_amd64.zip
  unzip consul-template_0.19.5_linux_amd64.zip
fi
./consul-template -template "configuration.yaml.tpl:configuration.yaml" -once
cat <<_EOD > secrets.yaml
latitude: 52.1036
longitude: 5.1356
asus_ip: 192.168.1.1
asus_user: admin
asus_password: fakepass
influxdb_user: fakeuser
influxdb_password: fakepass
toon_username: fakeuser
toon_password: fakepass
api_password: fakepass
trusted_home_network: 192.168.1.0/24
mysensors_persistence: ${WORKSPACE}/hass/mysensors.json
ga_project_id: fakeproject
ga_client_id: roeiuweroiuweroiwruweroiuw
ga_access_token: lkjwopiweuwefolwnhfwerhfwuioweofihjofihwewopfhiofhweofhjwi
base_url: example.com
db_url: mysql://test:test@test/test
consumer_key: fake_key
consumer_secret: fake_secret
_EOD

