clear all;
clc;
a=0;
b=1;
ll=0;
ul=4;
n=(ul-ll)/0.5+1;
x(1)=a;
for i=2:n
    x(i)=x(i-1)+0.5;
end
%Euler
Ey(1)=b;
for i=2:n
    Ey(i)=Ey(i-1)+slope(x(i-1),Ey(i-1))*0.5;
end

%Heun
Hy(1)=b;
a2=1/2;
a1=1/2;
p=1;
q=1;
for i=2:n
    k1=slope(x(i-1),Hy(i-1));
    k2=slope((x(i-1)+p*0.5),(Hy(i-1)+k1*0.5*q))
    Hy(i)=Hy(i-1)+(a1*k1+a2*k2)*0.5;
end

%Midpoint
My(1)=b;
a2=1;
a1=0;
p=1/2;
q=1/2;
for i=2:n
    k1=slope(x(i-1),My(i-1));
    k2=slope((x(i-1)+p*0.5),(My(i-1)+k1*0.5*q))
    My(i)=My(i-1)+(a1*k1+a2*k2)*0.5;
end

%Ralston
Ry(1)=b;
a2=2/3;
a1=1/3;
p=3/4;
p=3/4;
for i=2:n
    k1=slope(x(i-1),Ry(i-1));
    k2=slope((x(i-1)+p*0.5),(Ry(i-1)+k1*0.5*q))
    Ry(i)=Ry(i-1)+(a1*k1+a2*k2)*0.5;
end

%True
x2=[0:0.5:4];
y=(x.^4)/4-(5/3)*x.^3-(x.^2)/2+6*x;

plot(x,Ey,'b',x,Hy,'g',x,My,'r',x,Ry,'b',x2,y,'y'),legend('Euler','Heun','Midpoint','Ralstons','Analytical');
axis([0 4 0 12]);
xlabel('value of x   \rightarrow');
ylabel('value of y   \rightarrow');
Ey(n)
Hy(n)
My(n)
Ry(n)
y(n)