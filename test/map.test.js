const fs = require('fs');
const path = require('path');
const html = fs.readFileSync(path.join(__dirname, '..', 'index.html'), 'utf8');
if (!html.includes('https://unpkg.com/leaflet')) {
  console.error('Leaflet script not found');
  process.exit(1);
}
if (!html.includes('id="map"')) {
  console.error('Map container missing');
  process.exit(1);
}
