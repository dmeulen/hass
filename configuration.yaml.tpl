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
    - type: legacy_api_password
    - type: trusted_networks

http:
  api_password: !secret api_password
  base_url: !secret base_url
  trusted_networks:
    - 127.0.0.1
    - 172.17.0.0/24
    - !secret trusted_home_network

recorder:
  purge_interval: 1
  purge_keep_days: 7
  db_url: !secret db_url
  exclude:
    domains:
      - automation
      - weblink
      - updater
    entities:
      - sun.sun
      - sensor.date
      - sensor.date_time
      - sensor.internet_time
      - binary_sensor.keuken_radar

logger:
  default: info

cloud:

config:

influxdb:
  host: 192.168.1.253
  username: !secret influxdb_user
  password: !secret influxdb_password

prometheus:

frontend:
  themes:
    darkorange:
      primary-color: "#ff9800"
      light-primary-color: "#ffc947"
      dark-primary-color: "#c66900"
      text-primary-color: "#ffffff"
      primary-background-color: "#37464f"
      sidebar-text_-_background: "#62717b"
      paper-card-background-color: "#263137"
      paper-card-header-color: "var(--text-primary-color)"
      secondary-background-color: "var(--primary-background-color)"
      primary-text-color: "var(--text-primary-color)"
      secondary-text-color: "var(--primary-color)"
      paper-listbox-background-color: "var(--sidebar-text_-_background)"
      paper-toggle-button-checked-ink-color: "var(--dark-primary-color)"
      paper-toggle-button-checked-button-color: "var(--dark-primary-color)"
      paper-toggle-button-checked-bar-color: "var(--dark-primary-color)"
      paper-slider-knob-color: "var(--primary-color)"
      paper-slider-knob-start-color: "var(--primary-color)"
      paper-slider-pin-color: "var(--primary-color)"
      paper-slider-active-color: "var(--primary-color)"
      paper-slider-secondary-color: "var(--light-primary-color)"
      paper-slider-container-color: "var(--sidebar-text_-_background)"
      paper-progress-secondary-color: "var(--sidebar-text_-_background)"
      paper-item-selected_-_background-color: "var(--primary-color)"
      paper-item-icon_-_color: "var(--text-primary-color)"
      paper-item-icon-color: "var(--sidebar-text_-_background)"
      paper-item-icon-active-color: "var(--primary-color)"
      paper-grey-50: "var(--sidebar-text_-_background)"
      paper-grey-200: "var(--primary-background-color)"
      label-badge-background-color: "var(--sidebar-text_-_background)"
      label-badge-text-color: "var(--text-primary-color)"
      label-badge-red: "var(--primary-color)"
      label-badge-blue: "var(--light-primary-color)"
      label-badge-green: "var(--dark-primary-color)"
      label-badge-yellow: "var(--text-primary-color)"
      label-badge-grey: "var(--paper-grey-500)"
      table-row-background-color: "var(--paper-card-background-color)"
      table-row-alternative-background-color: "var(--sidebar-text_-_background)"

map:

updater:

discovery:

conversation:

history:

logbook:

sun:

cast:
  media_player:
    - host: 192.168.1.23

toon:
  username: !secret toon_username
  password: !secret toon_password
  consumer_key: !secret consumer_key
  consumer_secret: !secret consumer_secret

climate:
  platform: toon

google_assistant:
  project_id: !secret ga_project_id
  api_key: !secret ga_api_key
  exposed_domains:
    - switch
    - light
    - group
    - scene
    - climate
  entity_config:
    media_player.mfb:
      aliases:
        - hi-fi

tts:
  - platform: google
    cache: true
    cache_dir: /tmp/tts
    time_memory: 57600
    language: 'nl'
    base_url: http://{{ env "NOMAD_IP_http" }}:{{ env "NOMAD_PORT_http" }}

mysensors:
  gateways:
    - device: '192.168.1.5'
      tcp_port: 5003
      persistence_file: !secret mysensors_persistence
  persistence: true
  version: 2.0

device_tracker:
  - platform: owntracks_http
    waypoint_whitelist:
      - danny

remote:
  - platform: harmony
    host: 192.168.1.30
    name: Harmony Hub
    activity: "Watch TV"
    scan_interval: 10

zone:
  - name: Home
    latitude: !secret latitude
    longitude: !secret longitude
    radius: 400

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

mqtt:
  broker: mqtt.service.consul

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
