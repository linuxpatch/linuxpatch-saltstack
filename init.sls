{% from "linuxpatch-saltstack/map.jinja" import lp_key %}

linuxpatch:
  file.managed:
    - name: /tmp/install.sh
    - source: https://linuxpatch.com/install.sh
    - mode: '0755'
    - makedirs: True
    - unless: test -f /opt/linuxpatch/bin/linuxpatch

run_linuxpatch_script:
  cmd.run:
    - name: /tmp/install.sh
    - env:
        LP_KEY: {{ lp_key }}
    - cwd: /tmp
    - require:
      - file: linuxpatch
    - unless: test -f /opt/linuxpatch/bin/linuxpatch

cleanup_linuxpatch_script:
  file.absent:
    - name: /tmp/install.sh
    - require:
      - cmd: run_linuxpatch_script

linuxpatch_agent_service:
  service.running:
    - name: linuxpatch-agent
    - enable: True
    - require:
      - cmd: run_linuxpatch_script
      - file: linuxpatch
