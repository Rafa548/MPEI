% Codigo base para detec ̧ ̃ao de pares similares
udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:3); clear udata;

% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users); % N ́umero de utilizadores
dic=readcell("films.txt","Delimiter","\t");

% Constroi a lista de filmes para cada utilizador
Movies = cell(Nu,1); % Usa celulas
x = waitbar(0,'A calcular Movies ...');
for a = 1:Nu % Para cada utilizador
    waitbar(i/Nu,x);
    ind = find(u(:,1) == users(a));
    % E guarda num array. Usa celulas porque cada utilizador tem um numero
    % diferente de filmes. Se fossem iguais podia ser um array
    Movies{a} = [Movies{a} u(ind,2)];
end
delete(x);

%obter assinaturas
n_hash=50;      % nº de funções de hash
assinaturasUsers=inf(Nu,n_hash);
x = waitbar(0,'A calcular assinaturasUsers ...');
for p = 1:Nu
    waitbar(i/Nu,x);
    for m = 1:length(Movies{p})  % para cada filme do user cálculamos o minHash
         key = num2str(Movies{p}(m));
         hashcode = DJB31MA(key,127,n_hash); %DJB31MA(key,127,k) -> calcula de uma vez k minhash's para key
         assinaturasUsers(p,:)=min(hashcode,assinaturasUsers(p,:)); %substituiçao do guardado pelo minimo do novo
    end
end
delete(x);

n_movies = height(dic);
genres = cell(n_movies,1);
k = 1;

x = waitbar(0,'A calcular genres ...');
for i= 1:n_movies
   waitbar(i/n_movies,x);
   array = {};
   for j= 2:7
       if ~anymissing(dic{i,j}) && ~strcmp(dic{i,j},'unknown')
         array{end+1} = dic{i,j};
       end
   end
   genres{k} = array;
   k = k+1;
end
delete(x);

%obter assinaturas
n_hash=50;      % nº de funções de hash
assinaturasMovies=inf(n_movies,n_hash);

x = waitbar(0,'A calcular assinaturasMovies ...');
for c = 1:n_movies
    waitbar(c/n_movies,x);
    for f = 1:length(genres{c})
      key = genres{c}{f};
      hashcode = DJB31MA(key,127,n_hash); %DJB31MA(key,127,k) -> calcula de uma vez k minhash's para key
      assinaturasMovies(c,:)=min(hashcode,assinaturasMovies(c,:)); %substituiçao do guardado pelo minimo do novo
    end
end
delete(x);

titles = dic(:,1);
n_titles = height(titles);
n_hash = 50;
shingleSize = 4; 
assinaturasTitles = inf(n_titles, n_hash);
     
x = waitbar(0,'A calcular minHashTitles...');
for k= 1 : n_titles
    waitbar(k/n_titles,x);
    movie = titles{k};
    for j = 1 : (length(movie) - shingleSize + 1)
        shingle = lower(char(movie(j:(j+shingleSize-1)))); 
        hashArray = zeros(1, n_hash);
        for i = 1 : n_hash
            shingle = [shingle num2str(i)];
            hashcode = DJB31MA(shingle, 127,i);
            hashArray(i)=hashcode(1);
        end
        assinaturasTitles(k, :) = min([assinaturasTitles(k, :); hashArray]);
    end
end
delete(x);

r = length(dic);
filterSize=r*8;
m_reviews = {};
g=1;

for i= 1:height(u)
    review = u(i,3);
    m_review = u(i,2);
    if (review>=3)
        m_reviews{g} = m_review;
        g = g+1;
    end
end

n_reviews = length(m_reviews);
n_hash_f = round(filterSize*log(2)/r);
filtro=inicializarBloom(filterSize);

for i= 1:n_reviews
    review = titles{m_reviews{i}};
    filtro = adicionarElemento(filtro,review,n_hash_f);
end


save vars.mat


function [B] = inicializarBloom(n)
  B = zeros(1,n);
end

function [B] = adicionarElemento(B,elemento,k)
    %k = numero de func de disperçao
    h = DJB31MA(elemento,127,k);
    h = rem(h,length(B))+1;
    B(h)=B(h)+1;
end





