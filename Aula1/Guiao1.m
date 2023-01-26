%Guião 1 

%Exercício 1 - 

N = 100000;

%Simula em matlab resultado de 3 moedas (1=Caras)
M = rand(3,N);
lancamentos = M>0.5;

%Casos favoráveis são os lancamentos com 2 caras
num_caras = sum(lancamentos); %soma cada coluna

x = num_caras == 2;

cFav = sum(x);

%Probabilidade
p1 = cFav/N 
p1t = probTeorico(2,3,0.5)

%Exercício 2 -
N=100000;

M = rand(15,N);
lancamentos = M>0.5;

num_caras = sum(lancamentos);

x = num_caras == 6;

cFav = sum(x);

p2 = cFav/N
p2t = probTeorico(6,15,0.5)

%Exercicio 3 - 
N=100000;

M = rand(15,N);
lancamentos = M>0.5;

num_caras = sum(lancamentos);

x = num_caras >= 6;

cFav = sum(x);

p3 = cFav/N

%Exercicio 4 - 
    n = 20;
    p = 0.5;
    N = 1e6;

    %20 Lancamentos
    vp = zeros(1, n+1);
    for k = 0:n
      vp(k+1) = prob(k, n, p, N);
    end
    stem(0:n, vp)

    %40 Lancamentos
    n = 40;
    p = 0.5;
    N = 1e6;

    vp = zeros(1, n+1);
    for k = 0:n
      vp(k+1) = prob(k, n, p, N);
    end
    stem(0:n, vp)

    %100 Lancamentos
    n = 100;
    p = 0.5;
    N = 1e6;

    vp = zeros(1, n+1);
    for k = 0:n
      vp(k+1) = prob(k, n, p, N);
    end
    stem(0:n, vp)

%Exercicio 5 - é a probabilidade teórica

%Exercicio 6 -


