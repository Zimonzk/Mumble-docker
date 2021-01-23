FROM python:3
RUN apt-get update && apt-get install -y mumble-server ffmpeg

ADD ./botamusique /botamusique
ADD ./.git /.git

RUN pip install wheel
RUN pip install -r /bot/requirements.txt

VOLUME "/mumble"
VOLUME "/botamsique/config"

EXPOSE 6502
EXPOSE 64738
EXPOSE 8181

COPY start.sh start.sh
RUN chmod 777 start.sh
CMD ["/start.sh"]

