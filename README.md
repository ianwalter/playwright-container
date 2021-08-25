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
      - main
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
        # ianwalter/playwright-container@v3.0.0
        uses: ianwalter/playwright-container@43940dfa7d309fe3569b9df407ae9e84dcbf2e7f
        with:
          args: npm ci
      - name: Test
        uses: ianwalter/playwright-container@43940dfa7d309fe3569b9df407ae9e84dcbf2e7f
        with:
          args: npm test
```

As a [Docker container][dockerUrl]:

```console
docker pull ianwalter/playwright:v3.0.0
```

## Related

* [`@ianwalter/bff`][bffUrl] - Your friendly test framework

## License

Apache 2.0 with Commons Clause - See [LICENSE][licenseUrl]

&nbsp;

Created by [Ian Walter](https://ianwalter.dev)

[playwrightDockerfileUrl]: https://github.com/microsoft/playwright/blob/master/docs/docker/Dockerfile.bionic
[actionsUrl]: https://github.com/features/actions
[dockerUrl]: https://hub.docker.com/r/ianwalter/playwright
[bffUrl]: https://github.com/ianwalter/bff
[puppeteerUrl]: https://github.com/ianwalter/puppeteer-container
[licenseUrl]: https://github.com/ianwalter/playwright-container/blob/master/LICENSE
