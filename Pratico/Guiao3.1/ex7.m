%a

H=[0  0  0 0 1/3 0
   1  0  0 0 1/3 0
   0 1/2 0 1  0  0     %ver no diagrama one apontam as setas
   0  0  1 0  0  0
   0 1/2 0 0  0  0
   0  0  0 0 1/3 0]

sum(H)

res = [1/6
    1/6
    1/6
    1/6         %todos com a mesma probablidade
    1/6
    1/6]

for i = 1:10
    res=H*res; %%mesmo que cadeias
end
res;

fprintf("maior %f \n",max(res))

%b) spider-trap em C-D  
    %dead-end em F

%c)
H(:,6)=1/6 %resolver dead end é trocar todas as linhas da coluna de zeros por 1/N sendo n numero de elementos

%d
N=6
p=0.80
A=p*H+(1-p)*ones(N)/N % matriz da Google
A(isnan(A))=1/N % resolver dead ends
sum(A)

%f

