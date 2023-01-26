%% 4. Cálculo da distância com MinHash

%% Processar dados
numHash = 3000;   %Nº funções de dispersão
[Set,Nu,users,u] = create_structure("u.data");


%%
threshold = 0.4;
distancia = CalcDistance_MinHash(Set,numHash);
similares = pairs(Nu,distancia,threshold, users);

%% Mostrar Resultados
[N, ~] = size(similares);
for k= 1:N
  fprintf("Distância: %f  (user 1: %d , user 2: %d)\n",similares(k,3),similares(k,1),similares(k,2));
end

