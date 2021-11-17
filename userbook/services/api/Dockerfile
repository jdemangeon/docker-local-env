FROM ruby:2.5.1

WORKDIR /app

COPY Gemfile* ./

RUN bundle install

COPY . ./

CMD ["bash", "-c", "bin/start.sh"]