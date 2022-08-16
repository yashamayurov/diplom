install-gitlab-runner
=========

Производит установка Gitlab-runner

Requirements
------------

Ubuntu 20.04

Role Variables
--------------

**gitlab_runner_url**: URL для загрузки пакета gitlab-runner

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
 - name: install Gitlab-runner
   hosts: wordpress
   roles:
       - { role: install-gitlab-runner}
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
