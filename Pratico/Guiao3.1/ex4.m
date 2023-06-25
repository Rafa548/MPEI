%a)
p=0.4;
q=0.6;

T = [
    p^2 0 0 q^2;
    (1-p)^2 0 0 q*(1-q);
    p*(1-p) 0 0 q*(1-q);
    p*(1-p) 1 1 (1-q)^2;
    ]
sum(T)
%para confirmar se está certo ao fazer sum tem de dar 1 em todas as colunas;


%b

inic = [1; 0; 0; 0]; % começa no A logo os outros são todos 0
res = zeros(1,4);
for x = [5 10 100 200]
    res = (T^x) * inic;     %formula T^numero de transiçoes * matrix inicial
    fprintf("Prob A %.5f para %d transiçoes\n",res(1),x)
    fprintf("Prob B %.5f para %d transiçoes\n",res(2),x)
    fprintf("Prob C %.5f para %d transiçoes\n",res(3),x)
    fprintf("Prob D %.5f para %d transiçoes\n",res(4),x)
end


%c
M=[T-eye(4);ones(1,4)]; % T tem 4 colunas logo M tem 5 linhas porque se adiciona uma linha só de uns
x_2=[0 0 0 0 1]'; %coluna para garantir um valor unico para o sistema 
U =M\x_2