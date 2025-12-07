FROM pnginxweb:latest
USER root
RUN chown -R www-data /var/www/html
RUN chmod -R 755 /var/www/html
RUN mkdir -p /var/log/nginx
EXPOSE 80
COPY ./dockerfiles/portnginx/admin/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
ENTRYPOINT ["/usr/local/bin/start.sh"]