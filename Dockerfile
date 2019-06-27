FROM ruby:2.5.3
ENV LANG C.UTF-8

RUN apt-get update && \
  apt-get install -y  unzip && \
  CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
  wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/ && \
  unzip ~/chromedriver_linux64.zip -d ~/ && \
  rm ~/chromedriver_linux64.zip && \
  chown root:root ~/chromedriver && \
  chmod 755 ~/chromedriver && \
  mv ~/chromedriver /usr/bin/chromedriver && \
  sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
  sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get update && apt-get install -y nodejs google-chrome-stable

ENV ENTRYKIT_VERSION 0.4.0

RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && mv entrykit /bin/entrykit \
  && chmod +x /bin/entrykit \
  && entrykit --symlink

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

ADD . $APP_ROOT

EXPOSE 3000

RUN if [ "RAILS_ENV" = "production" ]; then bundle exec rails assets:precompile; fi

ENTRYPOINT [ \
  "prehook", "ruby -v", "--", \
  "prehook", "bundle install -j3 --quiet", "--"]