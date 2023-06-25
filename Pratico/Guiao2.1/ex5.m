
%a
n = 6; %n de facex
N=1e5;  %nª experiencias
l = 2;  %numero de lançamentos
lst=1:2;    %   quantidade de linhas

r = randi([1,6],l,N);           %numeros entre 1 e 6 em 2 linhas N colunas
aux_A = 0;
aux_B=0;
aux_C=0;
aux_D=0;

for k= 1:N
    aux_A = aux_A + (sum(r(:,k))==9);
    aux_B = aux_B + (rem(r(2,k),2)==0);             %rem usa-se para ver o resto
    for x= 1:length(lst)
        aux_C = aux_C + (sum(r(x,k))==5);
        aux_D = aux_D + (sum(r(x,k))==1);
    end
end

res_A = aux_A/N;
res_B = aux_B/N;
res_C = aux_C/N;
res_D = 1-(aux_D/N);
disp("A- " + res_A);
disp("B- " + res_B);
disp("C- " + res_C);
disp("D- " + res_D);


%b

% P(AB)=P(A)*P(B)
% P(AB)=2/36
% P(A)=4/36
% P(B)=18/36
% P(A)*P(B) = 1/18 e como 1/18 = 2/36 logo são acontecimentos independentes

%c

% P(CD)=P(C)*P(D)
% P(CD)=9/36=1/4
% P(C)=11/36
% P(D)=25/36
% P(C)*P(D) ~= P(CD) logo não são independentes

