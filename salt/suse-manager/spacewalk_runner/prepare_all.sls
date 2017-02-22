{% import_yaml "suse-manager/spacewalk_runner/basic_groups.yml" as groups %}
{% for group_name, group in groups.iteritems() %}
create_systemgroup_{{ group_name }}:
  salt.runner:
    - name: spacewalk.api
    - server: suma3pg.tf.local
    - command: systemgroup.create
    - arguments:
      - {{ group_name }}
      - {{ group.description }}
create_activation_key_{{ group_name }}:
  salt.runner:
    - name: spacewalk.api
    - server: suma3pg.tf.local
    - command: activationkey.create
    - arguments:
      - {{ group_name.replace(" ","-") }}
      - "{{ group.description }}"
      - ""
      - []
      - False
add_groups_to_key_{{ group_name }}:
  salt.runner:
    - name: spacewalk.addGroupsToKey
    - server: suma3pg.tf.local
    - activation_key: 1-{{ group_name.replace(" ","-") }}
    - groups: ['{{ group_name }}']
{% endfor %}
