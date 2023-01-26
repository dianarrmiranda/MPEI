function distancia = CalcDistance_MinHash(Set,numHash)
%MINHASH Summary of this function goes here
%   Detailed explanation goes here

Nu = length(Set);   %Nº elementos do Set (users)

%Nº linhas -> Nº users, Nº colunas -> Nº hash functions
assinaturas = Inf(Nu,numHash);  
h = waitbar(0,'Calculating');

tic
for i = 1:Nu
    waitbar(i/Nu,h);
    Nfilmes = length(Set{i});   %Nº filmes do user
    for j = 1:Nfilmes
        key = num2str(Set{i}(j));
        h_out = DJB31MA_Modified(key,127,numHash);
        assinaturas(i,:) = min(h_out,assinaturas(i,:));
    end
end
delete (h)
toc
    for n1= 1:Nu
        for n2=n1+1:Nu
            distancia(n1,n2)=1-sum(assinaturas(n1,:)==assinaturas(n2,:))/numHash;
        end
    end

end