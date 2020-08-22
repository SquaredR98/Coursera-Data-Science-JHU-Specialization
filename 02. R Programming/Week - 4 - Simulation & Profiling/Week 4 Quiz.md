# Week 4 Quiz

**Question 1**

What is produced at the end of this snippet of R code?

```r
set.seed(1)
rpois(5, 2)
```

- [ ] A vector with the numbers 3.3, 2.5, 0.5, 1.1, 1.7
- [ ] It is impossible to tell because the result is random
- [x] A vector with the numbers 1, 1, 2, 4, 1
- [ ] A vector with the numbers 1, 4, 1, 1, 5

**Question 2**

What R function can be used to generate standard Normal random variables?

- [x] `rnorm`
- [ ] `qnorm`
- [ ] `dnorm`
- [ ] `pnorm`

**Question 3**

When simulating data, why is using the set.seed() function important? Select all that apply.

- [ ] It can be used to generate non-uniform random numbers.
- [ ] It ensures that the sequence of random numbers is truly random.
- [x] It can be used to specify which random number generating algorithm R should use, ensuring consistency and reproducibility.
- [ ] It ensures that the random numbers generated are within specified boundaries.

**Question 4**

Which function can be used to evaluate the inverse cumulative distribution function for the Poisson distribution?

- [ ] `rpois`
- [ ] `dpois`
- [x] `qpois`
- [ ] `ppois`

**Question 5** 

What does the following code do?

```R
set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
```

- [ ] Generate uniformly distributed random data
- [x] Generate data from a Normal linear model
- [ ] Generate random exponentially distributed data
- [ ] Generate data from a Poisson generalized linear model

**Question 6**

What R function can be used to generate Binomial random variables?

- [ ] `pbinom`
- [ ] `dbinom`
- [ ] `qbinom`
- [x] `rbinom`

**Question 7**

What aspect of the R runtime does the profiler keep track of when an R expression is evaluated?

- [ ] the global environment
- [ ] the package search list
- [x] the function call stack
- [ ] the working directory

**Question 8**

Consider the following R code

```r
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
```

(Assume that y, x1, and x2 are present in the workspace.) Without running the code, what percentage of the run time is spent in the 'lm' function, based on the `by.total` method of normalization shown in `summaryRprof()`?

- [x] 100%
- [ ] 23%
- [ ] 50%
- [ ] It is not possible to tell

9.Question 9

When using `system.time()`, what is the user time?

- [ ] It is the time spent by the CPU waiting for other tasks to finish
- [x] It is the time spent by the CPU evaluating an expression
- [ ] It is the "wall-clock" time it takes to evaluate an expression
- [ ] It is a measure of network latency

10.Question 10

If a computer has more than one available processor and R is able to take advantage of that, then which of the following is true when using `system.time()`?

- [ ] elapsed time is 0
- [ ] user time is always smaller than elapsed time
- [ ] user time is 0
- [x] elapsed time may be smaller than user time