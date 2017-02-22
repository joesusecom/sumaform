/srv/salt/_runners/spacewalk.py:
  file.managed:
    - source: https://raw.githubusercontent.com/saltstack/salt/develop/salt/runners/spacewalk.py
    - skip_verify: True
    - makedirs: True

/etc/salt/master.d/spacewalk.conf:
  file.managed:
    - source: salt://suse-manager/spacewalk_runner/spacewalk.conf

set_up_manager_contents:
  cmd.run:
    - name: salt-run state.orchestrate suse-manager.spacewalk_runner.prepare_all
    - require:
      - cmd: suse-manager-setup