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
%% ��һ��������������ֵ�������Χ����������
% ���������ߵĲ�ֵ�������Բ�ֵ����ֵ����
LinearDelta = Linear(:,1) - Linear(:,2);
PchipDelta = Pchip(:,1) - Pchip(:,2);
SplineDelta = Spline(:,1) - Spline(:,2);
S_linear = trapz(X, LinearDelta); %�������ι�ʽ����ֵ����
S_pchip = trapz(X, PchipDelta);
S_spline = trapz(X, SplineDelta);
[S_linear, S_pchip, S_spline] %������ֽ��
%% ���ӹ��������ݵ��������÷ֶ����κ�����������ֵ��ƽ��ֵ��Ϊ����ֵ��
dataOut(:,1) = X; %��һ��Ϊx
dataOut(:,2) = (Pchip(:,1)+Spline(:,1))./2; %�ڶ���Ϊy1
dataOut(:,3) = (Pchip(:,2)+Spline(:,2))./2; %������Ϊy2
csvwrite('output.csv',dataOut)