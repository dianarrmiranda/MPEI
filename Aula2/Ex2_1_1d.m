
N=100000;

%O primeiro ser rapaz

fam = rand(1,N) < 0.5;

cfav1 = sum(fam == 1);

%O segundo também ser rapaz
fam(2,:) =  rand(1,N) < 0.5;

cfav2 = sum(sum(fam) == 2);

p = cfav2/cfav1

pTeorico = 1/2 % MM, MF