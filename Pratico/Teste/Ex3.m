%% b)

T = [0      8/30      0           8/30      0                 0;
        0.5   0           0.5        0            8/30           0;
        0      8.30      0           8/30      8/30            0;
        0.5   8/30      0.5        0            8/30           0;       
        0      0           0           8/30       0                0;     
        0      0.2        0           0.2          0.2             0]

%% c)

rand=randi(5);
state=crawl(T,rand,6)

%% d)
N=1e5;
arr = cell(1,N);

for i = 1:N

    rand=randi(5);

    state=crawl(T,rand,6);
    arr{i}=state;
end

arr
%% e)
cb=0;
for i = 1:N

    state=crawl(T, rand, 6);

    if length(state)==5
        if (state(1)==5 && state(2)==4 && state(3)==1 && state(4)==4 && state(5)==6)
            cb = cb+1;
        end
    end
end

prob = cb/N

%% g)
T = [0      8/30      0           8/30      0                 0;
        0.5   0           0.5        0            8/30           0;
        0      8.30      0           8/30      8/30            0;
        0.5   8/30      0.5        0            8/30           0;       
        0      0           0           8/30       0                0;     
        0      0.2        0           0.2          0.2             0;]

N = 10000;
count = 0;
soma = 0;

for i = 1:N
    rand=randi(5);
    stateT = crawl(T,rand,6);
    if stateT(1) == 5
        count = count + 1;
        soma = soma + (length(stateT)-1);
    end
end
soma/count
fprintf("O comprimento medio das palavras é: %d", soma/count)
