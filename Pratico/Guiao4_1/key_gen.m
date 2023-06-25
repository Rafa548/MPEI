function [keys] = key_gen(N_keys,imin,imax,letras,probs)
    
    if imax<imin
        aux = imin;
        imin=imax;
        imax=imim;
    end
    %% 1 -- tamanho da key
    size = randi([imin,imax],N_keys,1);

    %% 2 
    keys = cell(N_keys,1);
    n = length(letras);
    for w=1:N_keys
        pos = randi(n,1,size(w));
        word = letras(pos);
        keys{w}= word;
    end
   

end

