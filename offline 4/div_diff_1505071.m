

x=[-1.1000,-0.9900,-0.8800,-0.7700,-0.6600,-0.5500,-0.4400,-0.3300,-0.2200,-0.1100,-0.0000,0.1100,0.2200,0.3300,0.4400,0.5500,0.6600,0.7700,0.8800,0.9900,1.1000];
y=[-4.3889490,2.3605635,4.5063561,4.9975215,4.9206573,4.5988108,4.1505193,3.6382593,3.0984539,2.5499517,2.0000000,1.4500483,0.9015461,0.3617406,-0.1505310,-0.5992186,-0.9279431,-1.0784081,-1.1272524,-1.8334962,-5.7258890];
t=[-1.0450 ,-0.8556 ,-0.6111 ,-0.3667 ,-0.1222 ,0.1222 ,0.3667 ,0.6111 ,0.8556 ,1.1000];
r=[-0.1689422, 4.6995172, 4.7987782, 3.8134502, 2.611029, 1.3889707, 0.1865492, -0.8009430, -1.1056607, -5.7258890];
et=zeros(21,1) ;
for j= 2:21
    
    linp=round(linspace(1,21,j));
    new_x=zeros(1,j);
    new_y=zeros(1,j);
    for k=1:j
        new_x(1,k)=x(linp(k));
        new_y(1,k)=y(linp(k));
    end
        
    
    z=zeros(10,1) ;
    for a = 1 : 10
        n = length(new_x); 
        if length(new_y)~=n;
            error('new_x and new_y must be same length'); 
        end
        bis = zeros(n,n); 

        bis(:,1) = new_y(:);  
        for jj = 2:n 
            for ii = 1:n-jj+1
                bis(ii,jj) = (bis(ii+1,jj-1)-bis(ii,jj-1))/(new_x(ii+jj-1)-new_x(ii)); 
            end
        end
        xsum = 1; 
        poly = bis(1,1); 
        for kk = 1:n-1
            xsum = xsum*(t(a)-new_x(kk)); 
            poly = poly+bis(1,kk+1)*xsum; 
        end
        z(a)=poly;
        if r(a)~=0
        et(j-1,1) = et(j-1,1)+abs( (r(a) -z(a)) / r(a));
        end
    end
    et(j-1,1)=et(j-1,1)/10;
    et(j-1,1)=et(j-1,1)*100;
    
    scatter(t,r);
    hold on;
    plot(t,z,'r');
    hold off;
    pause(2)
    fprintf('Error of percentage taking %d points: %f',j,et(j-1,1));
    fprintf(' \n');
end

bis




    
    
    

