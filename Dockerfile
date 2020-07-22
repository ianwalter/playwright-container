FROM ianwalter/pnpm:v1.0.0

LABEL "com.github.actions.name"="Playwright Container"
LABEL "com.github.actions.description"="A GitHub Action / Docker image for Playwright, the browser automation library"
LABEL "com.github.actions.icon"="globe"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="http://github.com/ianwalter/playwright-container"
LABEL "homepage"="http://github.com/ianwalter/playwright-container"
LABEL "maintainer"="Ian Walter (https://ianwalter.dev)"

#
RUN mkdir -p /opt/playwright-browsers
ENV PLAYWRIGHT_BROWSERS_PATH /opt/playwright-browsers

#
RUN cd $PLAYWRIGHT_BROWSERS_PATH && pnpm add playwright --save-dev && cd $HOME
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD true
