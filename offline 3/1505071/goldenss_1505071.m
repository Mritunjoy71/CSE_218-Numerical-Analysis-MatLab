clear all;
xu=10;
xl=0;
R=(sqrt(5)-1)/2;
d=R*(xu-xl);
x1=xl+d;
x2=xu-d;
maxitr=100;
es=0.00001;
i=0;

f_x1=f_1505071(x1);
f_x2=f_1505071(x2);

while(abs(xu-xl)>es && i<=maxitr)
    if(f_x1>f_x2)
        xl=x2;
        x2=x1;
        d=R*(xu-xl); %d=R*d
        x1=xl+d;
        f_x1=f_1505071(x1);
        f_x2=f_1505071(x2);
    else
        xu=x1;
        x1=x2;
        d=R*(xu-xl); %d=R*d
        x2=xu-d;
        f_x1=f_1505071(x1);
        f_x2=f_1505071(x2);
    end
    i=i+1;        
    
end

if(f_x1 > f_x2)
    sprintf('x_max=%f', x1)
    sprintf('maximize value of f(x)is=%f ', f_x1)
else
    sprintf('x_max=%f', x2)
    sprintf('maximize value of f(x)is =%f ', f_x2)
end


