# This application was built on v1, and last supported version on v1 is 16.xx
# 16.20-bullseye is the last supported version on v16, so I am using that.
FROM node:16.20-bullseye

# 1. Setting up Work Directory as /app
WORKDIR /app

# 2. Setting Environment Variables
ENV DEBIAN_FRONTEND=noninteractive \
  DEBCONF_NONINTERACTIVE_SEEN=true

# 3. Update Distribution (CVE's)
RUN set -euxfab; \
  apt-get -yqq update;

# 4. Copy Entire Folder
COPY . /app

# 5. Run npm install
RUN set -euxfab; \
  npm install

# 6. Copy Environment Variables
COPY .env.example /app/.env

# 7. Entry Point
ENTRYPOINT ["/bin/bash", "-c", "npm start;"]
