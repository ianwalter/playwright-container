FROM node:18-buster

LABEL "com.github.actions.name"="Playwright Container"
LABEL "com.github.actions.description"="A GitHub Action / Docker image for Playwright, the browser automation library"
LABEL "com.github.actions.icon"="globe"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/ianwalter/playwright-container"
LABEL "homepage"="http://github.com/ianwalter/playwright-container"
LABEL "maintainer"="Ian Walter (https://ianwalter.dev)"

# 1. Install WebKit dependencies.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libwoff1 \
    libopus0 \
    libwebp6 \
    libwebpdemux2 \
    libenchant1c2a \
    libgudev-1.0-0 \
    libsecret-1-0 \
    libhyphen0 \
    libgdk-pixbuf2.0-0 \
    libegl1 \
    libnotify4 \
    libxslt1.1 \
    libevent-2.1-6 \
    libgles2 \
    libvpx5 \
    libxcomposite1 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libepoxy0 \
    libgtk-3-0 \
    libharfbuzz-icu0

# 2. Install gstreamer and plugins to support video playback in WebKit.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgstreamer-gl1.0-0 \
    libgstreamer-plugins-bad1.0-0 \
    gstreamer1.0-plugins-good \
    gstreamer1.0-libav

# 3. Install Chromium dependencies.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libnss3 \
    libxss1 \
    libasound2 \
    fonts-noto-color-emoji \
    libxtst6

# 4. Install Firefox dependencies.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libdbus-glib-1-2 \
    libxt6

# 5. Install ffmpeg to bring in audio and video codecs necessary for playing
#    videos in Firefox.
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg

# 6. (Optional) Install XVFB if there's a need to run browsers in headful mode.
RUN apt-get update && apt-get install -y --no-install-recommends \
    xvfb

# 7. Create a directory where the browsers will be installed.
RUN mkdir -p /opt/playwright-browsers
ENV PLAYWRIGHT_BROWSERS_PATH /opt/playwright-browsers/

# 8. Install Playwright and the browsers.
COPY package.json yarn.lock $PLAYWRIGHT_BROWSERS_PATH
RUN cd $PLAYWRIGHT_BROWSERS_PATH && yarn --prod && cd $HOME
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD true
