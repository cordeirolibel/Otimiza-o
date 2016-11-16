%>>>>>>>> Busca Exata - Metodo da Secao Aurea <<<<<<<<<<%
%     Gustavo Cordeiro - UTFPR - novembro de 2016       %
%-------------------------------------------------------%

classdef FuncClass<handle
    properties (SetAccess = private)
        funcao
        gradX_save
        funcX_save
        gradX_ponto
        funcX_ponto
    end
    properties (SetAccess = public)
        pontoX
        direcao
    end
    methods(SetAccess = public)
        function obj = FuncClass(funcao,pontoX,direcao)
            obj.funcao = funcao;
            obj.pontoX = pontoX;
            if(nargin==3)
              obj.direcao =direcao;
            end
        end
        #imprimindo todos os dados do objeto
        function print(obj)
          disp(["Funcao: ",obj.funcao]);
          disp("PontoX: ");
          obj.pontoX
          disp(["Gama: ",num2str(obj.gama)]);
          disp(["FracN: ",num2str(obj.fracN)]);
          disp("Direcao: ");
          obj.direcao
        end
        #definido em armijo.m
        passo =  armijo(obj,gama,fracN)
        #gradiente da funcao definida
        function out = grad(obj, x)
          out = obj.func(x,1);
        end
        #valor da funcao definida de derivada ordem no ponto x
        function out = func(obj, x, ordem)
          if(nargin == 2)
            ordem = 0;
          end
          out = feval(obj.funcao,x,ordem);
        end
        #gradiente da funcao definida no pontoX
        function out = gradX(obj)
          #verifica se nao foi calculado
          if(!isequal(obj.pontoX, obj.gradX_ponto))
            obj.gradX_save = obj.grad(obj.pontoX);
            obj.gradX_ponto = obj.pontoX;
          end
          out = obj.gradX_save;
        end
        #valor da funcao definida de derivada ordem no pontoX
        function out = funcX(obj)
          #verifica se nao foi calculado
          if(!isequal(obj.pontoX, obj.funcX_ponto))
            obj.funcX_save = obj.func(obj.pontoX);
            obj.funcX_ponto = obj.pontoX;
          end
          out = obj.funcX_save;
        end
        #funcao phi auxiliar
        function out = phi(obj, passos)
          out = [];
          for passo = passos
            out = [out,obj.func(obj.pontoX + passo*obj.direcao)] ;
          end
        end
        #definindo taylor1
        function out = taylor1(obj,passos)
          out = [];
          for passo = passos
            out = [out,obj.funcX()+ passo*obj.gradX()*obj.direcao];
          end
        end
        #definindo Ntaylor1
        function out = Ntaylor1(obj,passos,fracN)
          out = [];
          for passo = passos
            out = [out,obj.funcX()+ fracN*passo*obj.gradX()*obj.direcao];
          end
        end
        #
        function setDirecao(obj,direcao)
          obj.direcao = direcao;
        end
        #atualiza pontoX
        function out = updateX(obj,passo)
          out = obj.pontoX + passo*obj.direcao;
          obj.pontoX= out;
        end
    end
end