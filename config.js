import playwright from 'playwright'

// FIXME: Replace with bff-playwright module.
export default {
  async beforeEach (file, context) {
    // Launch a Playwright browser instance and create a new page.
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
