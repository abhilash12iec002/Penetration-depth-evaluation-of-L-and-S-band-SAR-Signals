%% L-S band hallikainen et. al
%figure 7
%%
clc
clear all
%close all
%%
c=3*10^8;
w=0:0.01:.35;
S=93;
C=0.8;
theta=33;
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
l_depth=delta_p*cosd(theta);
plot(w*100,l_depth,'-*')




xlabel('Volumetric Water Content in %(w)')
ylabel('Depth of penetration [mm]')
title('For S=93% and C=0.8%(Soil type:Silty clay loam) at Nadir')
legend('Hallikainen et. al for L Band(1.4 GHz)' )

hold on 
lambda=((3*10^8)/(4*10^9))*1000;   % approx. 4 GHz (lambda in mm)
e_real= (2.927-0.012*S-0.001*C)+(5.505+0.371*S+0.062*C).*w+(114.826-0.389*S-0.547*C)*w.^2;
e_img= (0.004+0.001*S+0.002*C)+(0.951+0.005*S-0.010*C).*w+(16.759+0.192*S+0.290*C)*w.^2;
%e_img=e_img+.079;
for i=1:36
delta_p(i)=(lambda*sqrt(e_real(i)))/(2*pi*e_img(i));
end
delta_p=abs(delta_p);
j=sqrt(-1);
e=abs(e_real+j*e_img);
s_depth=delta_p*cosd(theta);
plot(w*100,s_depth,'-o')

xlabel('Volumetric Water Content in %(w)')
ylabel('Depth of penetration [mm]')
title('For S=93% and C=0.8%(Soil type:Sand) at Nadir')
legend('Hallikainen et. al for L Band(1.4 GHz)' ,'Hallikainen et. al for S Band(4 GHz)')
hold on






%%
theta=47;

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
l_depth=delta_p*cosd(theta);
plot(w*100,l_depth,'-x')




xlabel('Volumetric Water Content in %(w)')
ylabel('Depth of penetration [mm]')
title('For S=93% and C=0.8%(Soil type:Silty clay loam) at Nadir')
legend('Hallikainen et. al for L Band(1.4 GHz)' )

hold on 
lambda=((3*10^8)/(4*10^9))*1000;   % approx. 4 GHz (lambda in mm)
e_real= (2.927-0.012*S-0.001*C)+(5.505+0.371*S+0.062*C).*w+(114.826-0.389*S-0.547*C)*w.^2;
e_img= (0.004+0.001*S+0.002*C)+(0.951+0.005*S-0.010*C).*w+(16.759+0.192*S+0.290*C)*w.^2;
%e_img=e_img+.079;
for i=1:36
delta_p(i)=(lambda*sqrt(e_real(i)))/(2*pi*e_img(i));
end
delta_p=abs(delta_p);
j=sqrt(-1);
e=abs(e_real+j*e_img);
s_depth=delta_p*cosd(theta);
plot(w*100,s_depth,'--')

xlabel('Volumetric Water Content in %(w)')
ylabel('Depth of penetration [mm]')
title('For S = 93% and C = 0.8% (Soil type: Sand) ')
legend('Hallikainen et al. for L-Band (1.4 GHz) at \theta_i=33^{0}' ,'Hallikainen et al. for S-Band (4 GHz) at \theta_i=33^{0}','Hallikainen et al. for L-Band (1.4 GHz) at \theta_i=47^{0}' ,'Hallikainen et al. for S-Band (4 GHz) at \theta_i=47^{0}')