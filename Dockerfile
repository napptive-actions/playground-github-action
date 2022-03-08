FROM napptive/playground:v2.2.4

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]