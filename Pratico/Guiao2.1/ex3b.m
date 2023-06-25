
N= 10000;
T = 1000;
k = 10:10:100;

pro = zeros(length(k));


for i=1:length(k)
    expe = randi(1000,k(i),N);
    suc = zeros(0,N);
    for h=1:N
        suc(h) = (length(unique(expe(:,h))) ~= k(i)) ;
    end
    res = sum(suc)/N;
    pro(i) = res;
end

plot(pro)