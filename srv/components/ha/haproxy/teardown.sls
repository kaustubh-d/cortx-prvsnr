Disable Slapd:
  service.dead:
    - name: rsyslog
    - enable: False

Remove haproxy config:
  file.absent:
    - name: /etc/haproxy/haproxy.cfg

Remove haproxy 503 error code to http file:
  file.absent:
    - name: /etc/haproxy/errors/503.http

Remove haproxy config to enable logs:
  file.absent:
    - name: /etc/rsyslog.d/haproxy.conf

Remove logrotate config for haproxy to run hourly:
  file.absent:
    - name: /etc/cron.hourly/logrotate

Clean existing logrotate configuration to run daily:
  file.absent:
    - name: /etc/cron.daily/logrotate

Remove logrotate config for haproxy:
  file.absent:
    - name: /etc/logrotate.d/haproxy

Remove haproxy:
  pkg.purged:
    - name: haproxy

Remove user haproxy:
  user.absent:
    - name: haproxy
    - purge: True
    -  force: True