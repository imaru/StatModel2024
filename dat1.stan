
// N: num of questions, n: num of observations, k: num of correct answer
data {
  int N;
  int n;
  int k;
}

// 
parameters {
  real<lower=0, upper=1> theta;
}

// explicitly define prior distribution
model {
    theta ~ uniform(0, 1);
    k~binomial(N,theta);
}
