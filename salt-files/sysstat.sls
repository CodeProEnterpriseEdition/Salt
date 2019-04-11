sysstat:
  pkg.installed

/etc/default/sysstat:
  file.managed:
    - source: salt://sysstat

restartstat:
  service.running:
    - name: sysstat
    - watch:
      - file: /etc/default/sysstat
