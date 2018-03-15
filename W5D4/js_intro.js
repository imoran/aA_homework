function madLib(verb, adj, noun) {
  let new_verb = verb.toUpperCase();
  let new_adj = adj.toUpperCase();
  let new_noun = noun.toUpperCase();
  console.log(`We shall ${new_verb} the ${new_adj} ${new_noun}`)
}


function isSubstring(searchString, subString) {
  var split_str = splitsearchString.split(' ').forEach

  split_str.forEach(function(el) {
    if el === subString {
      return true
    }
  });
  return false
}

function fizzBuzz(array) {
  const arr = [];

  array.forEach(function(el) {
    if el % 3 === 0 {
      arr.push(el);
    } else if el % 5 === 0 {
      arr.push(el);
    }
  })
  return arr;
}


function isPrime (n) {
  if (n < 2) { return false; }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes (n) {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
    i++;
  }
  return sum;
}
