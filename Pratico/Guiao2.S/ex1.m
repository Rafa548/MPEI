%a

N=10000;    %n 
p1=0.002;   %prob de 1 componente ter defeito
p2=0.005;   %prob de 2 componente ter defeito
pa=0.01;    %prob de peça final ter defeito
k=1;        %numero de brinquedos com defeito
n = 8;      %numero de brinquedos em cada caixa

l_1 = rand(n,N) <= p1;    %matriz com n linhas e N colunas com numeros reais entre 0 e 1 ( > transforma numa matriz de 0 e 1)
l_2 = rand(n,N) <= p2;
l_3 = rand(n,N) <= pa;
l_a = l_1 | l_2 | l_3;
s_a = sum(l_a)>=1;
s_s_a = sum(s_a);
p_f = s_s_a/N;

%b
res = 0;
for i = 1:1:8
    res = res + sum(l_3(i,:));
end

rand = sum(sum(l_3))

res/s_s_a

