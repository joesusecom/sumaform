delete_keys:
  salt.runner:
    - name: spacewalk.deleteAllActivationKeys
    - server: manager.su.se

delete_groups:
  salt.runner:
    - name: spacewalk.deleteAllGroups
    - server: manager.su.se

delete_systems:
  salt.runner:
    - name: spacewalk.deleteAllSystems
    - server: manager.su.se

