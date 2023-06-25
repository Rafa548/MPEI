%a)

T=[0.7 0.2 0.1;
   0.2 0.3 0.5;
   0.3 0.3 0.4;]';
sum(T)

%b)
x=[
1    
0
0
];

x_1 = x(1)*T(1,1)*T(1,1);
fprintf("prob sol ao fim dos 3 dias %.5f \n",x_1)

%c)

x_sol1 = x(1)* T(1,1);  %sol sol
x_nuvens1 = x(1)*T(1,2); %sol nuvens

x_sol2 = x_sol1*(T(1,1))+x_nuvens1*T(1,2); % sol sol sol + sol sol nuvens
x_nuvens2 = x_nuvens1*(T(2,2))+x_sol1*T(2,1); %sol nuvens nuvens + sol nuvens sol

x_r = x_sol2+ x_nuvens2


%d)
%estado dia 31
x_2 = [
1
0
0
];

count = x_2; %vetor com o numero de dias no inicio sol nuvens chuva

for i = 1:30        %30 transiçoes
    x = T* x_2;       %dia seguinte
    count = count + x; %soma de tudo
end

count;

%e)
r = [
0
0
1
];

count_2 = r; %vetor com o numero de dias no inicio sol nuvens chuva

for i = 1:30        %30 transiçoes
    r = T* r;       %dia seguinte
    count_2 = count_2 + r; %soma de tudo
end

count_2;


%%
%f


T=[0.7 0.2 0.1;
   0.2 0.3 0.5;
   0.3 0.3 0.4;]';
sum(T);

r = [
0
0
1
];

count_10 = r; %vetor com o numero de dias no inicio sol nuvens chuva
   

