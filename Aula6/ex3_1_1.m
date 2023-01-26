
%% Matriz probabilidade de transição
    % p   f    
M = [0.7 0.8; %p
    0.3 0.2]; %f

%% Verificar se a matriz é estocática
sum(M);
M>=0 & M<=1;

%% Alinea a -
%Vetor estado inical - probabilidade de estar presente quarta atual
v = [1
     0];

v2 = M * v; %probalidade de sexta

v3 = M * v2; %probabilidade da quarta seguinte

fprintf("Alinea a) Probabilidade? %0.4f\n", v3(1))

%% Alinea b - 
%Vetor estado inical - probabilidade de não estar quarta atual
v1 = [0
     1];

v4 = M^2 * v1; %probabilidade da quarta seguinte

fprintf("Alinea b) Probabilidade? %0.4f\n", v3(1))

%% Alinea c - 

v5 = M^29 * v; %probabilidade do ultimo dia

fprintf("Alinea c) Probabilidade? %0.4f\n", v5(1))

%% Alinea d - 

%Vetor estado inical
vd = [0.85
      0.15];
probs = zeros(1,30);
probs(1) = vd(2);

for i=1:29
    vetores = M^i * vd;
    probs(i+1) = vetores(2);
end

plot(1:30, probs);


fprintf("Alinea d) Gráfico \n")





