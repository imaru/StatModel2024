
// The input data is a vector 'y' of length 'N'.
data {
  int<lower=1> n;
  int<lower=1> m;
  matrix[n,m] x;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[n] mu;
  //real sigma;
  real<lower=0,upper=10> sigma;
}


model {
  for (i in 1:n){
    for (j in 1:m){
       x[i,j]~normal(mu[i], sigma);      
    }
  }
  //x ~ normal(mu, sigma);
  // prior
  
  for (i in 1:n){
    mu[i] ~ uniform(1,300);
  }
  sigma ~ uniform(0,100);
}



