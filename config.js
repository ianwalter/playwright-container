// FIXME: Replace with bff-playwright module.
module.exports = {
  async beforeEach (file, context) {
    // Launch a Playwright browser instance and create a new page.
    const playwright = require('playwright')
    context.testContext.browser = await playwright.chromium.launch({
      args: ['--no-sandbox']
    })
    const browserContext = await context.testContext.browser.newContext()
    context.testContext.page = await browserContext.newPage()
  },
  async afterEach (file, context) {
    if (context.testContext.browser) await context.testContext.browser.close()
  }
}
