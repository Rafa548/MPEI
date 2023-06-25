%3-a)
x = 0:1:4;
px = zeros(1,5);

N= 1e5; %numero de experiencias  
p = 0.5; %probabilidade de cara
k = [0 1 2 3 4]; %numero de caras
n = 4; %numero de lancamentos


for i = 1:length(k)
    lancamentos = rand(n,N) > p;
    sucessos= sum(lancamentos)==k(i);
    probSimulacao= sum(sucessos)/N;
    px(i) = probSimulacao;
end

%stem(px);

%%
%3-b

media = sum(x.*px);
aux = (x-media).^2;  
var_m = sum(px.*aux);
d_p = sqrt(var_m);



%3-f
pelo_2 = 0;
max_1 = 0;
entre1_3 = 0;
for i = 1:length(px)
    if (i>=3)
        pelo_2= pelo_2 +px(i);
    elseif (i<=2)
        max_1= max_1 + px(i);
    elseif (i>=2 && i<=4)
        entre1_3 = entre1_3 + px(i);
    end
end

disp("pelo menos 2 coroas -> "+ pelo_2);
disp("maximo 1 coroa -> "+ max_1);
disp("entre 1 e 3 -> "+ max_1);





