%a
N= 10000;
T = 1000;
k = 10;

expe = randi(T,k,N);
suc = zeros(0,N);
for i=1:N
    suc(i) = (length(unique(expe(:,i))) ~= k) ;
end
res = sum(suc)/N;
disp(res)
