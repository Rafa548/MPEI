%% b)
T = [0.32   0.175   0.2   0.2   0.2;
        0.17   0.3       0.2   0.2   0.2;
        0.17   0.175   0.2   0.2   0.2;
        0.17   0.175   0.2   0.2   0.2;
        0.17   0.175   0.2   0.2   0.2];

%% c)
x0 = [1/5 ; 1/5 ; 1/5 ; 1/5 ; 1/5];

x4 = (T^4)*x0;

x4(3)

%% d)

b = [zeros(5,1);1];
M=[T-eye(size(T)); ones(1,5)];
u=M\b;

prob = u(4)

%% e)

prob2desporto = 0.2;
prob3desporto = prob2desporto*0.2


