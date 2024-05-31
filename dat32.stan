
// N: num of questions, n: num of observations, k: num of correct answer
data {
  int n1,n2;
  int k1,k2;
}

// 
parameters {
  real<lower=0, upper=1> theta1;
  real<lower=0, upper=1> theta2;
  //real delta;
}

// explicitly define prior distribution
model {
    //theta ~ uniform(0, 1);
    theta1 ~ beta(1, 1);
    theta2 ~ beta(1, 1);
    //delta ~ theta1 - theta2;
    
    k1~binomial(n1,theta1);
    k2~binomial(n2,theta2);
}

generated quantities{
  real delta;
  delta = theta1 - theta2;
  
}
