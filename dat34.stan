
// N: num of questions, n: num of observations, k: num of correct answer
data {
  int n;
  int k;
}

// 
parameters {
  real<lower=0, upper=1> theta;
  real<lower=0, upper=1> thetaprior;
  //real delta;
}

// explicitly define prior distribution
model {
    //theta ~ uniform(0, 1);
    theta ~ beta(1, 1);
    //delta ~ theta1 - theta2;
    k~binomial(n,theta);
    thetaprior ~ beta(1, 1);
    
}

generated quantities{
  int postpredk;
  int priorpredk;
  postpredk = binomial_rng(n, theta); // stanでの二項分布に従う乱数生成関数
  priorpredk = binomial_rng(n, thetaprior); 
}
