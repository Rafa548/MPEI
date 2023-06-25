%b
%muda de estado a cada 2min
    % A B C D
T = [0.1 0.3 0.25 0.5;
    0.3 0.1 0.25 0.3;
    0.3 0.3 0.1 0.1;
    0.3 0.3 0.4 0.1;]
sum(T)

%c
%7:10 -> 5 transiçoes
inic = [1/4 1/4 1/4 1/4]';
res = (T^5)*inic;
fprintf("prob B -> %f",res(2))

%d
n = length(T);
M = [T - eye(n,n); ones(1,n)] ;
b = [zeros(n,1); 1];

u = M\b;

value = 12*60/2; %nº de transiçoes
m =value*u(2);
res_2 = m/12 * 2

%e
%A no inicio
inic_a=T(1,1);
sec_b=inic_a*T(2,2);
terc_b=sec_b*T(3,2);
quart_a=terc_b*T(4,1)









































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

% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
     % find the probabilities of reaching all states starting at the current one:
     probVector = H(:,currentState)';  % probVector is a row vector 
     n = length(probVector);  %n is the number of states
     % generate the next state randomly according to probabilities probVector:
     state = discrete_rnd(1:n, probVector);
end

% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector 
function state = discrete_rnd(states, probVector)
     U=rand();
     i = 1 + sum(U > cumsum(probVector));
     state= states(i);
end