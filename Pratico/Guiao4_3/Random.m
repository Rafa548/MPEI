k=50;
assinaturas=inf(nu,k);
for n = 1:nu
    for m = 1:length(set{n})
         key = num2str(set{n}(m));
         hashcode = djb31ma(key,127,k);
         assinaturas(n,:)=min(hashcode,assinaturas(n,:)); %substituiçao do guardado pelo minimo do novo
    end
end

J=zeros(Nu);
count = 0;
for n1= 1:Nu
    for n2= n1+1:Nu
        J(n1,n2)=sum(assinaturas(n1,:)~=assinaturas(2,:)/k);
        count = count+1;
    end
end