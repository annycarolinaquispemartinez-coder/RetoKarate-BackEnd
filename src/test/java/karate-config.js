function fn() {
  var env = karate.env; // get system property 'karate.env'
  var baseurl = '';
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    baseurl = 'https://serverest.dev';
  } else if (env == 'e2e') {
    // customize
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    baseurl: baseurl
  }
  return config;
} 