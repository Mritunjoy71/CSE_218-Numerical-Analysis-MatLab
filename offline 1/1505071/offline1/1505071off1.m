clear all;
clc;
y5=[];
y1 = [];
y2=[];
y3=[];
y4=[];
j=1;

for i = (-2*pi):0.2:(2*pi)
    y5(j)=sin(i);
    s= series(i,1);
    y1(j)=s;
     s= series(i,3);
    y2(j)=s;
    s= series(i,5);
    y3(j)=s;
    s= series(i,20);
    y4(j)=s;
   
    j = j+1;
    
end
xx = -(2*pi):0.2:(2*pi);
plot(xx,y5,'.',xx,y1,xx,y2,xx,y3,xx,y4);