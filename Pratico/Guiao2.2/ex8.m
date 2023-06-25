lambda = 0.02*100; %% o lambda era para 1 pagina logo é preciso multiplicar para ser para 100

n = 100;
poi = 0;

for k=0:1
    poi = poi + (lambda^k)*(exp(-lambda))/factorial(k);
end

poi