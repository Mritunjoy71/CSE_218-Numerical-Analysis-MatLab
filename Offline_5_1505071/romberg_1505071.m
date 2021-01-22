clear all;
clc;
format long;
ll=1;
ul=2;
val_t=25.83333333333333;
ae=1;
err=100;
seg=1;
I=zeros(10,10);
I(1,1) = trape(ll,ul,seg);
itr =1;
while err>ae
    seg = 2^itr;
    I(itr+1,1) = trape(ll,ul,seg);
    for k = 2:itr+1
        j = 2+itr-k;
        I(j,k) = (4.^(k-1)*I(j+1,k-1)-I(j,k-1))/(4.^(k-1)-1);
    end
    err = abs((I(1,itr+1)-I(2,itr))/I(1,itr+1))*100;
    itr=itr+1;
        
end
romberg = I(1,itr);
err=abs((romberg-val_t)/romberg)*100;
I
romberg
err