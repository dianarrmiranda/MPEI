clear all

N = 1e5;
n = 2;

sequencias = randi([1,3],n,N);

cfav = 0;

for col=1:N
    if sequencias(1,col) == 1 && sequencias(2,col) == 2
        cfav = cfav + 1;
    end
end

prob = cfav/N