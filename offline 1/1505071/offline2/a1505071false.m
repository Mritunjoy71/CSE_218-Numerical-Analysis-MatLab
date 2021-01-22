function [itr xr] = a1505071false(func ,xl, xu, ae ,maxitr )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    l=xl;
    u=xu;
    t=0; 
    
    while t<=maxitr 
        xr=u-(func(u)*(l-u))/(func(l)-func(u));
        if (func(xr)*func(l))<0
        u=xr;
        else
        l=xr;
        end
        if func(xr)==0
            break;
        end
        err = abs((u-l)/l);
        t = t+1;
        itr = t;
        
        
        
        
    end
    


end
