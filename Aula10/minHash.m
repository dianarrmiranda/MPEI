function assinaturas = minHash(Set,numHash)
%MINHASH Summary of this function goes here
%   Detailed explanation goes here

Nu = length(Set);   %Nº elementos do Set (users)

%Nº linhas -> Nº users, Nº colunas -> Nº hash functions
assinaturas = inf(Nu, numHash);
tic
x = waitbar(0,'A calcular minHash()...');
for k= 1 : Nu
    waitbar(k/Nu,x);
    filmsUser = Set{k};
    for j = 1:length(filmsUser)
        chave = char(filmsUser(j));
        for i = 1:numHash
            chave = [chave num2str(i)];
            h(i) = DJB31MA(chave, 127);
        end
        assinaturas(k, :) = min([assinaturas(k, :); h]);
    end
end
delete(x);
toc
end