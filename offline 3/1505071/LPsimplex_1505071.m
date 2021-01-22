function [A ] = LPsimplex_1505071( B )
B=B;
[m n]=size(B);

        

for i=1:n-1
    B(1,i)=-1*B(1,i);
end
real=0;
rr=n-1;
for r=1:rr
    if(B(1,r)>0)
        real=real+1;
    end
end
if(real==n-1)
    M=0;
    disp('NO SOLUTION');
    return ;
end
Z=zeros(m,1);
Z(1,1)=1;
S=zeros(m,m-1);
j=1;
for i=2:m
    S(i,j)=1;
    j=j+1;
end
T=zeros(m,1);
for i=1:m
    T(i,1)=B(i,n);
end
A=zeros(m,n-1);
for i=1:m
    for j=1:n-1
        A(i,j)=B(i,j);
    end
end
R=zeros(m,1);
Z=[Z,A];
A=[Z,S];
A=[A,T];
A=[A,R];
M=A;

disp('Initial tableau:\n');
disp(M)

[p q]=size(A);
x=1;
flag=0;
while(1)
    for i=1:q
        if A(1,i)<0
            break;
        end
    end
    if(i==q)
        flag=1;
    end
    if(flag==1)
        break;
        
    end
    big=1;
    t=abs(A(1,1));
    
    for i=1:n
        if abs(A(1,i))>t
            big=i;
        end
    end
    
    for i=2:p
        A(i,q)=A(i,q-1)/A(i,big);
        b(i)=A(i,q);
    end
    small=b(2);
    si=2;
    for i=3:p
        if(b(i))<small;
            small=b(i);
            si=i;
        end
    end
    
   % disp(A);
    kx=A(si,big);
    X(big)=si;
    
    for i=1:q-1
        A(si,i)=A(si,i)/kx;
    end
    %disp(A);
    D=A;
    
    for i=1:p
        if(i~=si)
            for j=1:q-1
                A(i,j)=D(i,j)-1*D(i,big)*D(si,j);
            end
        end
    end
    
    fprintf('%d th tableau:\n',x);
    disp(A)
    
        
    x=x+1;
    
end


fprintf('maximum value is = %f\n',A(1,q-1));
        %disp(A(1,q-1));
for i=1:n-1
    fprintf('variable x(%d) is = %f\n',i,A(X(i+1),q-1));
    
    
    
   %finish
    
end