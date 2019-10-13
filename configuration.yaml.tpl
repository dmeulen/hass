homeassistant:
  name: Home
  latitude: !secret latitude
  longitude: !secret longitude
  elevation: 1
  unit_system: metric
  time_zone: Europe/Amsterdam
  customize: !include includes/customize.yaml
  auth_providers:
    - type: homeassistant
    - type: trusted_networks
      trusted_networks:
        - 127.0.0.1
        - 172.17.0.0/24
        - !secret trusted_home_network
      allow_bypass_login: true
    - type: legacy_api_password
      api_password: !secret api_password
  packages: !include_dir_named packages

http:
  base_url: !secret base_url
  use_x_forwarded_for: true
  trusted_proxies:
  {{- range service "nomad-client" }}
    - {{ .Address }}
  {{- end }}

tts:
  - platform: google_translate
    cache: true
    cache_dir: /tmp/tts
    time_memory: 57600
    language: 'nl'
    base_url: http://{{ env "NOMAD_IP_http" }}:{{ env "NOMAD_PORT_http" }}

input_select:
  radio_station:
    name: Radio Station
    options:
      - Radio 1
      - Radio 2
      - 3FM
      - 3FM Alt
      - Radio 4
      - BNR
      - None
    initial: None
    icon: mdi:radio

timer:
  garagedeur:
    duration: '00:05:00'

python_script:

automation: !include_dir_list automations/
group: !include includes/groups.yaml
sensor: !include includes/sensors.yaml
scene: !include includes/scenes.yaml
light: !include includes/lights.yaml
notify: !include includes/notifications.yaml
switch: !include includes/switches.yaml
binary_sensor: !include includes/binary_sensors.yaml
script: !include includes/scripts.yaml
