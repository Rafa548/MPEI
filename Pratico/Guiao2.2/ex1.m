x = 1:6;
px = ones(1,6)/6; % 1 linha 6 colunas tudo uns a dividir por 6

fx = cumsum(px);

subplot(1,2,1)
stem(px);
xlim([0 7]);

subplot(1,2,2)
stairs([0 x 7],[0 fx 1]); % x entre 0 e 7
                          % fx entre 0 e 1