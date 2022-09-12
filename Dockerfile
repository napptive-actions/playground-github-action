FROM napptive/playground:v4.1.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]