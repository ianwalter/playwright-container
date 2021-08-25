import { test } from '@ianwalter/bff'

test('My personal site', async t => {
  const { page } = await t.chromium({ args: ['--no-sandbox'] })
  await page.goto('https://ianwalter.dev')
  t.expect(await page.innerText('body')).toContain('Ian Walter')
})
