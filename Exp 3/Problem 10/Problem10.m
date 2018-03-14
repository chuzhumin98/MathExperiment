clear all;
%% ���ݵĵ���͸���ֵ������ֵ����ļ���
[data] = textread('data10.txt'); %��1,2,3�зֱ�Ϊx,y1,y2
Xmax =  max(data(:,1));
Xmin =  min(data(:,1));
Xdelta = 0.1; %��¼�ļ��
X = [Xmin:Xdelta:Xmax]'; %����Ҫ����Ĳ�ֵλ��
%�������ֶ����Բ�ֵ�Ľ��
Linear(:,1) = interp1(data(:,1), data(:,2), X);
Linear(:,2) = interp1(data(:,1), data(:,3), X);
%�������ֶ����β�ֵ
Pchip(:,1) = interp1(data(:,1), data(:,2), X, 'pchip');
Pchip(:,2) = interp1(data(:,1), data(:,3), X, 'pchip');
%�����������������ֵ
Spline(:,1) = interp1(data(:,1), data(:,2), X, 'spline');
Spline(:,2) = interp1(data(:,1), data(:,3), X, 'spline');
%% ������Щ������Ŀ����ʹ�������ߺϲ����������ݿ��ӻ�
Xtotal = [X; X(end:-1:1)];
dataXtotal = [data(:,1); data(end:-1:1,1)];
dataYtotal = [data(:,2); data(end:-1:1,3)];
LinearTotal = [Linear(:,1); Linear(end:-1:1,2)];
PchipTotal = [Pchip(:,1); Pchip(end:-1:1,2)];
SplineTotal = [Spline(:,1); Spline(end:-1:1,2)];
%% ��һ���ֽ����������ߵĿ��ӻ�����
scatter(dataXtotal, dataYtotal,'k^')
hold on
plot(Xtotal,LinearTotal,'Color',[0.9 0.2 0]);
plot(Xtotal, PchipTotal,'Color',[0 0.8 0.4]);
plot(Xtotal, SplineTotal,'Color',[0.1 0.3 0.8]);
xlabel('x')
ylabel('y')
title('���ֲ�ֵ����Ч���Ƚ�')
box on
grid on
legend('ԭʼ���ݵ�','�ֶ����Բ�ֵ','�ֶ����β�ֵ','����������ֵ','Location','NorthWest')
saveas(gcf, '���ֲ�ֵ����Ч���Ƚ�.png')