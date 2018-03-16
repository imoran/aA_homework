const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  reader.question('Would you like some tea?', (res) => {
    const firstRes = (res === 'yes') ? 'do' : 'don\'t';
    console.log(`You replied ${res}.`);
  reader.question('Would you like some biscuits?', (res2) => {
    const secondRes = (res2 === 'yes') ? 'do' : 'don\'t';
    console.log(`You replied ${res2}.`);

    console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
    reader.close();
    });
  });
}

teaAndBiscuits();
