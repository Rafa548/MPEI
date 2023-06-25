% Codigo base para detec ̧ ̃ao de pares similares
udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;

% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users); % N ́umero de utilizadores

% Constroi a lista de filmes para cada utilizador
Set= cell(Nu,1); % Usa celulas
for n = 1:Nu % Para cada utilizador
    % Obtem os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num array. Usa celulas porque cada utilizador tem um numero
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end
k=50;
assinaturas=inf(Nu,k);
for n = 1:Nu
    for m = 1:length(Set{n})
         key = num2str(Set{n}(m));
         hashcode = DJB31MA(key,127,k);
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

%% Calcula a distancia de Jaccard entre todos os pares pela definicao.
tic
J=zeros(Nu); % array para guardar distancias
h= waitbar(0,'Calculating');
for n1= 1:Nu
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu
        J(n1,n2)=1-(length(intersect(Set{n1},Set{n2}))/length((union(Set{n1},Set{n2}))));
    end
end
toc
delete (h)

%% Com base na distancia, determina pares com distancia inferior a um limiar pre-definido
threshold = 0.4; % limiar de decisao
SimilarUsers= zeros(1,3); % Array para guardar pares similares (user1, user2, distancia)
k= 1;

for n1= 1:Nu
    for n2= n1+1:Nu
        if (J(n1,n2) < threshold)
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)]
            k= k+1;
        end
    end
end