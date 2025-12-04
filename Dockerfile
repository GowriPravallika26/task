COPY . /app
RUN chmod 0644 /app/cron/2fa-cron
RUN crontab /app/cron/2fa-cron
RUN mkdir -p /data /cron && chmod 755 /data /cron
VOLUME ["/data", "/cron"]
EXPOSE 8080
CMD cron && uvicorn app.main:app --host 0.0.0.0 --port 8080

