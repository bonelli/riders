const puppeteer = require('puppeteer');
const path = require('path');
(async () => {
  const browser = await puppeteer.launch({headless: 'new', args: ['--no-sandbox', '--ignore-certificate-errors']});
  const page = await browser.newPage();
  await page.goto('file://' + path.join(__dirname, '..', 'index.html'), {waitUntil: 'load'});
  await page.waitForSelector('#map', {timeout: 5000});
  await browser.close();
})();
