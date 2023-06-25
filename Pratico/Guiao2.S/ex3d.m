%a

N=10000;    %n 
p1=0.002;   %prob de 1 ter defeito
p2=0.005;     %prob de 2 ter defeito
pa=0.01;    %prob de peça final ter defeito
n = 16;      %numero de brinquedos em cada caixa
p_f = zeros(1,8); %matriz com os resultados

for k=0:1:8 %numero de brinquedos com defeito
    l_1 = rand(n,N) <= p1;    
    l_2 = rand(n,N) <= p2;
    l_3 = rand(n,N) <= pa;
    l_a = l_1 | l_2 | l_3;
    s_a = sum(l_a)>=k;
    s_s_a = sum(s_a);
    p_f(k+1) = s_s_a/N;
end

x = 0:1:8;
%stem(x,p_f)
% existe consistencia em comparaçao ao ex 2a e a probablidade de mais do
% que um defeituoso é muito baixa

%3b
res = 0;
for i = 3:1:length(p_f)
    res = res + p_f(i);
end
%disp(res)

% falta concluir algo


%3c

media = sum(x.*p_f);
aux = (x-media).^2;
var_m = sum(p_f.*aux);
d_p = sqrt(var_m);




% basicamente a probabilidade de haver produtos defeituosos etc. é duas
% vezes maior








