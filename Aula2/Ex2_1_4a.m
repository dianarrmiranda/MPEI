clear all

N=1e5;
n=23;

datas = floor(rand (n,N)*365+1);

for col=1:N
  mesmoDia(col) = length(unique(datas(:,col))) < n;
end


pA = sum(mesmoDia)/N


%O n minimo para a probabilidade ser maior que 0.5 é n=23

%Alinea b

N=1e5;
n=41;

datas = floor(rand (n,N)*365+1);

for col=1:N
  mesmoDia(col) = length(unique(datas(:,col))) < n;
end

pB = sum(mesmoDia)/N


%Para a probabilidade ser maior que 0.9 temos n=41