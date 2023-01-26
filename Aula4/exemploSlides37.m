clear all

lambda =3.2;

k = 0;

soma=0;

for i=0:7
    Px = (lambda^i * exp(-lambda))/factorial(i);
    soma = soma + Px;
end

res = 1-soma