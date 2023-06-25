%a)

T= [0.8,0.2,0,0,0;
    0,0.6,0.3,0.1,0;
    0,0,1,0,0;
    0.3,0.2,0,0.4,0.1;
    0,0,0,0,1;
    ]';

sum(T);

%b)

x = [1,0,0,0,0]';
res = zeros(1,5);
all = zeros(1,100);
for h = 1:1:100
    res = (T^h) * x;
    all(h) = res(2);
end

r = 1:1:100;
%plot(r,all)

%c

res_2 = zeros(1,5);
all_3 = zeros(1,100);
all_5 = zeros(1,100);
for l = 1:1:100
    res_2 = (T^l) * x;
    all_3(l) = res_2(3);
    all_5(l) = res_2(5);
end
%plot(r,all_3,r,all_5)


%d
Tcan = zeros(5);
Tcan(1,1)=0.8; Tcan(2,1)=0.2;
Tcan(2,2)=0.6; Tcan(3,2)=0.1;
Tcan(1,3)=0.3; Tcan(2,3)=0.2; Tcan(3,3)=0.4; Tcan(4,2)=0.3;
Tcan(5,3)=0.1;
Tcan(4,4)=1;
Tcan(5,5)=1;

Q=Tcan(1:3,1:3);

%e

F = inv(eye(3)-(Q));

%f

abs_1=sum(F(:,1))
abs_2=sum(F(:,2))   %numero medio antes de cair na absorçao
abs_4=sum(F(:,3))

%g

R= Tcan(4:5,1:3);

B = R*F;
%prob de absorçao no estado 3 0.94 o que confirma o resultado acima
%calculado tal como no estado 5 ser 0



