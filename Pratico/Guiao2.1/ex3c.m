
N= 10000;
T = 100:100:1000;
k = 50;

pro = zeros(length(T));


for i=1:length(T)
    expe = randi(T(i),k,N);
    suc = zeros(0,N);
    for h=1:N
        suc(h) = (length(unique(expe(:,h))) ~= k) ;
    end
    res = sum(suc)/N;
    pro(i) = res;
end

stem(pro)