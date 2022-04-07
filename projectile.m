g= 9.801;  
dt=0.01;   
v_in= 100;    
X_in= [0 0 0 ];  
X= X_in;      
t=0;  
theta = 70;    
V= [ v_in*cosd(70)  0   v_in*sind(70)];
a= [ 0 0 -9.801];   

sart=true;
i=1;
tol= 10^(-9);
while sart
    a(i+1,:)= a(1,:);   
    V(i+1,:) = euler_(V(i,:), a(i,:),dt);
    X(i+1,:) = euler_(X(i,:),V(i,:),dt); 
    t(i+1) = t(i) + dt;
    i= i+1;
     if i > 1 && X(i,3)<= tol     
        sart=false;    
     end 
end
plot( X(:,1), X(:,3))
xlabel( 'Range [m]')
ylabel('Altitude [m] ')
xlim([0,700])
ylim([0,700])

function posteriori= euler_(priori,input, dt)
posteriori=priori+input*dt;
end
