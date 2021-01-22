function [ y ] =trape( ll,ul,seg )
    format long;
    h = (ul - ll)/seg;
    y = func(ll)*0.5;
    y=y + func(ul) * 0.5;
    x = ll + h;
    for i = 1 : seg-1
        y = y + func(x);
        x = x + h;
    end;
    y= y * h;



end

