FROM ruby:2.5.3

ARG RAILS_MASTER_KEY
ARG RAILS_ENV

ENV APP_ROOT /app
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}
ENV RAILS_ENV ${RAILS_ENV}

WORKDIR $APP_ROOT

RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-transport-https libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -s -L git.io/nodebrew | perl - setup
ENV PATH /root/.nodebrew/current/bin:$PATH
RUN nodebrew install-binary v10.16.0
RUN nodebrew use v10.16.0

RUN curl -sS http://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && \
    apt-get install -y --no-install-recommends yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN bundle install && \
    rm -rf ~/.gem

ADD . $APP_ROOT

RUN yarn add package.json

RUN if [ "${RAILS_ENV}" = "production" ]; then bundle exec rails assets:precompile; fi

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
