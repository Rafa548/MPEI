load("L.mat");

%% a)
% Sendo L uma matriz 100x100
disp("O valor de N é:")
N = size(L);
S=sum(L);
disp("Os dead-ends são:")
find(S==0)

%% b)
H=zeros(N(1),N(1));
n=0;
for i=1:100
    n=sum(L(:,i));
    H(:,i)=L(:,i)/n;
end

disp("A matriz H é:");
H

%% c) 
disp("A matriz H é:")
b=0.80;
A=b*H+(1-b)*(ones(N(1),N(1))/N(1))

%% d)
r=zeros(1,length(A))';
r(length(A)+1,1)=1;
M=[A-eye(length(A),length(A));ones(1,length(A))];
r2=M\r;

%e
n = length(r2);
r3=sort(r2);
x1=(r3(n));
x2=(r3(n-1));
x3=(r3(n-2));
find(r2==x1)