
const fs = require('fs');

const oldParser = String(fs.readFileSync('./dimacs.cjs.js')).split('\n');

const newFooter = `
export {
  peg$SyntaxError as SyntaxError,
  peg$parse       as parse
};
`

const newParser = oldParser.slice(0, oldParser.length-5).join('\n') + newFooter;

fs.writeFileSync('./dimacs.esm.js', newParser);
