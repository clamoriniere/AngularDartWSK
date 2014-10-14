FROM google/dart

ADD dart_run.sh /dart_runtime/
RUN chmod 755 /dart_runtime/dart_run.sh
RUN chown root:root /dart_runtime/dart_run.sh

WORKDIR /app

ADD pubspec.yaml /app/
ADD pubspec.lock /app/
RUN pub get
ADD . /app/
RUN pub get

CMD []
ENTRYPOINT ["/dart_runtime/dart_run.sh"]
EXPOSE 8080 8181 5858
