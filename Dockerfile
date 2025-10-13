FROM ruby:3.4.7-slim
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends  \
    build-essential \
    curl \
    git \
    libyaml-dev \
    libpq-dev \
    postgresql-client \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

WORKDIR /app
RUN gem install bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
