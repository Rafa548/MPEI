% para ver o tempo de execuçao escrever tic no inicio e toc no fim;
x = 0:1:5;
px = zeros(1,5);

N= 1e5; %numero de experiencias  
p = 0.3; %probabilidade de defeito
k = [0 1 2 3 4 5]; %numero de defeitos
n = 5; %numero de lancamentos


for i = 1:length(k)
    lancamentos = rand(n,N) > p;
    sucessos= sum(lancamentos)==k(i);
    probSimulacao= sum(sucessos)/N;
    px(i) = probSimulacao;
end

stem(x,px);