
p = 1/1000;
n = 8000;
lambda = n*p;
k = 7;

bin = nchoosek(n,k)*(p^k)*(1-p)^(n-k); %nchoosek -> combinaçao      %a)
%disp(bin);

poi = (lambda^k)*(exp(-lambda))/factorial(k);  % b)
%disp(poi);

