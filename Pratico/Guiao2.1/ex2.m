
%a)
N = 1e5; %nuemro de experiencias
n = 20; %numero de dardos
aux=0;
r = randi([1,100],n,N);

for k=1:N
    aux = (aux + (length(unique(r(:,k)))==n));  %unique -> valores unicos neste caso correspondentes a n
end
rf = aux/N;
%disp(rf);

%b
res = 1-rf;
%disp(res);             %1-rf porque é o complementar da de cima

%%
%c
list=[1000,100000];
d = 10:10:100;
N = 1e5;
p = zeros(1,10);

for x= 1:1:length(list)
    for f = 1:1:length(d)
        resultado_c=0;
        random = randi([1,list(x)],d(f),N);
        for h = 1:N
            resultado_c = (resultado_c + (length(unique(random(:,h)))==d(f)));
        end
        resultado_c_f = 1-(resultado_c/N);
        p(f)=resultado_c_f;
        %disp(resultado_c_f);
    end
    if x == 1
        subplot(1,2,1)
        plot(d,p)
        legend("1000 alv")
    end
    subplot(1,2,2)
    plot(d,p)
    legend("100000 alv")
end

%%
%d)
N = 1e5;
list_2=[200, 500, 1000, 2000, 5000, 10000,20000, 50000, 100000];
l = 100;
p_2 = zeros(1,9);

for x= 1:length(list_2)
    resultado_c_2=0;
    random = randi([1,list_2(x)],l,N);
    for h = 1:N
        resultado_c_2 = (resultado_c_2 + (length(unique(random(:,h)))==l));
    end
    resultado_c_f_2 = 1-(resultado_c_2/N);
    p_2(x)=resultado_c_f_2;
    %disp(resultado_c_f_2);
end

plot(p_2,list_2)




