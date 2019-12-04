 % DATOS DE ENTRADA:

% Puntos objetivo:
p0=[5,1]; % P Inicial
pP=[10,4];% pP=[11,6]; P Despegue
pI=[11,8];% P Asentamiento
pF=[10,12];% P Final

% tiempo para cada segmento:
t1=2;
t2=3;
t3=2;

% --------------------------------------------------------

% Calculo de los tiempos intermedios:
t0=0;
tP=t0+t1;
tI=t0+t1+t2;
tF=t0+t1+t2+t3;


% MATRIZ CON LAS ECUACIONES QUE HAY QUE RESOLVER:

% Se resuelve la matriz general mostrada en el ejemplo:

M=[    t0^3,   t0^2,   t0,  1,        0,      0,     0,  0
      3*t0^2,   2*t0,   1,  0,        0,      0,     0,  0
      3*2*t0,      2,   0,  0,        0,      0,     0,  0
           0,      0,   0,  0,     tF^3,   tF^2,    tF,  1
           0,      0,   0,  0,   3*tF^2,   2*tF,     1,  0
           0,      0,   0,  0,   3*2*tF,      2,     0,  0
        tP^3,   tP^2,  tP,  1,        0,      0,     0,  0
        tI^3,   tI^2,  tI,  1,        0,      0,     0,  0];
    
M2=[     t0^5,    t0^4,    t0^3,    t0^2,      t0,       1,       0,       0,       0,       0,       0,       0
       5*t0^4,  4*t0^3,  3*t0^2,    2*t0,       1,       0,       0,       0,       0,       0,       0,       0
      20*t0^3, 12*t0^2,    6*t0,       2,       0,       0,       0,       0,       0,       0,       0,       0
            0,       0,       0,       0,       0,       0,    tF^5,    tF^4,    tF^3,    tF^2,      tF,       1
            0,       0,       0,       0,       0,       0,  5*tF^4,  4*tF^3,  3*tF^2,    2*tF,       1,       0
            0,       0,       0,       0,       0,       0, 20*tF^3, 12*tF^2,    6*tF,       2,       0,       0
         tP^5,    tP^4,    tP^3,    tP^2,      tP,       1,   -tP^5,   -tP^4,   -tP^3,   -tP^2,     -tP,      -1
       5*tP^4,  4*tP^3,  3*tP^2,    2*tP,       1,       0, -5*tP^4, -4*tP^3, -3*tP^2,   -2*tP,      -1,       0
         tI^5,    tI^4,    tI^3,    tI^2,      tI,       1,   -tI^5,   -tI^4,   -tI^3,   -tI^2,     -tI,      -1
       5*tI^4,  4*tI^3,  3*tI^2,    2*tI,       1,       0, -5*tI^4, -4*tI^3, -3*tI^2,   -2*tI,      -1,       0
         tP^5,    tP^4,    tP^3,    tP^2,      tP,       1,       0,       0,       0,       0,       0,       0
         tI^5,    tI^4,    tI^3,    tI^2,      tI,       1,       0,       0,       0,       0,       0,       0];



%M=[      t0^6,    t0^5,    t0^4,    t0^3,    t0^2,      t0,       1,       0,       0,       0,       0,       0,       0,       0
%       6*t0^5,  5*t0^4,  4*t0^3,  3*t0^2,    2*t0,       1,       0,       0,       0,       0,       0,       0,       0,       0
%      30*t0^4, 20*t0^3, 12*t0^2,    6*t0,       2,       0,       0,       0,       0,       0,       0,       0,       0,       0
%            0,       0,       0,       0,       0,       0,       0,    tF^6,    tF^5,    tF^4,    tF^3,    tF^2,      tF,       1
%            0,       0,       0,       0,       0,       0,       0,  6*tF^5,  5*tF^4,  4*tF^3,  3*tF^2,    2*tF,       1,       0
%            0,       0,       0,       0,       0,       0,       0, 30*tF^4, 20*tF^3, 12*tF^2,    6*tF,       2,       0,       0
%         tP^6,    tP^5,    tP^4,    tP^3,    tP^2,      tP,       1,   -tP^6,   -tP^5,   -tP^4,   -tP^3,   -tP^2,     -tP,      -1
%       6*tP^5,  5*tP^4,  4*tP^3,  3*tP^2,    2*tP,       1,       0, -6*tP^5, -5*tP^4, -4*tP^3, -3*tP^2,   -2*tP,      -1,       0
%      30*tP^4, 20*tP^3, 12*tP^2,    6*tP,       2,       0,       0,-30*tP^4,-20*tP^3,-12*tP^2,   -6*tP,      -2,       0,       0
%        tI^6,    tI^5,    tI^4,    tI^3,    tI^2,      tI,       1,   -tI^6,   -tI^5,   -tI^4,   -tI^3,   -tI^2,     -tI,      -1
%       6*tI^5,  5*tI^4,  4*tI^3,  3*tI^2,    2*tI,       1,       0, -6*tI^5, -5*tI^4, -4*tI^3, -3*tI^2,   -2*tI,      -1,       0
%      30*tI^4, 20*tI^3, 12*tI^2,    6*tI,       2,       0,       0,-30*tI^4,-20*tI^3,-12*tI^2,   -6*tI,      -2,       0,       0
%         tP^6,    tP^5,    tP^4,    tP^3,    tP^2,      tP,       1,       0,       0,       0,       0,       0,       0,       0
%         tI^6,    tI^5,    tI^4,    tI^3,    tI^2,      tI,       1,       0,       0,       0,       0,       0,       0,       0];


