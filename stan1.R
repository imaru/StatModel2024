library(rstan)

rstan_options(auto_write=TRUE)
options(mc.cores=parallel::detectCores())
rstan_options(auto_write = TRUE)


dat <- read.csv('dat1.csv')

data_list<-list(k=dat$tf, N=10, n=nrow(dat))

mcmc_result<-stan(
  file='dat1.stan',
  data=data_list,
  seed=1,
  chains=3,
  iter=4000,
  warmup=1000,
  thin=1
)
print(mcmc_result, probs=c(0.025,0.5,0.975))
traceplot(mcmc_result)
stan_hist(mcmc_result)
stan_dens(mcmc_result)
