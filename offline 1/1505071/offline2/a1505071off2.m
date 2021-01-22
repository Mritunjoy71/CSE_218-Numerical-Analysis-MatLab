clear all;
clc;
y=[];
j=1;
for i=0.001:0.001:0.01
    y(j)=a1505071f(i);
    j=j+1;
    
end
k=0.001:0.001:0.01
plot(k,y);
    