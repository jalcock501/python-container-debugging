FROM python:alpine

RUN apk update
RUN pip config set global.extra-index-url https://$SOFTWAREDEPOT_USER:$SOFTWAREDEPOT_PASS@$SOFTWAREDEPOT_URL
RUN pip install debugpy

ADD . /project
WORKDIR /project

RUN pip install -r requirements.txt

CMD python -m debugpy --wait-for-client --listen 0.0.0.0:5678 .
