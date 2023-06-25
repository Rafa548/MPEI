
function [probSimulacao] = Prob(p,n_l,n_c,n_e)
lancamentos = rand(n_l,n_e) > p;
sucessos= sum(lancamentos)==n_c;
probSimulacao = sum(sucessos)/n_e;
end