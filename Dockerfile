FROM ruby:2.5.3
ENV LANG C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \ 
    apt-get update && \
    apt-get install -y nodejs

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN bundle install && \
    rm -rf ~/.gem

ADD . $APP_ROOT

EXPOSE 3000
RUN if [ "RAILS_ENV" = "production" ]; then bundle exec rails assets:precompile; fi
CMD ["rails", "server", "-b", "0.0.0.0"]