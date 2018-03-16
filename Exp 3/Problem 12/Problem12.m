clear all;
%% ���ݵĵ���͸���ֵ������ֵ����ļ���
[data] = textread('data12.txt'); %��1,2,3�зֱ�Ϊx,y1,y2
Xmax =  max(data(:,1));
Xmin =  min(data(:,1));
Xdelta = 1; %��¼�ļ��
X = [Xmin:Xdelta:Xmax]'; %����Ҫ����Ĳ�ֵλ��
%�������ֶ����Բ�ֵ�Ľ��
Linear(:,1) = interp1(data(:,1), data(:,2), X);
%�������ֶ����β�ֵ
Pchip(:,1) = interp1(data(:,1), data(:,2), X, 'pchip');
%�����������������ֵ
Spline(:,1) = interp1(data(:,1), data(:,2), X, 'spline');
%% ��һ���ֽ����������ߵĿ��ӻ�����
Xshow = X ./ 60; %չʾʱ����λ�����Сʱ
scatter(data(:,1)./60, data(:,2),'k^')
hold on
plot(Xshow,Linear,'Color',[0.9 0.2 0]);
plot(Xshow, Pchip,'Color',[0 0.8 0.4]);
plot(Xshow, Spline,'Color',[0.1 0.3 0.8]);
xlabel('ʱ��/h')
ylabel('������/min^{-1}')
title('���ֲ�ֵ����Ч���Ƚ�')
box on
grid on
legend('ԭʼ���ݵ�','�ֶ����Բ�ֵ','�ֶ����β�ֵ','����������ֵ','Location','NorthWest')
saveas(gcf, '���ֲ�ֵ����Ч���Ƚ�.png')
%% ����������ֲ�ֵ�µĳ���������ֵ
S_linear = sum(Linear)
S_pchip = sum(Pchip)
S_spline = sum(Spline)