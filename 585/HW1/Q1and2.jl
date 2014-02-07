
# 1) I've been able to get IJulia in the Osmond computer labs as well as Julia Studio on my own computer. I'll be primarily using Julia Studio.

# 2a)

srand(42);
N = 10000;
true_mean = 10000.;
y = true_mean + randn(N);
sample_mean = mean(y);
sample_var = var(y);
println("64bit: $sample_mean, $sample_var")

# 2b)

y32bit = convert(Array{Float32,1},y);
y16bit = convert(Array{Float16,1},y);

sample_mean32 = mean(y32bit);
sample_var32 = var(y32bit);
sample_mean16 = mean(y16bit);
sample_var16 = var(y16bit);
println("32bit: $sample_mean32, $sample_var32")
println("16bit: $sample_mean16, $sample_var16")

# 2c) Since N in this case is just the number of Gaussian-distributed values generated by the randn() function, it won't affect the number of significant digits. The variance may approach 0 and mean may approach true_mean imperceptibly. However, if we were to increase true_mean to 10^5 from 10^4, it will increase the number of significant digits by one, and the results will reflect this increase.

#2d)
#Increasing N
srand(42);
N = 100000;
true_mean = 10000.;
y = true_mean + randn(N);
sample_mean_a = mean(y);
sample_var_a = var(y);
println("Increasing N:")
println("64bit: $sample_mean_a, $sample_var_a")

y32bit = convert(Array{Float32,1},y);
y16bit = convert(Array{Float16,1},y);

sample_mean32_a = mean(y32bit);
sample_var32_a = var(y32bit);
sample_mean16_a = mean(y16bit);
sample_var16_a = var(y16bit);
println("32bit: $sample_mean32_a, $sample_var32_a")
println("16bit: $sample_mean16_a, $sample_var16_a")

#Increasing true_mean

srand(42);
N = 10000;
true_mean = 100000.;
y = true_mean + randn(N);
sample_mean_b = mean(y);
sample_var_b = var(y);
println("Increasing true_mean:")
println("64bit: $sample_mean_b, $sample_var_b")

y32bit = convert(Array{Float32,1},y);
y16bit = convert(Array{Float16,1},y);

sample_mean32_b = mean(y32bit);
sample_var32_b = var(y32bit);
sample_mean16_b = mean(y16bit);
sample_var16_b = var(y16bit);
println("32bit: $sample_mean32_b, $sample_var32_b")
println("16bit: $sample_mean16_b, $sample_var16_b")

#It appears that I was right, but I missed the crux of this exercise. By increasing the true_mean to 10^5, the 16-bit values started exhibiting errors, showing Inf and NaN for the mean and variance respectively.

#2e)
#This exercise illustrates the importance of keeping in mind the number format of any value used in a computation. I actually encountered this problem in the past week when having to calculate the Planck spectrum given a frequency and temperature, and there was underflow error because IDL defaults to single-precision floating point numbers rather than doubles. Upon making converting all numbers into double-precision, everything ran smoothly.


