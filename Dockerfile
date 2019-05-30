FROM ruby:2.5.3

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN bundle install && \
    rm -rf -/.gem

ADD . $APP_ROOT

EXPOSE 3000
RUN RAILS_ENV=production rails assets:precompile
CMD ["rails", "server", "-b", "0.0.0.0"]