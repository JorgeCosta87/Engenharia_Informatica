%completeValidation(handles,f,a,b,x0,x1,kmax,tol,metodo)
%
%   Validação de todos os campos do método selecionado
%
%INPUT
%   handles - handles dos objectos da GUI
%   f - função da equação não linear f(x)=0
%   a - intervalo inferior
%   b - intervalo superior
%   x0 - aproximação inicial I= [a, b]: f(x0)*f''(x0)>0
%   x1 - aproximação inicial I= [a, b]: f(x1)*f''(x1)>0
%   kmax - número máximo de iterações do método
%   tol - tolerância = amplitude do intervalo
%   metodo - metodo selecionado
%
%OUTPUT
% valid - Se a validação é valida 1, caso contrário 0
%


function valid = completeValidation(handles,f,a,b,x0,x1,kmax,tol,metodo)
    
    valid = 0;
    
    %validação da função
    if(isempty(FRvr(get(handles.editF,'String'))))
        showMessage(handles,'Enter a function of x','r');
        return;
    end
    resetPlot(handles,true,false,false,false,false);
    %validação do intervalo
    val = intervalValidation(f,a,b);
    
    if(val == 1)
        showMessage(handles,'a is invalid - Not a real number','r');
        return;
    elseif(val == 2)
        showMessage(handles,'b is invalid - Not a real number','r');
        return;
    elseif(val == 3)
        showMessage(handles,'a > b','r');
        return;
    elseif(val ==4)
        showMessage(handles,'Invalid range - f(a) * f(b) > 0','r');
        return;
    end
    resetPlot(handles,true,true,true,false,false);
    
    %validação do número de iterações
    if(~(isscalar(kmax) && isreal(kmax)))
        showMessage(handles,'Kmax - Not a real number','r');
        return;
    elseif(kmax <= 0)
        showMessage(handles,'Kmax - Only positive numbers allowed','r');
        return;
    end
    
    %validação da tolerância
    if(~isempty(tol))
        if(~(isscalar(tol) && isreal(tol)))
            showMessage(handles,'tol - Not a real number','r');
            return;
        elseif(tol <= 0)
            showMessage(handles,'tol - Only positive numbers allowed','r');
            return;
        end
    end

    %validação das aproximações
    switch (metodo)
      
        case 'radioTg'
                val = AproxValidation(handles,f,x0,a,b);
                if(val == 1)
                    showMessage(handles,'x0 is invalid - Not a real number','r');
                    return;
                elseif(val == 2)
                    showMessage(handles,'x0 is invalid - Out of range [a b]','r');
                    return;
                elseif(val == 3)
                    showMessage(handles,'x0 is invalid - f(x0) * f''''(x0) > 0','r');
                    return;
                end
                resetPlot(handles,true,true,true,true,false);
        case 'radioPf'
                val = AproxValidation(handles,f,x0,a,b);
                if(val == 1)
                    showMessage(handles,'x0 is invalid - Not a real number','r');
                    return;
                elseif(val == 2)
                    showMessage(handles,'x0 is invalid - Out of range [a b]','r');
                    return;
                elseif(val == 3)
                    showMessage(handles,'x0 is invalid - f(x0) * f''''(x0) > 0','r');
                    return;
                end
                resetPlot(handles,true,true,true,true,false);
        case 'radioSe'
            
            if(x1 < x0)
                showMessage(handles,'x1 is less than x0','r');
                return
            end
            
            val = AproxValidation(handles,f,x0,a,b);
            if(val == 1)
                showMessage(handles,'x0 is invalid - Not a real number','r');
                return;
            elseif(val == 2)
                showMessage(handles,'x0 is invalid - Out of range [a b]','r');
                return;
            elseif(val == 3)
                showMessage(handles,'x0 is invalid - f(x0) * f''''(x0) > 0','r');
                return;
            end
                
            val = AproxValidation(handles,f,x1,a,b);
            if(val == 1)
                showMessage(handles,'x1 is invalid - Not a real number','r');
                return;
            elseif(val == 2)
                showMessage(handles,'x1 is invalid - Out of range [a b]','r');
                return;
            elseif(val == 3)
                showMessage(handles,'x1 is invalid - f(x1) * f''''(x1) > 0','r');
                return;
            end
            resetPlot(handles,true,true,true,true,true);
     end
     
     valid = 1;
end

