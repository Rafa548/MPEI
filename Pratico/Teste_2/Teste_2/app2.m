
load vars.mat;
user = 0;


while(user<1 || user>943)
    user = input('User ID (1 to 943) -> ');
    if (user<1 || user>943)
        fprintf("ERROR; Invalid ID User\n");
    end
end

prompt = 'App \n 1 - Your Movies \n 2 - Suggestion of movies based on other users \n 3 - Suggestion of movies based on already evaluated movies \n 4 - Movies feedback based on popularity \n 5 - Exit \n';
option = input(prompt);

while(option ~= 5 && option ~=0)
    switch option
        case 1
            watched_m = Movies{user}; %movies do user desejado
            n_watched_movies = height(watched_m);
            
            fprintf("\n---------- User Movies ----------\n\n");

            for i= 1:n_watched_movies
                id_m = watched_m(i);
                name_m = dic(id_m,1);
                fprintf("(ID: %d) %s\n", id_m,name_m{1});
            end

            fprintf("\n---------------------------------\n\n");
            
        case 2
            %Array para guardar pares similares (user1, user2, distancia)
            SimilarUsers = zeros(1,3);
            k= 1;
            for n2= 1:Nu
               if (n2 == user)
                   continue
               end
               distancia = sum(assinaturasUsers(user,:) ~= assinaturasUsers(n2,:))/n_hash;
               SimilarUsers(k,:)= [users(user) users(n2) distancia];
               k= k+1;
            end
            SimilarUsers=sortrows(SimilarUsers,3);
            s_u_1=SimilarUsers(1,2); %linha 1-> id do user similar
            s_u_2=SimilarUsers(2,2); %linha 2-> id do user similar
            
            watched_m = Movies{user};
            watched_m_1 = Movies{s_u_1}; %movies do mais similar
            watched_m_2 = Movies{s_u_2}; %movies do segundo mais similar
            watched_m_all = union(watched_m_2,watched_m_1); %os dois de cima juntos
            watch_suges = setxor(watched_m_all,watched_m);

            n_watched_movies = height(watch_suges);


            fprintf("\n---------- Movies Suggestion Based on similar users ----------\n\n");
    
            for i= 1:n_watched_movies
                id_m = watched_m_all(i);
                name_m = dic(id_m,1);
                fprintf("(ID: %d) %s\n", id_m,name_m{1});
            end    

            fprintf("\n--------------------------------------------------------------\n\n");
        case 3
            SimilarMovies = zeros(1,3);
            watched_m = Movies{user};
            threshold = 0.8;
            k= 1;
            notRatedMoviesByUser = setdiff(1:length(dic),watched_m);

            for m = 1:length(watched_m)
               for m2= 1:length(notRatedMoviesByUser)
                       distancia = sum(assinaturasMovies(watched_m(m),:) ~= assinaturasMovies(m2,:))/n_hash;
                       if distancia < threshold
                           SimilarMovies(k,:)= [watched_m(m) notRatedMoviesByUser(m2) distancia];
                           k= k+1;
                       end
               end
            end

            values = zeros(1,height(dic));

            for l = 1:height(SimilarMovies)
                id_m = SimilarMovies(l,2);
                values(id_m)=values(id_m)+1;
            end

            [n1,n2]=maxk(values,2); %n1 é o numero de vezes dos 2 primeiros a aparecer
                                    %n2 é os indices
            fprintf("\n---------- Movies suggestion based on evaluated movies ----------\n\n");

            for t=1:length(n2)
                id_m = n2(t);
                name_m = dic(id_m,1);
                fprintf("(ID: %d) %s\n", id_m,name_m{1});
            end

            fprintf("\n-----------------------------------------------------------------\n\n");
        case 4
            search = lower(input('String-> ', 's'));

            while (length(search) < shingleSize)
                fprintf('Minimum of %d characters\n', shingleSize);
                search = lower(input('String-> ', 's'));
            end
            
            fprintf("\n---------- MOST SIMILAR TITLES ----------\n\n");
            

            minHashSearch = inf(1, n_hash);

            for j = 1 : (length(search) - shingleSize + 1)
                shingle = char(search(j:(j+shingleSize-1))); 
                hashArray = zeros(1, n_hash);
                for i = 1 : n_hash
                    shingle = [shingle num2str(i)];
                    hashcode = DJB31MA(shingle, 127,i);
                    hashArray(i)=hashcode(1);
                end
                minHashSearch(1, :) = min([minHashSearch(1, :); hashArray]);
            end

            similarTitles = {};
            distancias = [];
            n_titles = length(titles);
            k=0;
   
            for n = 1 : n_titles
                distancia = sum(minHashSearch(1,:) ~= assinaturasTitles(n,:))/n_hash;
                k = k+1;
                similarTitles{k} = titles{n};
                distancias(k) = distancia;
            end
    
            [distancias, index] = sort(distancias);

            for h = 1 : 5
                quantidade = contagem(filtro,similarTitles{index(h)},n_hash_f);
                fprintf('%s | rated 3 or higher stars %d times\n', similarTitles{index(h)},quantidade);
            end

            fprintf("\n-----------------------------------------\n\n");
           
    end
    prompt = 'App \n 1 - Your Movies \n 2 - Suggestion of movies based on other users \n 3 - Suggestion of movies based on already evaluated movies \n 4 - Movies feedback based on popularity \n 5 - Exit \n';
    option = input(prompt);
end


function resultado = contagem(filtro,elemento,numHashFunc)
    y = DJB31MA(elemento,127,numHashFunc);
    y = rem(y,length(filtro))+1;
    resultado = min(filtro(y));
end