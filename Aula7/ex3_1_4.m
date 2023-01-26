clear;

%% Exercício 4-

%% Aliena A)

p = 0.4;
q = 0.6;
    %A B C D 
T = [p^2 0 0 q^2
     (1-p)^2 0 0 q*(1-q)
     p*(1-p) 0 0 q*(1-q)
     p*(1-p) 1 1 (1-q)^2];

% Verificar se a matriz é estocática
soma = sum(T);
x = T>=0 & T<=1;

%fprintf("Verificação: \n")
%soma
%x

fprintf("Alinea a) Matriz:\n ")
T

%% Alinea B)

%Vetor inicial
va = [1
      0
      0
      0];

format rat

fprintf("Alinea b) \n")

va5 = T^5 * va;

fprintf(" Probabilidade de estado A depois de 5 transições: %0.3f \n", va5(1))
fprintf(" Probabilidade de estado B depois de 5 transições: %0.3f \n", va5(2))
fprintf(" Probabilidade de estado C depois de 5 transições: %0.3f \n", va5(3))
fprintf(" Probabilidade de estado D depois de 5 transições: %0.3f \n", va5(4))

va10 = T^10 * va;

fprintf("\n Probabilidade de estado A depois de 10 transições: %0.3f \n", va10(1))
fprintf(" Probabilidade de estado B depois de 10 transições: %0.3f \n", va10(2))
fprintf(" Probabilidade de estado C depois de 10 transições: %0.3f \n", va10(3))
fprintf(" Probabilidade de estado D depois de 10 transições: %0.3f \n", va10(4))

va100 = T^100 * va;

fprintf("\n Probabilidade de estado A depois de 100 transições: %0.3f \n", va100(1))
fprintf(" Probabilidade de estado B depois de 100 transições: %0.3f \n", va100(2))
fprintf(" Probabilidade de estado C depois de 100 transições: %0.3f \n", va100(3))
fprintf(" Probabilidade de estado D depois de 100 transições: %0.3f \n", va100(4))

va200 = T^200 * va;

fprintf("\n Probabilidade de estado A depois de 200 transições: %0.3f \n", va200(1))
fprintf(" Probabilidade de estado B depois de 200 transições: %0.3f \n", va200(2))
fprintf(" Probabilidade de estado C depois de 200 transições: %0.3f \n", va200(3))
fprintf(" Probabilidade de estado D depois de 200 transições: %0.3f \n", va200(4))


%% Alínea C)

M = [T-eye(size(T));
     ones(1,4)];

b = [0 0 0 0 1]';

u = M\b;

fprintf("Alinea c) \n")
fprintf(" Probabilidade limite do estado A: %0.3f \n", u(1))
fprintf(" Probabilidade limite do estado B: %0.3f \n", u(2))
fprintf(" Probabilidade limite do estado C: %0.3f \n", u(3))
fprintf(" Probabilidade limite do estado D: %0.3f \n", u(4))





