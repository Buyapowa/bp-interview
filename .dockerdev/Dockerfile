ARG RUBY_VERSION
ARG DISTRO_NAME=bookworm

FROM ruby:$RUBY_VERSION-slim-$DISTRO_NAME

ARG DISTRO_NAME

# Common dependencies
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  --mount=type=tmpfs,target=/var/log \
  rm -f /etc/apt/apt.conf.d/docker-clean; \
  echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache; \
  apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
  build-essential \
  gnupg2 \
  curl \
  wget \
  less \
  git \
  vim \
  iputils-ping \
  netcat-openbsd \
  unzip \
  libyaml-dev

# Install PostgreSQL dependencies
ARG PG_MAJOR
RUN curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  gpg --dearmor -o /usr/share/keyrings/postgres-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/postgres-archive-keyring.gpg] https://apt.postgresql.org/pub/repos/apt/" \
  $DISTRO_NAME-pgdg main $PG_MAJOR | tee /etc/apt/sources.list.d/postgres.list > /dev/null
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  --mount=type=tmpfs,target=/var/log \
  apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
  libpq-dev \
  postgresql-client-$PG_MAJOR

# Install NodeJS and Pnpm
ARG NODE_MAJOR
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  --mount=type=tmpfs,target=/var/log \
  curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash - && \
  apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends nodejs
RUN npm install -g pnpm@10.4.0
ENV PATH=/app/node_modules/.bin:$PATH

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  --mount=type=tmpfs,target=/var/log \
  apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq chromium chromium-driver

# Configure bundler
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

# Store Bundler settings in the project's root
ENV BUNDLE_APP_CONFIG=.bundle

# Upgrade RubyGems and install the latest Bundler version
RUN gem update --system && \
  gem install bundler

# Create a directory for the app code
RUN mkdir -p /app
WORKDIR /app

# Document that we're going to expose port 3000
EXPOSE 3000
# Use Bash as the default command
CMD ["/usr/bin/bash"]
