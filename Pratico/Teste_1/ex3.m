%b
    % 1 3 5 7 9 FIM
T = [0 0.3 0 0.3 0 0;
    1/3 0 1/2 0 0.45 0;
    1/3 0.3 0 0.3 0 0;
    1/3 0 0.5 0 0.45 0;
    0 0.3 0 0.3 0 0;
    0 0.1 0 0.1 0.1 0];
sum(T)

%c
rand=randi(5);
state_1=crawl(T,rand,6)

%%
%d
N=1e6;
rand_a = cell(1,N);


for i = 1:N
    rand=randi(5);
    state_2=crawl(T,rand,6);
    rand_a{i}=state_2;
end

rand_a;
%%
%e
N=1e5;
cb=0;
for i = 1:N
    rand=randi(5);
    state=crawl(T, rand, 6); 
     if (state(1)== 5 && state(2)==4 && state(3)==1 && state(4)==3 && state(5)==2  && length(state)==6)
   
            cb = cb+1;
     end
end

prob = cb/N
%%
%g
N = 10000;
count = 0;
soma = 0;

for i = 1:N
    stateT = crawl(T,4,6);
    if stateT(1) == 4
        count = count + 1;
        soma = soma + (length(stateT)-1);
    end
end
soma/count
fprintf("O comprimento medio das palavras é: %d", soma/count)


function [state] = crawl(H, first, last)
     % the sequence of states will be saved in the vector "state"
     % initially, the vector contains only the initial state:
     state = [first];
     % keep moving from state to state until state "last" is reached:
     while (1)
          state(end+1) = nextState(H, state(end));
          if ismember(state(end), last) % verifies if state(end) is absorving
              break;
          end
     end
end

function state = nextState(H, currentState)
     % find the probabilities of reaching all states starting at the current one:
     probVector = H(:,currentState)';  % probVector is a row vector 
     n = length(probVector);  %n is the number of states
     % generate the next state randomly according to probabilities probVector:
     state = discrete_rnd(1:n, probVector);
end

function state = discrete_rnd(states, probVector)
     U=rand();
     i = 1 + sum(U > cumsum(probVector));
     state= states(i);
end