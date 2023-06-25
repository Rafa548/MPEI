%2 motores
p0 = 1/2^2;
p1 = 1/2^2*2;
p2 = 1/2^2;

pt_1 = p2;
disp("2 motores ->");
disp(pt_1);

%4 motores
p0=(1/4)^4;
p1=(1/4)^4*4;
p2=(1/4)^4*6;
p3=(1/4)^4*4;
p4=(1/4)^4;

pt_2 = p3+p4;
disp("4 motores ->");
disp(pt_2);

disp("quociente ->")
disp(pt_1/pt_2)