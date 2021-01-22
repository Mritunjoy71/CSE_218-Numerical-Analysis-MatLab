clear all;
clc;
a=[];
b=[];
b(1)=0;

for i=1:1:50
    if i==1
        a(i)=1.5;
    else    
        j=2*i-1;
        a(i)=a(i-1)+((-1).^(i+1)*(1.5.^j))/(factorial(j));
        b(i)=abs((a(i-1)-a(i))/a(i))*100;
    end
end

k=1:1:50
plot(k,b);