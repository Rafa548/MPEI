load("L.mat");

% a)
disp("O valor de N é:")
N = size(L)
l=sum(L);
disp("Os dead-ends são:")
find(l==0)

% b)
H=zeros(N(1),N(1));
n=0;
for i=1:120
    n=sum(L(:,i));
    H(:,i)=L(:,i)/n;
end

disp("A matriz H é:");
H;

%c
N=length(H);
p=0.85;
A=p*H+(1-p)*ones(N)/N; % matriz da Google
A(isnan(A))=1/N % resolver dead ends
sum(A);

%d
x0=ones(N,1)/N;
iter=1;
x=x0;
epsilon=1e-4;
while 1
    fprintf(1,'iteração %d\n',iter);
    xold=x;
    x=A*x;
    if max(abs(x-xold))<epsilon break ; end
    iter=iter+1;
end
x
%e
x(find(l==0))

