{{- define "my.cnf" }}
[server]

[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
log-error=/var/log/mariadb/mariadb.log
pid-file=/run/mariadb/mariadb.pid
max_connections = 64
max_heap_table_size = 1M
innodb_buffer_pool_size = 5M
innodb_log_buffer_size = 512K

[galera]

[embedded]

[mariadb]

[mariadb-10.3]

{{- end }}

{{- if .Values.ironic.config_override.mariadb }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: mariadb-config
data:
  my.cnf: |
    {{- include "my.cnf" . | indent 4 }}

{{- end }}
