%% Exercício 5 - 

%% Alínea a)
    %Sol Nuvens Chuva
T = [0.7 0.2 0.3
     0.2 0.3 0.3
     0.1 0.5 0.4];


% Verificar se a matriz é estocática
soma = sum(T);
x = T>=0 & T<=1;

%fprintf("Verificação: \n")
soma
%x

fprintf("Alinea a) Matriz:\n ")
T

%% Alínea b)

   %P(sol1) * P(sol1->Sol2) * P(sol2->sol3)
v = 1 * T(1,1) * T(1,1);

fprintf("\nAlinea b) \n")
fprintf(" Probabilidade de estar sol no segundo e no terceiro dia: %0.3f \n", v)


%% Alínea c) 

   %P(sol1) * P(sol1->chuva) * P(chuva->chuva)
vc = 1 * T(3,1) * T(3,3);
fprintf("\nAlinea c) \n")
fprintf(" Probabilidade de não chover no segundo nem no terceiro dia: %0.3f \n", 1-vc)

%% Alínea d) 

v = [1;0;0];

diasNuvens = 0;
diasSol = 1;
diasChuva = 0;
for i=2:31
    v = T * v;
    diasSol = diasSol + v(1);
    diasNuvens = diasNuvens + v(2);
    diasChuva = diasChuva + v(3);


end

fprintf("\nAlinea d) \n")
fprintf(" Média dias sol: %0.0f \n", diasSol)
fprintf(" Média dias nuvens: %0.0f \n", diasNuvens)
fprintf(" Média dias chuva: %0.0f \n", diasChuva)

%% Alínea e) 

v = [0;0;1];

diasNuvens = 0;
diasSol = 0;
diasChuva = 1;
for i=2:31
    v = T * v;
    diasSol = diasSol + v(1);
    diasNuvens = diasNuvens + v(2);
    diasChuva = diasChuva + v(3);
end

fprintf("\nAlinea e) \n")
fprintf(" Média dias sol: %0.0f \n", diasSol)
fprintf(" Média dias nuvens: %0.0f \n", diasNuvens)
fprintf(" Média dias chuva: %0.0f \n", diasChuva)

%% Alínea f)

v = [1;0;0];

pdores = 0;
for i=2:31
    v = T * v;
    pdores = pdores + (0.1* v(1) + 0.3*v(2) + 0.5*v(3));
end

fprintf("\nAlinea f) \n")
fprintf(" Se primeiro dia Sol, número de dias de dor: %0.0f \n", pdores)

v = [0;0;1];
pdores = 0;
for i=2:31
    v = T * v;
    pdores = pdores + (0.1* v(1) + 0.3*v(2) + 0.5*v(3));
end

fprintf(" Se primeiro dia chuva, número de dias de dor: %0.0f \n", pdores)

v = [0;1;0];
pdores = 0;
for i=2:31
    v = T * v;
    pdores = pdores + (0.1* v(1) + 0.3*v(2) + 0.5*v(3));
end

fprintf(" Se primeiro dia nuvens, número de dias de dor: %0.0f \n", pdores)


