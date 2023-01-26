N = 100000;

fam = rand(2,N) < 0.5;

%Os dois rapazes 
cfav1 = sum(sum(fam)== 2);

p1 = cfav1/N;

% 1 ser rapaz
cfav2 = sum(sum(fam) >= 1);

p2 = cfav2/N;

% Sabendo que um é rapaz, qual a probabilidade de o outro também ser?

p = cfav1/cfav2

teorico = (1/4)/(3/4) % P(B|A) = P(BcomA) / P(A)
                      % MF, FM, MM - 1/3