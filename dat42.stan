
// The input data is a vector 'y' of length 'N'.
data {
  int<lower=1> n;
  vector[n] x;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real mu;
  vector<lower=0>[n] lambda;
  //real<lower=0,upper=10> sigma;
}


transformed parameters {
  vector[n] sigma;
    for (i in 1:n){
      sigma[i] = 1/sqrt(lambda[i]);
  }
}

model {
  for (i in 1:n){
     x[i]~normal(mu, sigma[i]);
  }
  //x ~ normal(mu, sigma);
  // prior
  mu ~ normal(0, sqrt(1000));
  for (i in 1:n){
    lambda[i] ~ gamma(.001, .001);  
  }
}



