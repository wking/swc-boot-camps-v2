from numpy import savetxt
from numpy.random import uniform

nums = uniform(0.0,1.0,1000000)
savetxt('inpute6.dat',nums)

