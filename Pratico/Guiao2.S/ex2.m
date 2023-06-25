%a do exercicio 1

N=10000;    %n 
p1=0.002;   %prob de 1 ter defeito
p2=0.005;     %prob de 2 ter defeito
pa=0.01;    %prob de peça final ter defeito
k=1;        %numero de brinquedos com defeito
n = 8;      %numero de brinquedos

l_1 = rand(n,N) <= p1;    %matriz com n linhas e N colunas com numeros reais entre 0 e 1 ( > transforma numa matriz de 0 e 1)
l_2 = rand(n,N) <= p2;
l_3 = rand(n,N) <= pa;
l_a = l_1 | l_2 | l_3;
s_a = sum(l_a);
s_s_a = sum(s_a);
p_f = s_s_a/N;


%2a

p = 1-p_f;
disp(p)
% existe consistencia em comparaçao ao ex 1a

%2b

%dá para concluir que os resultados são identicos

%%
%2c

N=10000;    %n 
p1=0.002;   %prob de 1 componente ter defeito
p2=0.005;    %prob de 2 componente ter defeito
pa=0.01;    %prob de peça final ter defeito
k = 1;      %numero de brinquedos com defeito
p_f = zeros(1,19); %são apenas 19 valores funciona sem especificar exatamente o tamanho porque o matlab acrescenta novos valores de qualquer forma

for n=2:1:20  %numero de brinquedos em cada caixa
    l_1 = rand(n,N) <= p1;    %matriz com n linhas e N colunas com numeros reais entre 0 e 1 ( > transforma numa matriz de 0 e 1)
    l_2 = rand(n,N) <= p2;
    l_3 = rand(n,N) <= pa;
    l_a = l_1 | l_2 | l_3;
    s_a = sum(l_a);
    s_s_a = sum(s_a);
    p_f(n-1) = 1-s_s_a/N;
end
p_f;
n_b = 2:1:20;
plot(n_b,p_f)


%2d

% 6 deve ser a quantidade maxima














