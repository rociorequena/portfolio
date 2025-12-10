FROM rocio21/ubbase

ARG SOURCE_PATH=proyectos/pweb/portfolio/src

USER root
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

COPY ${SOURCE_PATH} /var/www/html

RUN mkdir -p /var/log/nginx
EXPOSE 80

COPY ./dockerfiles/sweb/nginx/admin/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

WORKDIR /
ENTRYPOINT ["/usr/local/bin/start.sh"]