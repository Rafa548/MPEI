%a
T = [0.8 0 0 0.3 0;   
    0.2 0.6 0 0.2 0;   
    0 0.3 1 0 0;       
    0 0.1 0 0.4 0;
    0 0 0 0.1 1];

N = 1e5;
Sum1 = 0;
Sum2 = 0;
Sum4 = 0;
count3 = 0;
count5 = 0;

for n = 1:N
    state1 = crawl(T, 1, [3,5]);
    state2 = crawl(T, 2, [3,5]);
    state4 = crawl(T, 4, [3,5]);
    
    if state1(end) == 3
        count3 = count3 + 1;
    end
    if state1(end) == 5
        count5 = count5 + 1;
    end

    Sum1 = Sum1 + length(state1)-1;
    Sum2 = Sum2 + length(state2)-1;
    Sum4 = Sum4 + length(state4)-1;
end

E1 = Sum1/N;
E2 = Sum2/N;
E4 = Sum4/N;

fprintf("Nº passos a começar em 1: %f\n", E1);
fprintf("Nº passos a começar em 2: %f\n", E2);
fprintf("Nº passos a começar em 4: %f\n", E4);

p3 = count3/N;
p5 = count5/N;

fprintf("Começando em e1, prob. absorção do e3: %f\n", p3);
fprintf("Começando em e1, prob. absorção do e5: %f\n", p5);
%b
T = [0.8 0 0 0.3 0;   
    0.2 0.6 0 0.2 0;   
    0 0.3 1 0 0;       
    0 0.1 0 0.4 0;
    0 0 0 0.1 1];

N = 1e5;

array = cell(1,N);

for n = 1:N
    rand = randi(3);
    
    if rand == 3
        rand = 4;
    end
    
    stateRand = crawl(T, rand, [3 5]);

    array{n} = stateRand;
end

max = length(array{1});
min = length(array{1});

for n = 2:N
    if length(array{n}) > max
        max = length(array{n});
    end

    if length(array{n}) < min
        min = length(array{n});
    end
end

fprintf("C_max: %d\n", max);
fprintf("C_min: %d\n", min);