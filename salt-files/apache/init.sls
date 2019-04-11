apache2:
  pkg.installed

/home/cloudworker-2/public_html:
  file.directory:
    - mode: 755

/home/cloudworker-2/public_html/index_html:
  file.managed:
    - source: salt://apache/index_html
    - mode: 755

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
     - target: ../mods-available/userdir.conf

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load

apache2service:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-enabled/userdir.conf
      - file: /etc/apache2/mods-enabled/userdir.load
