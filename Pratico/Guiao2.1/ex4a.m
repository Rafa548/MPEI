
N=10000;
n=1;
res = 0;
aux = 0;

while res < 0.5
    aux = 0;
    experiencias = randi([1 365],n,N);
    for i = 1:N
        %aux = aux + (length(unique(experiencias(:,i))) ~= n);  outra soluçao
        if (length(unique(experiencias(:,i))) < n)
            aux = aux + 1;
        end
    end
    res = sum(aux)/N;
    n= n+1;
end
disp(n-1);