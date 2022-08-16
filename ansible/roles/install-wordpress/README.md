install-wordpress
=========

Роль производит установку и конфигурацию nginx для работы с сайтом Wordpress

Requirements
------------

Операционная система: Ubuntu 20.04

Role Variables
--------------

Возможно переопределить сдедующие переменные:

**wp_archive_name:** Имя файла - дистрибутива Wordpress
**wp_get_url:**  URL для скачивания дистрибутива Wordpress
**wp_root_dir:** Директория, в которой находится корневая директория сайта
**mysql_host:** адрес сервера mySql
**mysql_wp_database:** имя базы данных mySql 
**mysql_wp_user:** пользователь базы данных mySql 
**mysql_wp_password:** пароль пользователя MySql

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:
```yaml
 - name: install Wordpress
   hosts: wordpress
   roles:
       - { role: install-wordpress }
```
Author Information
------------------

Iakov Maiurov