Ax=[p0(1), 0, 0, pF(1), 0, 0, pP(1), pI(1)]';
Ay=[p0(2), 0, 0, pF(2), 0, 0, pP(2), pI(2)]';
%Bx=[p0(1), 0, 0, pF(1), 0, 0, 0, 0, 0, 0, pP(1), pI(1)]';
%By=[p0(2), 0, 0, pF(2), 0, 0, 0, 0, 0, 0, pP(2), pI(2)]';

% RESOLVER LAS ECUACIONES:

% Ecuacion:  M*pX=Bx
M
Ax
pX=M\Ax

% Ecuacion:  M*pY=By

pY=M\Ay


% SOLUCION PARA CADA VARIABLE (X,Y)

% Coeficientes de X e Y para las curvas 1 y 2:
pX1=pX
%pX2=pX(6:9)
%pX3=pX(10:14)
pY1=pY
%pY2=pY(6:9)
%pY3=pY(10:14)

% ----------------------------------------------------

% CALCULO DE LOS PUNTOS (DIBUJO):

% Calculo de la curva, la velocidad y la aceleraci�n:
t1=t0:0.01:tP;
t2=tP:0.01:tI;
t3=tI:0.01:tF;

% Posicion:
x1=polyval(pX1,t1);
y1=polyval(pY1,t1);
%x2=polyval(pX2,t2);
%y2=polyval(pY2,t2);
%x3=polyval(pX3,t3);
%y3=polyval(pY3,t3);
figure
plot(x1,y1,'r',p0(1),p0(2),'o',pP(1),pP(2),'x',pI(1),pI(2),'x',pF(1),pF(2),'o')
% Velocidad:
dpX1=polyder(pX1);
dpY1=polyder(pY1);
dpX2=polyder(pX2);
dpY2=polyder(pY2);
dpX3=polyder(pX3);
dpY3=polyder(pY3);

dx1=polyval(dpX1,t1);
dy1=polyval(dpY1,t1);
dx2=polyval(dpX2,t2);
dy2=polyval(dpY2,t2);
dx3=polyval(dpX3,t3);
dy3=polyval(dpY3,t3);

% Aceleraci�n:
ddpX1=polyder(dpX1);
ddpY1=polyder(dpY1);
ddpX2=polyder(dpX2);
ddpY2=polyder(dpY2);
ddpX3=polyder(dpX3);
ddpY3=polyder(dpY3);

ddx1=polyval(ddpX1,t1);
ddy1=polyval(ddpY1,t1);
ddx2=polyval(ddpX2,t2);
ddy2=polyval(ddpY2,t2);
ddx3=polyval(ddpX3,t3);
ddy3=polyval(ddpY3,t3);

% Dibujo de la soluci�n:

figure
plot(x1,y1,'r',x2,y2,'b',x3,y3,'r',p0(1),p0(2),'o',pP(1),pP(2),'x',pI(1),pI(2),'x',pF(1),pF(2),'o')
%plot(x1,y1,'r',x2,y2,'b',p0(1),p0(2),'o',pP(1),pP(2),'x',pF(1),pF(2),'o')

rectangle('Position', [5 , 5 , 3 , 4])
title('Curvas 1 (rojo), 2 (azul) y 3 (rojo)');

figure
subplot(3,2,1), plot(t1,x1,'r',t2,x2,'b'),title('x(t)')
subplot(3,2,2), plot(t1,y1,'r',t2,y2,'b'),title('y(t)')
subplot(3,2,3), plot(t1,dx1,'r',t2,dx2,'b'),title('dx(t)')
subplot(3,2,4), plot(t1,dy1,'r',t2,dy2,'b'),title('dy(t)')
subplot(3,2,5), plot(t1,ddx1,'r',t2,ddx2,'b'),title('ddx(t)')
subplot(3,2,6), plot(t1,ddy1,'r',t2,ddy2,'b'),title('ddy(t)')

