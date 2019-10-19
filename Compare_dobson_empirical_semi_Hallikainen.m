%%
% Compare Hallikainen, Dobson-empirical, Dobson-semiempirical
%%
%figure
clc
clear all
S=.75; %It must me calculated from field data.
C=.10;%It must me calculated from field data.
alpha=0.65;
b_d=(1.2748-0.519*S-0.152*C);
b_dd=(1.33797-0.603*S-0.166*C);
rho_s=2.56; % in [g/m^3]
rho_b=1.5; % in [g/m^3]   %It must me calculated from field data.
Mv=0:0.01:0.40;
Es=((1.01+0.44*rho_s)^2)-0.062;
f= 1.4*10^9; %1.4 GHz
const=(0.58*10^(-10))*f;
Ewinf=4.9;
Ewo=80.1;
Efw_d= Ewinf+((Ewo-Ewinf)/(1+(const)^2));
sigma_eff=-1.645+1.939*rho_b-2.25622*S+1.594*C;
Efw_dd= ((const*(Ewo-Ewinf))/(1+(const)^2))+ (sigma_eff*(rho_s-rho_b)./(const*rho_s.*Mv));
permitivity_real= (1+((rho_b/rho_s)*(Es^alpha))+ ((Mv.^b_d)*(Efw_d^alpha))-Mv).^(1/alpha);
permitivity_img=((Mv.^b_dd)*(Efw_d^alpha)).^(1/alpha);
epsi=permitivity_real-i*permitivity_img;
epsi_mod=abs(epsi);
%plot(Mv*100,permitivity_real,'-*')
hold on
%plot(Mv*100,permitivity_img,'-o')
hold on
plot(Mv*100,epsi_mod,'--')
xlabel('Volumetric Water Content (%)')
ylabel('Complex permitivity')

%%
clc
c=3*10^8;
lambda=((3*10^8)/(1.4*10^9))*1000;   % 1.4 GHz lambda in mm
Mv=0:0.01:.40;
S=75%82;
C=10%01;
theta=0;
e_real= 2.37+(-5.24+0.55*S+0.15*C).*Mv+(146.04-0.74*S-0.85*C)*Mv.^2;
e_img= 0.06+(6.69+0.0367*S-0.0620*C).*Mv+(16.17-0.30*S+0.27*C)*Mv.^2;
e_tot=e_real-i*e_img;
e_tot=abs(e_tot);
plot(Mv*100,e_tot,'-*')
hold on
e_real= (2.862-0.012*S+0.001*C)+(3.803+0.462*S-0.341*C).*Mv+(119.006-0.50*S-0.633*C)*Mv.^2;
e_img= (0.356-0.003*S-0.008*C)+(5.507+0.044*S-0.002*C).*Mv+(17.753-0.313*S+0.206*C)*Mv.^2;
e_tot=e_real-i*e_img;
e_tot=abs(e_tot);
plot(Mv*100,e_tot,'-*')
legend('Dobson-semiempirical','Dobson-empirical, ','Hallikainen-empirical')
title('For S=75% and C=10%')