function [ a ] =a1505071series(x,n )
a=x;

for i=2:1:n
    j=2*i-1;
    a=a+((-1).^(i+1)*(x.^j))/(factorial(j));

end
y=a;
end


