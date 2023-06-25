%A)
alfa = [0.2,0.3,0.45,0.1];
    
    %1 2 3 4 5 meta
T = [0,alfa(1),0,0,1-alfa(1),0;
    0,0,1-alfa(2),alfa(2),0,0;
    0,0,0,1-alfa(3),0,alfa(3);
    0,1-alfa(4),alfa(4),0,0,0;
    0,1,0,0,0,0;
    0,0,0,0,0,1]';

sum(T);

%B)
%percurso mais pequeno 1->2->3->meta

P_pequeno = T(2,1)*T(3,2)*T(6,3);

%C

Tcan = [0,0.8,0,0,0.2,0;
    0,0,0.7,0.3,0,0;
    0,0,0,0.55,0,0.45;
    0,0,0.1,0,0.9,0;
    0,0,0,0,1,0;
    0,0,0,0,0,1]';

Q=Tcan(1:4,1:4);

F = inv(eye(4)-(Q));

abs_1=sum(F(:,1)) %numero medio antes de cair na absorçao




