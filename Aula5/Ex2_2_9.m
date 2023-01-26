clear;

N = 1e5;

dp = 2;
media = 14;

a = 12;
b = 16;


X = randn(1, N) * dp+media;

m = mean(X);
s=std(X);

%alinea a -

cf = sum(X>12 & X<16);

pA = cf/N

%pt = normcdf(16,14,2) - normcdf(12,14,2) %valor teórico

%alinea b -

cf = sum(X>10 & X<18);

pB = cf/N
%pt = normcdf(18,14,2) - normcdf(10,14,2) %valor teórico

%alinea c -

cf = sum(X>=10);

pC = cf/N
%pt = normcdf(10,14,2) %valor teórico



