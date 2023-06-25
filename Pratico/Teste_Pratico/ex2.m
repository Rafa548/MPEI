%a
x = zeros(1,50000);
for i = 1:50000
    value = 1-exp(-400/i)
    x(1,i) = value;
end
for i = 1:50000
    if (x(1,i) == 0.02)
        i
        break;
    end
end
% o valor pedido foi visto manualmente no array