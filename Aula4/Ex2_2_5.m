clear;

N = 1e5;

p= logspace(-3,log10(1),100); %matriz 1 por 100, com 100 valores entre 0 e 1
%que são praticamente todas as probabilidades que podem haver

for i=1:100
    experiencias = rand(4,N) < p(i);
    cfav2 = sum(sum(experiencias(1:2,:)) == 2);
    probabilidadeDespenhar2(i) = cfav2/N;

    %Com 4 motores
    cfav4 = sum(sum(experiencias) > 2);

    probabilidadeDespenhar4(i) = cfav4/N;
end

plot(p,probabilidadeDespenhar2)
hold on
plot(p,probabilidadeDespenhar4)
hold off
xlabel("Probabilidade p")
ylabel("Probabilidade do avião se despenhar")
legend("Avião com 2 motores", "Avião com 4 motores")