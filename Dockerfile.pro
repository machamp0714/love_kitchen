FROM ruby:2.5.3

ARG RAILS_MASTER_KEY

ENV APP_ROOT /app
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}

WORKDIR $APP_ROOT

RUN \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    apt-get update && apt-get install -y yarn

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN \
  bundle install && \
  rm -rf ~/.gem

ADD . $APP_ROOT

RUN yarn add package.json

RUN bundle exec rails assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]
