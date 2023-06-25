
%%1

%% C ́odigo 1
% Gerar uma matriz com 3 linhas e 10000 colunas de numeros aleat ́orios
% entre 0.0 e 1.0 (ou seja, cada coluna representa uma experiˆencia):
experiencias = rand(3,10000);
% Gerar uma matriz com 3 linhas e 10000 colunas com o valor 1 se o valor
% da matriz anterior for superior a 0.5 (ou seja, se saiu cara) ou com o
% valor 0 caso contr ario (ou seja, saiu coroa):
lancamentos = experiencias > 0.5; % 0.5 corresponde a 1 - prob. de caras
% Gerar um vetor linha com 10000 elementos com a soma dos valores de cada
% coluna da matriz anterior (ou seja, o numero de caras de cada experiˆencia):
resultados= sum(lancamentos);
% Gerar um vetor linha com 10000 elementos com o valor 1 quando o valor do
% vetor anterior  ́e 2 (ou seja, se a experiˆencia deu 2 caras) ou 0 quando  ́e
% diferente de 2:
sucessos= resultados==2;
% Determinar o resultado final dividindo o n ́umero de experiˆencias com 2
% caras pelo n ́umero total de experiˆencias:
probSimulacao = sum(sucessos)/10000


%% C ́odigo 1 - segunda vers ̃ao
N= 1e5; %n ́umero de experiˆencias  
p = 0.5; %probabilidade de cara
k = 2; %n ́umero de caras
n = 3; %n ́umero de lanc ̧amentos
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao= sum(sucessos)/N

%%2

N= 1e5;
p = 0.5; 
k = 6; 
n = 15; 
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao= sum(sucessos)/N

%%3

N= 1e7;
p = 0.5; 
k = 6; 
n = 15; 
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)>=k;
probSimulacao = sum(sucessos)/N


%%4

%%  a
list_l = [20,40,100];

for x = 1:length(list_l)
    Prob(0.5,list_l(x),6,1e5)
    disp(list_l(x));
end

%%  b
p = zeros(1,20);
for x = 1:19
    p(x+1)=(Prob(0.5,20,x,1e5));
end

stem(p)









