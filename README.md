# docker-ldap-test
admin:cn=admin,dc=coder4,dc=com
secret:admin

ldapadd -h 192.168.99.100 -p 389 -w admin -D "cn=admin,dc=coder4,dc=com" -f ./add_test.ldif
