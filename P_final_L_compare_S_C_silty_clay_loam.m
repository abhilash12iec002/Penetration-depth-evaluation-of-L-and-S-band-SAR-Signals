%% L-C band dobson et. al. & hallikainen et. al
%figure 4
%%
clc
clear all
%close all
%% Dobson et. al.
c=3*10^8;
w=0:0.01:.35;
S=7;
C=31;
theta=00;
e_real= 2.37+(-5.24+0.55*S+0.15*C).*w+(146.04-0.74*S-0.85*C)*w.^2;
e_img= 0.06+(6.69+0.0367*S-0.0620*C).*w+(16.17-0.30*S+0.27*C)*w.^2;
lambda=((3*10^8)/(1.4*10^9))*1000;   % 1.4 GHz lambda in mm Dobson
for i=1:36
delta_p(i)=(lambda*sqrt(e_real(i)))/(2*pi*e_img(i));
end
delta_p=abs(delta_p);
figure
d_depth=delta_p*cosd(theta);
plot(w*100,d_depth,'-*')
xlabel('Volumetric Water Content (%)')
ylabel('Depth of penetration [mm]')
%text(15,500,'Dobson et. al. used \epsilon=a_0+(a_1+b_1S+c_1C)*w+(a_2+b_2S+c_2C)*w^2+(a_3+b_3S+c_3C)*w^3')
%text(15,400,'Hallikainen et. al. used \epsilon=(a_0+a_1S+a_2C)+(b_0+b_1S+b_2C)*w+(c_1+c_2S+c_3C)*w^2')
%% hallikainen et. al 
hold on 
lambda=((3*10^8)/(1.4*10^9))*1000;   % approx. 1.4 GHz (lambda in m)
e_real= (2.862-0.012*S+0.001*C)+(3.803+0.462*S-0.341*C).*w+(119.006-0.50*S-0.633*C)*w.^2;
e_img= (0.356-0.003*S-0.008*C)+(5.507+0.044*S-0.002*C).*w+(17.753-0.313*S+0.206*C)*w.^2;
%e_img=e_img+.079;
for i=1:36
delta_p(i)=(lambda*sqrt(e_real(i)))/(2*pi*e_img(i));
end
delta_p=abs(delta_p);
j=sqrt(-1);
e=abs(e_real+j*e_img);
h_depth=delta_p*cosd(theta);
plot(w*100,h_depth,'-o')
xlabel('Volumetric Water Content in %(w)')
ylabel('Depth of penetration [mm]')
title('For S = 07% and C = 31% (Soil type: Silty clay loam) at Nadir')
legend('Dobson et al. for L-Band (1.4 GHz)','Hallikainen et al. for L-Band (1.4 GHz)' )