%%
% Dobson Semi-imperical model
%%
clc;
clear all;
%%
S=0.75; %It must me calculated from field data.
C=0.10;%It must me calculated from field data.
alpha=0.65;
b_d=1.2748-0.519*S-0.152*C;
b_dd=1.33797-0.603*S-0.166*C;
rho_s=2.66; % in [g/m^3]
rho_b=2; % in [g/m^3]   %It must me calculated from field data.
Mv=0:0.01:0.35;
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
plot(Mv*100,permitivity_real,'-*')
hold on
plot(Mv*100,permitivity_img,'-o')
hold on
plot(Mv*100,epsi_mod,'--')
xlabel('Volumetric Water Content (%)')
ylabel('Complex permitivity')
legend('Real-part','Imaginary-part','complex-permitivity')

