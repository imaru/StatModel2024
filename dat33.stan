
// N: num of questions, n: num of observations, k: num of correct answer
data {
  int n1,n2;
  int k1,k2;
}

// 
parameters {
  real<lower=0, upper=1> theta;
  //real delta;
}

// explicitly define prior distribution
model {
    //theta ~ uniform(0, 1);
    theta ~ beta(1, 1);
    //delta ~ theta1 - theta2;
    
    k1~binomial(n1,theta);
    k2~binomial(n2,theta);
}

