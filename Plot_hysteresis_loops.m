clear variables; close all;

N=[17 100 150]; %Normal load, N

figure;
for n=1:3
load([pwd, '\14mum_100Hz_', num2str(N(n)),'N.mat']);

subplot(1,2,1)
for i=1:9
plot(Dx_T_dV(:,1,i)*1000,Dx_T_dV(:,2,i));
hold on;
end
xlabel('Tangential relative displacement [\mum]');
ylabel('Friction force [N]');

subplot(1,2,2)
for i=1:9
plot(Dx_T_dV(:,3,i),Dx_T_dV(:,2,i));
hold on;
end
xlabel('Tangential relative velocity [mm/s]');
ylabel('Friction force [N]');

end

