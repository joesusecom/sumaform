delete_keys:
  salt.runner:
    - name: spacewalk.deleteAllActivationKeys
    - server: suma3pg.tf.local

delete_groups:
  salt.runner:
    - name: spacewalk.deleteAllGroups
    - server: suma3pg.tf.local

delete_systems:
  salt.runner:
    - name: spacewalk.deleteAllSystems
    - server: suma3pg.tf.local

