
%numero de filhos rapaz/rapariga = k
%numero de filhos na familia = n
%probabilidade = p
%numero de tentativas-N

%a)

N= 1e7;
p = 0.5; 
k = 1; 
n = 2; 
lancamentos = rand(n,N) > p;    %matriz com n linhas e N colunas com numeros reais entre 0 e 1 (o > transforma numa matriz de 0 e 1)
sucessos= sum(lancamentos)>=k;
probSimulacao = sum(sucessos)/N;
%disp(probSimulacao);

%b  (1/2*1/2*2)+((1/2)^2) = 0.75 os valores são iguais 

%c)

k_2 = 2;
p_1 = sum(sum(lancamentos)>=1/N);
p_2 = sum(sum(lancamentos)==k_2);
p_c = p_2/p_1;
%disp(p_c);


%d)

p1 = sum(lancamentos(1,:));  %1 linha onde o 1 filho é rapaz
p2 = sum(sum(lancamentos)==2);  %todos onde sao 2 rapazes
p_d = p2/p1;
%disp(p_d)


%e
n_2 = 5;

experiencias_2 = rand(n_2,N) > p; 
r_1 = sum(experiencias_2);

p__1 = sum(sum(experiencias_2)>=1);
p__2 = sum(sum(experiencias_2)==2);
p_e = p__2/p__1;
%disp(p_e)

%f

p___1 = sum(sum(experiencias_2)>=1/N);
p___2 = sum(sum(experiencias_2)>=2);
p_f = p___2/p___1;
%disp(p_f)
