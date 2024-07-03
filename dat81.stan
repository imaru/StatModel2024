
// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> n;
  vector[n] x;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real sigmatmp;
  real delta;
}

transformed parameters{
  real mu;
  real<lower=0> sigma;

  sigma = abs(sigmatmp);
  mu = delta * sigma;
}


model {
  sigmatmp ~ cauchy(0,1);
  delta ~ cauchy(0,1);
  x ~ normal(mu, sigma);
}



