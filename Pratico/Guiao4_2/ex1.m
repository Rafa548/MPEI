clc; clear

fid = fopen("wordlist-preao-20201103.txt","r");
dicionario = textscan(fid,"%s");
fclose(fid);
dicionario = dicionario{1};


k=3;
m=8000; 
size = 1000;  

[B]=inicializarBloom(m);


for i = 1:size
    [B]=adicionarElemento(B,dicionario{i},k);
end

%2
count = 0;
for i = 1:size
    count= count + membro(B, dicionario{i},k);
end
fprintf("2-percentagem de falso negativos %f \n",1-(count/size))

%3
falsospositivos=0;
for n = 1001:11000
    falsospositivos = falsospositivos + membro(B, dicionario{n}, k);
end
fprintf("3-percentagem de falso positivos %f \n",falsospositivos/length(1001:11000)*100 )

%4
%(1-e^(-k*size/m))**k
%%
%5
fid = fopen("wordlist-preao-20201103.txt","r");
dicionario = textscan(fid,"%s");
fclose(fid);
dicionario = dicionario{1};
array1 = [];
array2 = [];
x = 4:1:10;

for h = 4:1:10
    m=8000;
    size = 1000;    

    [B]=inicializarBloom(m);

    for i = 1:size
        [B]=adicionarElemento(B,dicionario{i},h);
    end
    falsospositivos1=0;
    for i = 1:size
        falsospositivos1= falsospositivos1 + membro(B, dicionario{i},k);
    end
    falsospositivos2=0;
    for n = 1001:11000
        falsospositivos2 = falsospositivos2 + membro(B, dicionario{n}, h);
    end
    array1(end+1) = falsospositivos1/length(1:size)*100;
    array2(end+1) = falsospositivos2/length(1001:11000)*100;
end
figure(1);
plot(x,array1)
figure(2);
plot(x,array2)

