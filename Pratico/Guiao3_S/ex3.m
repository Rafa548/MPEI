

A_1=[0 1 0 0 0 0
    1/2 0 0 0 0 1/2
    1/2 0 0 1/2 0 0
    0 0 1 0 0 0
    1/4 1/4 1/4 1/4 0 0
    0 0 0 1 0 0]'
sum(A_1)

N=6;
p=0.85;
A=p*A_1+(1-p)*ones(N)/N; % matriz da Google
A(isnan(A))=1/N;

x0=ones(N,1)/N;

iter=1;
x=x0;
epsilon=1e-3;
while 1
fprintf(1,'iteração %d\n',iter);
xold=x;
x=A*x;
if max(abs(x-xold))<epsilon break ; end
iter=iter+1;
end
x

%maior page rank d) com 0.2204 de prob e menor e) com 0.0250 de prob 

%b)
% Probabilidade limite de cada estado
n = length(A_1);
M = [A - eye(n,n); ones(1,n)] ;
b = [zeros(n,1); 1];

u = M\b