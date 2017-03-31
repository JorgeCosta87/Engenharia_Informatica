function x=MBissecao(handles, f, a, b, kmax, tol, mode)
    
bestIte = 1;
    for k=1 : kmax
        x(k)=(a+b)/2;
        set(handles.textEqShowAprox,'String',x(k));

        if (f(x(k))==0)
            bestIte = k;
            break
        elseif(isscalar(tol) && tol > 0 &&  abs(b-a)/2<tol)
            bestIte = k;
            break
        end
        if f(a)*f(x(k))<0
            b=x(k);
        else
            a=x(k);
        end
        % marca o ponto da nova aproximação
        plot(x(k),0,'ro');
        
        if(k >= 2 && x(k) ~= x(k-1) )
            bestIte = k;
        end
        
        %zoom in
        % if(mod(k,5) == 0)
        %     xlim([a-1 b+1]);
        % end

        %Define o comportamento da acção com base no modo selecionado
        if(strcmp(mode,'radioEqAnim'))
            pause(1);
        elseif (strcmp(mode,'radioEqStep'))
            while(waitforbuttonpress == 1); end
        end
    end

   x(2,1)=bestIte;