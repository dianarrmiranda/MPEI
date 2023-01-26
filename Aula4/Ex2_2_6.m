clear;

N = 1e5;

experiencias = rand(8000,N) < 1/1000;

cfav = sum(sum(experiencias) == 7);
prob = cfav / N;

n=8000;
p=0.001;
k = 7;

%Aliena a)
% Pela distribuição binomial

Fx = nchoosek(n,k) * p^k * (1-p)^(n-k);

%Aliena b)
% Pela aproximação de Poisson

lambda = n * p;
Px = (lambda^k * exp(-lambda))/factorial(k);

fprintf("Probabilidade aleatória = %0.4f \n", prob)
fprintf("Probabilidade pela distribuição binomial = %0.4f \n", Fx)
fprintf("Probabilidade pela aproximação de Poisson = %0.4f \n", Px)