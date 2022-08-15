Role Name
=========

intall-nginx-letsencrypt

Requirements
------------

Операционная система: Ubuntu не ниже 18.04 LTS

Роль производит установку nginx, утилиты letsencrypt.

Производится настройка nginx: доавляются сайты, включается работы по протоколу https, получение сертификата letencrypt 

Role Variables
--------------

Следующие переменные могут быть переопределены:

- **acme_email:** e-mail Администратора сайта
- **domain_name:** имя корневого домена
- **www_root:** корневая директория сайтов
- **subdomains:** Список upstream для сайтов, пример:
```yaml
subdomains:  
  - {hostname: "{{ domain_name }}", url: "{{app_server_ip}}", port: 80}
  - {hostname: "grafana.{{ domain_name }}",url: "{{ monitoring_ip }}", port: 3000}
  - {hostname: "gitlab.{{ domain_name }}", url: "{{gitlab_ip}}", port: 80}
  - {hostname: "alertmanager.{{ domain_name }}", url: "{{ monitoring_ip }}", port: 9093}
  - {hostname: "prometheus.{{ domain_name }}", url: "{{ monitoring_ip }}", port: 9090}
```


Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:
```yaml
- name: Install Nginx and letsencrypt
  hosts: nginx_servers
  roles: 
    - { role: intall-nginx-letsencrypt }
```
Author Information
------------------

Iakov Maiurov
