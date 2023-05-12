# syntax=docker/dockerfile:1

FROM python:3.8.16-bullseye
WORKDIR /srv/jekyll

RUN apt-get update && apt-get install -y ruby-full nodejs npm
RUN gem install bundler

SHELL ["/bin/bash", "-c"]
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY . .
RUN pip install -r requirements.txt
RUN bundle install
RUN npm install livereload

RUN python bin/get_schedules.py
RUN python bin/get_setup.py

CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--incremental", "--livereload", "--host", "0.0.0.0"]
