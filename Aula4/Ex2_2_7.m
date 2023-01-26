clear all


lambda = 15;

k = 0;

%Alinea a)

Px = (lambda^k * exp(-lambda))/factorial(k);


%Alinea b)
soma=0;

for i=0:10
    px = (lambda^i * exp(-lambda))/factorial(i);
    soma = soma + px;
end

probMaisDe10 = 1-soma;

fprintf("Probabilidade não receber nenhuma mensagem = %d \n", Px)
fprintf("Probabilidade de receber mais de 10 mensagens = %0.4f \n", probMaisDe10)