%%%% Para recuperar resultados e fazer graficos PP

% --------------------------- METODOS ---------------------------------------
% 1 = Cauchy
% 2 = Newton
% 3 = Gradiente Conjugado
% 4 = Quase-Newton
% 5 = Quase-Newton DFP
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
%%% nmet = numero de metodos

%%% dados
%%% nn = numero de variacoes n
%%% nlmin = numero de variacoes de lambdamin
%%% nlmax = numero de variacoes de lambdamax
%nprob = nn*nlmin*nlmax; %% total de problemas testados

load guarda_dados_1.mat
% -------------------------------------------------------------------------

for i=1:nprob
    for j=1:nmet
        if it(i,j)==kmax
            it(i,j)=NaN;
        end
    end
end

% -------------------------------------------------------------------------
% ITERACOES
% -------------------------------------------------------------------------

% % -------------------------------------------------------------------------
figure(1)

perf(it,2)
leg = legend('Cauchy','Newton','Grad Conj','BFGS','DFP',4);
set (leg, 'fontsize', 14,'Location','SouthEast');
title('Performance profile - Iteracoes','fontsize', 14);
%print ('img/pp','-djpg');
hold off;

