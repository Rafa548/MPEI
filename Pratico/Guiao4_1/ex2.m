nkeys=1e5;
imin=6;
imax=20;
letras = ['a':'z' 'A':'Z'];
[keys] = key_gen(nkeys,imin,imax,letras);
hashcodes1 = zeros(nkeys,1);
hashcodes2 = zeros(nkeys,1);
hashcodes3 = zeros(nkeys,1);
fig = 1;

for T = [5e5 1e6 2e6]
    tic
    atribuicoes1= zeros(T,1);
    atribuicoes2= zeros(T,1);
    atribuicoes3= zeros(T,1);
    for k=1:nkeys
        key = keys{k};
        %aplicar hash function à key
        hash1 = string2hash(key);
        hash2 = hashstring(key,T-1)+1;
        hash3 = DJB31MA(key,1);
        %converter o hash para valor de 1 a T
        hash1 = rem(hash1,T)+1;
        hash3 = rem(hash3,T)+1;
        %disp(hash);
        %fprintf(1,"%s -> %d\n",key,hash);
        hashcodes1(k) = hash1;
        atribuicoes1(hash1) = atribuicoes1(hash1) + 1;
        hashcodes2(k) = hash2;
        atribuicoes2(hash2) = atribuicoes2(hash2) + 1;
        hashcodes3(k) = hash3;
        atribuicoes3(hash3) = atribuicoes3(hash3) + 1;
    end

    %ex3
    figure(fig);
    hist(hashcodes1,100)
    fig = fig+1;
    figure(fig);
    hist(hashcodes2,100)
    fig = fig+1;
    figure(fig);
    hist(hashcodes3,100)
    fig = fig+1;
    %hist(atribuicoes,0:5);
    %0 numero de indices sem key associada
    %1 numero de indices com uma key associada
    %2 numero de indices com duas keys associadas ou seja onde occoreu colisão

    ncol1=sum(atribuicoes1(atribuicoes1>1)-1);
    perc1=ncol1/T * 100;
    fprintf(1,"s2h T=%d, ncol = %d, percent = %g\n",T,ncol1,perc1);
    ncol2=sum(atribuicoes2(atribuicoes2>1)-1);
    perc2=ncol2/T * 100;
    fprintf(1,"hs T=%d, ncol = %d, percent = %g\n",T,ncol2,perc2);
    ncol3=sum(atribuicoes3(atribuicoes3>1)-1);
    perc3=ncol3/T * 100;
    fprintf(1,"dj T=%d, ncol = %d, percent = %g\n",T,ncol3,perc3);
    toc
    %conclui-se que a funçao DJB31MA é a melhor
end
