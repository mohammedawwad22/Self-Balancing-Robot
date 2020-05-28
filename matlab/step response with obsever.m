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
 Nbar=-61.55;
 L =[2.6310   -0.0105;
  172.8146   -1.3468;
   -0.0129    2.6304;
   -2.2954  173.2787];
Fce=[F-G*K G*K;zeros(size(F)) (F-L*H)];
Gce=[G*Nbar;zeros(size(G))];
Hce=[H zeros(size(H))];
Jce=[0;0];
[x,y]=dlsim(Fce,Gce,Hce,Jce,U);
stairs(T,y)
legend('cart(x)','pendulum(phi)')
 [y,x]=dlsim(F-G*K,G*Nbar,H,J,U);
 stairs(T,y)
 legend('Cart(x)','Pendulum(phi)')

