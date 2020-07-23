# ianwalter/playwright-container
> A GitHub Action / Docker image for Playwright, the browser automation library

## About

Based on the [official Playwright Dockerfile][playwrightDockerfileUrl] but this
image uses the current Node.js release instead of LTS and Debian instead of
Ubuntu.

## Usage

Playwright will need to be launched with:

```js
playwright.chromium.launch({ args: ['--no-sandbox'] })
```

As a [GitHub Action][actionsUrl]:

```yml
name: CI
on:
  push:
    branches:
      - master
  pull_request:
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Install
        # NOTE: this pins the action to a specific commit sha for security
        # reasons but you can also use a version tag if desired. For example:
        # ianwalter/playwright-container@v1.1.1
        uses: ianwalter/playwright-container@ec253ce35910412cc6607f5d7cfbbe89fb77c9b4
        with:
          args: pnpm i
      - name: Test
        uses: ianwalter/playwright-container@ec253ce35910412cc6607f5d7cfbbe89fb77c9b4
        with:
          args: pnpm t
```

As a [Docker container][dockerUrl]:

```console
docker pull ianwalter/playwright:v1.1.1
```

## Related

* [`ianwalter/puppeteer-container`][puppeteerUrl] - A GitHub Action / Docker
  image for Puppeteer, the Headless Chrome Node API

## License

Apache 2.0 with Commons Clause - See [LICENSE][licenseUrl]

&nbsp;

Created by [Ian Walter](https://ianwalter.dev)

[playwrightDockerfileUrl]: https://github.com/microsoft/playwright/blob/master/docs/docker/Dockerfile.bionic
[actionsUrl]: https://github.com/features/actions
[dockerUrl]: https://hub.docker.com/r/ianwalter/playwright
[puppeteerUrl]: https://github.com/ianwalter/puppeteer-container
[licenseUrl]: https://github.com/ianwalter/playwright-container/blob/master/LICENSE
