%>>>>>>>>        Otimizacao Irrestrita        <<<<<<<<<<%
%     Gustavo Cordeiro - UTFPR - janeiro de 2016        %
%-------------------------------------------------------%

%dirc = metodo para direcao 
%   |newton
%   |gradiente
%   |gradiente conjugado
%   |quase-newton
%passo = metodo para passo
%   |armijo
%   |aurea
%kmax = numero maximo de interacoes
%prec = precisao de parada
function k = solve(obj,kmax,prec,dirc,passo)
  if(nargin==4)
    passo = '';
  end
  k=0;
  switch dirc
    case 'newton'
      switch passo
        case 'armijo'
          for k=1:kmax
             obj.newton();
             obj.armijo();                  
             obj.updateX();
             if(mean(obj.gradX())<prec)
                break;
             end
           end
        case 'aurea'
          for k=1:kmax
             obj.newton();
             obj.aurea(prec);                  
             obj.updateX();
             if(mean(obj.gradX())<prec)
                break;
             end
           end
        otherwise
          disp(['Erro:',passo,' nao eh um metodo definido']);
        return
      end
    case 'gradiente'
      switch passo
        case 'armijo'
          for k=1:kmax
             obj.gradiente();
             obj.armijo();                  
             obj.updateX();
             if(mean(obj.gradX())<prec)
                break;
             end
           end
        case 'aurea'
          for k=1:kmax
             obj.gradiente();
             obj.aurea(prec);                  
             obj.updateX();
             if(mean(obj.gradX())<prec)
                break;
             end
           end
        otherwise
          disp(['Erro:',passo,' nao eh um metodo definido']);
        return
      end
    case 'gradiente conjugado'
      switch passo
        case 'armijo'
          for k=1:kmax
             obj.gradienteConjugado();
             obj.armijo();                  
             obj.updateX();
             if(mean(obj.gradX())<prec)
                break;
             end
           end
        case 'aurea'
          for k=1:kmax
             obj.gradienteConjugado();
             obj.aurea(prec);                  
             obj.updateX();
             if(mean(obj.gradX())<prec)
                break;
             end
           end
        otherwise
          disp(['Erro:',passo,' nao eh um metodo definido']);
        return
      end
    case 'quase-newton'
      switch passo
        case 'armijo'
          for k=1:kmax
             obj.quaseNewton();
             obj.armijo();                  
             obj.updateX();
             if(mean(obj.gradX())<prec)
                break;
             end
           end
        case 'aurea'
          for k=1:kmax
             obj.quaseNewton();
             obj.aurea(prec);                  
             obj.updateX();
             if(mean(obj.gradX())<prec)
                break;
             end
           end
        otherwise
          disp(['Erro:',passo,' nao eh um metodo definido']);
        return
      end
    otherwise
      disp(['Erro:',dirc,' nao eh um metodo definido']);
      return 
  end
  obj.k += k;
end