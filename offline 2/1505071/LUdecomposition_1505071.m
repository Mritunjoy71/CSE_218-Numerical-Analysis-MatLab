function x =LUdecomposition_1505071(A,B)
[m n]=size(A);
if (m ~= n ) 
disp ( 'Matrix is not square' );
x=0;
else if round(abs(det(A)))==0
        disp('matrix determination is zero.');
        x=[0,0,0];
        
else
    
  L=zeros(m,m);
  U=zeros(m,m);
  count=0;
  for i = 1:n-1
    
    
    for j = i+1:n
        count=count +1;
        fac(count) = A(j,i)/A(i,i);
        for k =1:n
            A(j,k) = A(j,k) - fac(count)*A(i,k);
        end
    end
end


if A(n,n) == 0
    disp('No unique solution');
    return
end

U=A;

for i=1:n
    for j=i+1:n
        L(i,j)=0;
    end
    L(i,i)=1;
end
c=0;
for j=1:n-1
    for i=j+1:n
        c=c+1;
        L(i,j)=fac(c);
    end
    
end

  % Program shows U and L
  U
  L
  
  L=[L,B];
  d(1) = L(1,n+1)/L(1,1);
for i = 2:1:n
    sum = 0;
    for j = 1:i-1
        sum = sum + L(i,j)*d(j);
    end
    d(i) = (L(i,n+1) - sum)/L(i,i);
end
d=d';

U=[U,d];
x(n) = U(n,n+1)/U(n,n);
for i = n - 1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + U(i,j)*x(j);
    end
    x(i) = (U(i,n+1) - sum)/U(i,i);
end

end
   end