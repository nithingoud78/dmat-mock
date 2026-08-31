const fs = require('fs');
const files = [
  'src/routes/terms-and-conditions.tsx',
  'src/routes/privacy-policy.tsx',
  'src/routes/feedback.tsx',
  'src/routes/disclaimer.tsx',
  'src/routes/cookie-policy.tsx',
  'src/routes/about.tsx'
];
for (const file of files) {
  let content = fs.readFileSync(file, 'utf8');
  content = content.replace(/import \{ AdSlot \} from \"@\/components\/ads\/AdSlot\";\n/g, '');
  content = content.replace(/import \{ adsConfig \} from \"@\/config\/ads\";\n/g, '');
  content = content.replace(/<AdSlot[^\>]*\/>\n?/g, '');
  fs.writeFileSync(file, content);
}
