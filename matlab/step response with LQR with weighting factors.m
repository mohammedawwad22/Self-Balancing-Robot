T=0:0.01:5;
U=0.2*ones(size(T));
F =[1.0000    0.0100    0.0001    0.0000;
         0    0.9982    0.0267    0.0001;
         0   0.0000    1.0016    0.0100;
         0   -0.0045    0.3119    1.0016];


G =[0.0001;
    0.0182;
    0.0002;
    0.0454];


H =[1     0     0     0;
     0     0     1     0];


J =[0;
     0];
 x=5000;
 y=100;
 Q=[x 0 0 0;
     0 0 0 0;
     0 0 y 0;
     0 0 0 0];
 R=1;
 K=dlqr(F,G,Q,R)
 [y,x]=dlsim(F-G*K,G,H,J,U);
 stairs(T,y)
 legend('Cart(x)','Pendulum(phi)')

