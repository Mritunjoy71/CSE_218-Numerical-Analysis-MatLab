function x = Gauss_1505071(A,B)
[n,m]=size(A);

if (m ~= n ) 
disp ( 'Matrix is not square' );
x=0;
else if round(abs(det(A)))==0
        disp('matrix determination is zero.');
        x=[0,0,0];
        
else
    
A = [A,B];      



for i = 1:n-1
     p = i;
    for j = i+1:n
        if abs(A(j,i)) > abs(A(i,i))
            U = A(i,:);
            A(i,:) = A(j,:);
            A(j,:) = U;        
        end
    end
    while A(p,i)== 0 & p <= n
        p = p+1;
    end
    if p == n+1
        disp('No unique solution');
        break
    else
        if p ~= i
            T = A(i,:);
            A(i,:) = A(p,:);
            A(p,:) = T;
        end
    end
    
    
    for j = i+1:n
        fac = A(j,i)/A(i,i);
        for k = 1:n+1 
            A(j,k) = A(j,k) - fac*A(i,k);
        end
    end
end


if A(n,n) == 0
    disp('No unique solution');
    return
end

A


x(n) = A(n,n+1)/A(n,n);
for i = n - 1:-1:1
    sumax = 0;
    for j = i+1:n
        sumax = sumax + A(i,j)*x(j);
    end
    x(i) = (A(i,n+1) - sumax)/A(i,i);
end
end
end