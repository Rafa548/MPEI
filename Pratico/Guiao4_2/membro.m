function res = membro(B,elemento,k)
    res=1;
    for i=1:k
        elemento = [elemento num2str(i)];
        h = DJB31MA(elemento,2);
        h = rem(h,length(B))+1;
        if (B(h)==false)
            res=0;
            break;
        end
    end
end

