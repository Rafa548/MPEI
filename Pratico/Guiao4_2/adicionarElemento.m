function [B] = adicionarElemento(B,elemento,k)
    %k = numero de func de disperçao
    for i = 1:k
        elemento = [elemento num2str(i)];
        h = DJB31MA(elemento,2);
        h = rem(h,length(B))+1;
        B(h)=true;
    end
end

