# docker-ldap-test
admin:cn=admin,dc=coder4,dc=com
secret:admin

ldapadd -h 192.168.99.100 -p 389 -w admin -D "cn=admin,dc=coder4,dc=cm" -f ./add_test.ldif

ldapwhoami -h 192.168.99.101 -p 389 -D "cn=admin,dc=coder4,dc=com" -w admin
ldapwhoami -h 192.168.99.101 -p 389 -D "cn=lihy,ou=users,dc=coder4,dc=com" -w pass
