clear all

%A = "Inclui pelo menos 1 um"
%B = "Inclui pelo menos 1 dois"
%P(A|B)


N = 1e5;
n = 2;

sequencias = randi([1,3],n,N);

%Incluir pelo menos um 2

cfavB = 0;

for col=1:N
    if sequencias(1,col) == 2 || sequencias(2,col) == 2
        cfavB = cfavB + 1;
    end
end

probB = cfavB/N;

%Incluir um dois e 1 um

cfavAcomB = 0;

for col=1:N
    if (sequencias(1,col) == 1 && sequencias(2,col) == 2) || (sequencias(1,col) == 2 && sequencias(2,col) == 1)
        cfavAcomB = cfavAcomB + 1;
    end
end

probAcomB = cfavAcomB/N;

probFinal = probAcomB/probB
