#!/usr/bin/env node

const { version } = require('../package.json');

console.log('\x1b[32m', 'hello from', version, '\x1b[0m');
