S=.82; %It must me calculated from field data.
C=.01;%It must me calculated from field data.
alpha=0.65;
lambda=((3*10^8)/(1.4*10^9))*1000; 
b_d=(1.2748-0.519*S-0.152*C);
b_dd=(1.33797-0.603*S-0.166*C);
rho_s=2.56; % in [g/m^3]
rho_b=1.5; % in [g/m^3]   %It must me calculated from field data.
Mv=0.01:0.01:0.35;
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
for i=1:35
delta_p(i)=(lambda*sqrt(permitivity_real(i)))/(2*pi*permitivity_img(i));
end
delta_p=abs(delta_p);
j=sqrt(-1);
e=abs(e_real+j*e_img);
h_depth=delta_p*cosd(theta);
plot(w*100,h_depth,'-o')
xlabel('Volumetric Water Content in %(w)')
ylabel('Depth of penetration [mm]')
title('For S=82% and C=01%(Soil type:Sand) at Nadir')