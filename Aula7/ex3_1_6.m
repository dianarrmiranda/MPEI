%% Exercício 6 - 

%% Alínea a)
    %1   2  4  3  5
T = [0.8 0 0.3 0 0    %1
     0.2 0.6 0.2 0 0  %2
     0 0.1 0.4 0 0    %4
     0 0.3 0 1 0      %3
     0 0 0.1 0 1];    %5


% Verificar se a matriz é estocática
soma = sum(T);
x = T>=0 & T<=1;

%fprintf("Verificação: \n")
%soma
%x

fprintf("Alinea a) Matriz:\n ")
T
%% Alínea b)

n = 1:100;
vi = [1 0 0 0 0]';  %Vetor inicial 

probs = zeros(1,100);

for i=1:length(n)
    v = T^i * vi;
    probs(i) = v(2);
end
figure(1)
plot(n, probs)
xlabel("n")
ylabel("probs")
title("Alínea b")

%Tende para zero pois como n é muito grande o estado vai acabar num estado
%absorvente, o estado 2 é transiente logo vai tender para zero

%% Alínea c)

n = 1:100;
vi = [1 0 0 0 0]'; %Vetor inicial 

probs3 = zeros(1,100);
probs5 = zeros(1,100);

for i=1:length(n)
    v3 = T^i * vi;
    v5 = T^i * vi;
    probs3(i) = v3(4);
    probs5(i) = v5(5);
end
figure(2)
plot(n, probs3, "r")
hold on
plot(n, probs5, "b")
xlabel("n")
ylabel("probs")
legend("Estar no estado 3", "Estar no estado 5")
title("Alinea c")
hold off


%% Alínea d)

%Q
nena = 3; %Número de estados não absorventes
Q=T(1:nena,1:nena)


%% Alínea e)

%F
aux= eye(size(Q)) - Q; %Matriz identidade - Q
F= inv(aux)

%por exemplo F(1,1) diz o número de vezes que passamos no estado 1 sabendo
%que começámos no estado 1.

%% Alínea f)

t = sum(F)'; %ou F' * ones(3,1)

fprintf("Alínea f) \n")
fprintf("  Número de passos médio até absorção começando no estado 1: %f\n", t(1))
fprintf("  Número de passos médio até absorção começando no estado 2: %f\n", t(2))
fprintf("  Número de passos médio até absorção começando no estado 4: %f\n", t(3))

%% Alínea g)

R = T(nena+1:end,1:nena)
B = R*F

fprintf("Alínea g) \n")
fprintf("  Começando no estado 1, a probabilidade de absorção do estado 3: %f\n", B(1,1))
fprintf("  Começando no estado 1, a probabilidade de absorção do estado 5: %f\n", B(2,1))

