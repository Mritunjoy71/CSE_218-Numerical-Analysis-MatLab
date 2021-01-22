
function [itr xm] = a1505071bisect(func ,xl, xu, ae ,maxitr )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    l=xl;
    u=xu;
    t=0;
    while t<=maxitr
        xm=(l+u)/2;
        if (func(xm)*func(u))<0
        l=xm;
        else
        u=xm;
        end
        if func(xm)==0
            break;
        end
        err = abs((u-l)/l);

        t = t+1;
        itr = t;
        
        
        
        
    end
    


end

