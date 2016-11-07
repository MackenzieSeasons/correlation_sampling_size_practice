library(tidyverse)

#NEW RESEARCH EXAMPLE

#in a new research area where a medium effect size seems reasonable, we don't know what sample size to use, so
#we go with N = 100, and r = .16 (medium effect size)

psych::r.con(r=.16, n=100)
#this gives us a CI of .38 (-.038, .35), let's try a bigger sample size

psych::r.con(r=.16, n=600)
#CI of [.24, .08], the difference is .16, better

#PAST RESEARCH EXAMPLE
#past research gets a correlation of r=.25, N=200

#this next (traditional) approach underestimates the needed sample size
psych::r.con(r=.25, n=100)
psych::r.con(r=.25, n=220)
#flawed because it assumes we'll get the same correlation in a new study as we did in the original

#now we're doing a safeguard approach (calculates a CI based on the original study, then use the lower bound in your sample size analysis)
psych::r.con(r=.25, n=200)
psych::r.con(r=.12, n=100)
#not small enough!
psych::r.con(r=.12, n=1000)
#we'd use a sample size of 1000

#POWER

#New Research Area
#we want a population correlation of .16, and a power of .80
library(pwr)
pwr.r.test(r=.16, power = .80)
#n = 303, thus, this is the sample size we need!

#now we do a tradiional power analysis and a safeguard power analysis, with an r = .25 and power = .80
pwr.r.test(r=.25, power = .80)
#need an n of 122
#now safeguard
psych::r.con(r=.25, n=200)
#CI of .11 to .38
pwr.r.test(r=.12, power=.80)
#need an n of 541

#traditional power analyses often result in a CI that is problematically wide

