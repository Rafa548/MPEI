%a
lambda = 15; % msg/s  dependendo do tempo altera-se
k = 0;
n = 15;

poi_a = (lambda^k)*(exp(-lambda))/factorial(k)


%b
poi_b = 0;

for k_2 = 0:10
    poi_b = poi_b + (lambda^k_2)*(exp(-lambda))/factorial(k_2);
end

poi_b_f = 1- poi_b