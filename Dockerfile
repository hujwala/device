FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y libpq-dev
RUN apt-get install -y libxml2-dev libxslt1-dev
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb
RUN apt-get install -y nodejs
COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

ENV app /Users/ujwala/device/
RUN mkdir app
WORKDIR app
ADD . app
EXPOSE 4000
RUN rails s -p 4000