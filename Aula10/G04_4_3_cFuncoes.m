clear;

% Criar Estrutura

[Set, Nu, users] = create_structure('u.data');

% Calcular distância
J = calcDistancia(Nu, Set);

% Calcular Pares

threshold = 0.4;

SimilarUsers = pairs(Nu, J, threshold, users)
