const { test } = require('@ianwalter/bff')

test('My personal site', async t => {
  await t.page.goto('https://ianwalter.dev')
  t.expect(await t.page.innerText('body')).toContain('Ian Walter')
})
