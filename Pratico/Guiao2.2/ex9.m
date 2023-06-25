%%
%a

N=10000;
%randn(N); % media 0 desvio padrao 1
%2*randn(N); % media 0 desvio padrao 2
k = 2*randn(1,N)+14; % media 14 desvio padrao 2
c= 0;

for i = 1:N
    if (12<=k(1,i) && k(1,i)<=16)
        c= c+1;
    end    
end

res = c/N

% ou -------------------------
sucessos = (k > 12) & (k<16);
resultado = sum(sucessos)/N

%%

%---------

%b
N=10000;
c_1 = 0;
for i = 1:N
    if (10<=k(1,i) && k(1,i)<=18)   %em variaveis continuas não existe necessidade de meter o igual serve apenas o < ou > porque nunca se obtem numeros reais
        c_1= c_1+1;
    end    
end
res_1 = c_1/N

%%

%c

c_2 = 0;
N=10000;
for i = 1:N
    if (10<=k(1,i))
        c_2= c_2+1;
    end    
end
res_2 = c_2/N
%%

%d)
N=10000;
x = 0:1:20;
res = normcdf([1 20]);
res(1)




