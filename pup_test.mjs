import puppeteer from 'puppeteer';

(async () => {
  const browser = await puppeteer.launch({ headless: 'new' });
  const page = await browser.newPage();
  
  page.on('console', msg => console.log('PAGE LOG:', msg.text()));
  page.on('pageerror', err => console.log('PAGE ERROR:', err.toString()));
  
  console.log('Navigating...');
  await page.goto('http://localhost:5174/practice/figure-sequences', { waitUntil: 'networkidle2' });
  
  // Wait a bit to ensure rendering
  await new Promise(r => setTimeout(r, 2000));
  
  // Try clicking practice
  try {
    const btn = await page.evaluateHandle(() => {
      const btns = Array.from(document.querySelectorAll('button'));
      return btns.find(b => b.textContent.includes('Practice'));
    });
    if (btn) {
      console.log('Clicking practice...');
      await btn.click();
      await new Promise(r => setTimeout(r, 2000));
    }
  } catch(e) {
    console.log('Error clicking:', e);
  }

  await browser.close();
})();
