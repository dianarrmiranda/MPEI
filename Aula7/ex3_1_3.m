%% Exercício 3 - 
clear;
%% Alínea a)

T = zeros(20,20);

for k = 1 : 20
  r = rand(1, 20);
  r = r / sum(r);
  
  T(:,k) = r';
end

% Verificar se a matriz é estocática
soma = sum(T);
x = T>=0 & T<=1;

%fprintf("Alinea a) \nMatriz:\n")
%T

%fprintf("Verificação: \n")
%soma
%x

%% Alínea b)

vi = zeros(1,20);
vi(1) = 1;

v2 = T^2 * vi';

v5 = T^5 * vi';

v10 = T^10 * vi';

v100 = T^100 * vi';

fprintf("Alinea b) Estar no estado 20 após 2 transições: %0.5f \n", v2(20))
fprintf("          Estar no estado 20 após 5 transições: %0.5f \n", v5(20))
fprintf("          Estar no estado 20 após 10 transições: %0.5f \n", v10(20))
fprintf("          Estar no estado 20 após 100 transições: %0.5f \n", v100(20))

