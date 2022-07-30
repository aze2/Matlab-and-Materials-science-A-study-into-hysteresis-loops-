clear variables; close all;

N=[17 100 150]; %Normal load, N

figure;
for n=1:3
Y_used=0;
X_used=0;
Times_entered=0;
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

fprintf('Normal Load %d\n',N(n));
P=polyfit(Dx_T_dV(1:50,1,1)*1000,Dx_T_dV(1:50,2,1),1);
fprintf('Kt is %d\n',P(1));

Area=polyarea(Dx_T_dV(:,1,1)*1000,Dx_T_dV(:,2,1));
Maximum_x = max(Dx_T_dV(:,1,1));
Min = min(Dx_T_dV(:,1,1));
Delta_x=(Maximum_x-Min)*1000;
COF=Area/(2*Delta_x*N(n));
fprintf('COF is %d\n',COF )
end
