% u.data -> id_utilizador id_filme ....
clear;
udata=load("u.data");   % Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;
% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users);      % Número de utilizadores
% Constroi a lista de filmes para cada utilizador
Set= cell(Nu,1); 
for n = 1:Nu            % Para cada utilizador
    % Obtém os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num array. Usa células porque utilizador tem um número
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end

% OBTER ASSINATURAS
nHash=50;                           % nº de funções de hash
assinaturas = Inf(Nu,nHash);
for i = 1:Nu
    for j = 1:length(Set{i})    % para cada filme do user cálculamos o minHash
        key = num2str(Set{i}(j));
        assinaturas(i,:) = min(DJB31MA_adaptaded(key,127,nHash),assinaturas(i,:));
% DJB31MA_adaptaded(key,127,k) -> calcula de uma vez k minhash's para key
    end
end

% OBTER SIMILARES
% Com base na distância, determina pares com
% distância inferior a um limiar pr´e-definido
threshold = 0.4 % limiar de decisão
% Array para guardar pares similares (user1, user2, distˆancia)
tic
SimilarUsers = zeros(1,3);
k= 1;
for n1= 1:Nu
    for n2= n1+1:Nu
        distancia = sum(assinaturas(n1,:) ~= assinaturas(n2,:))/nHash;
        if distancia < threshold
            SimilarUsers(k,:)= [users(n1) users(n2) distancia];
            k= k+1;
        end
    end
end
similarUsersCalculationRunningTime = toc;

fprintf("Number of users = %d\n",Nu);
fprintf("Calculation running time = %f\n",similarUsersCalculationRunningTime);
fprintf("%d similar pairs\n",length(SimilarUsers));
disp(SimilarUsers);


%{
Quando temos de calcular um número grande dedistânicas com um número grande
de conjuntos é mais eficiente usar o método minHash em vez de fazer o
cálculo exato da distância de jaccard (que é computacionalmente mais pesado)
%}

% k - número de colunas/funções de hash