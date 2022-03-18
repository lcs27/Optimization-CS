clear all; 
close all;
%% Initialization
S=130;
N=100;
gamma=1.03;
beta=0.96;
R=10;

%% Definition of problem
f=beta.^(0:(N-2));
L=[gamma*eye(N-1),zeros(N-1,1)]+[zeros(N-1,1),-eye(N-1)];

%% Q2.3
x=PPXA(f,L,S,[]);

%% Q2.4
r=L*x;
plot(0:(N-1),x,'r')
xlabel('t')
ylabel('x','rotation',1)
figure(2)
plot(0:(N-2),r,'r')
xlabel('t')
ylabel('r','rotation',1)

%% Q2.5
x1=[S];
r1=[];
for i=0:(N-2)
    r1=[r1;x1(end)/2];
    x1=[x1;x1(end)*gamma-r1(end)];
end

figure(1)
hold on;
plot(0:(N-1),x1,'k--');
hold off;

figure(2)
hold on;
plot(0:(N-2),r1,'k--');
hold off;


value=f*sqrt(L*x)
value1=f*sqrt(L*x1)

%% Q2.6
xR=PPXA(f,L,S,R);
rR=L*xR;
figure(1)
hold on
plot(0:(N-1),xR,'b-','linewidth',2)
hold off


figure(2)
hold on
plot(0:(N-2),rR,'b-','linewidth',2)
hold off
ylim([0,10])

valueR=f*sqrt(L*xR)

%% 3.2
q=(beta*gamma)^2;
A=[1 1;q^(N-1),gamma^(N-1)];
solut=inv(A)*[S;R];
C=solut(1);
D=solut(2);
k=C*gamma-C*q;
rT=q.^(0:(N-2))*k;
xT=C*q.^(0:(N-1))+D*gamma.^(0:(N-1));
rT=rT';
xT=xT';

valueT=f*sqrt(L*xT)

figure(1)
hold on;
plot(0:(N-1),xT,'gx');
hold off;
legend("optimal","half","constraint","theory")

figure(2)
hold on;
plot(0:(N-2),rT,'gx');
hold off;
legend("optimal","half","constraint","theory")