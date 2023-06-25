%a
T = [0  0   0   0   0   0  0;
    0.5 0   0   0   0   0  0;
    0.5 0   0   0   0   0  0;
     0 1/3  0  0.2 0.1  0  0;
     0 1/3 0.6 0.5 0.4 0.6 0;
     0 1/3 0.4  0  0.3  0  0;
     0  0   0  0.3 0.2 0.4 0;];


%b
CF_C = 0;
N=100000;
for n = 1:N
    state = crawl(T, 1, 7);
    if length(state) == 8 && state(2) == 2 && state(7) == 6
        CF_C = CF_C + 1;
    end
end
prob = CF_C/N

%%

T = [0 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0 1/3 0 0.2 0.1 0 0;
     0 1/3 0.6 0.5 0.4 0.6 0;
     0 1/3 0.4 0 0.3 0 0;
     0 0 0 0.3 0.2 0.4 0;];


%c
CF_C = 0;
N=10000;
for n = 1:N
    state = crawl(T, 1, 7);
    if length(state) == 8 && state(2) == 2
        CF_C = CF_C + 1;
    end
end

prob = CF_C/N;