const puppeteer = require('puppeteer');
const path = require('path');
(async () => {
  const browser = await puppeteer.launch({args:['--no-sandbox']});
  const page = await browser.newPage();
  const filePath = path.join(__dirname, '..', 'index.html');
  await page.goto('file://' + filePath);
  await page.waitForSelector('#map', {timeout: 5000});
  const hasMapContainer = await page.evaluate(() => !!document.querySelector('.leaflet-container'));
  if (!hasMapContainer) {
    console.error('Map did not initialize');
    process.exit(1);
  }
  await browser.close();
})();
