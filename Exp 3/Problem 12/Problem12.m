clear all;
%% 数据的导入和各插值方法插值结果的计算
[data] = textread('data12.txt'); %第1,2,3列分别为x,y1,y2
Xmax =  max(data(:,1));
Xmin =  min(data(:,1));
Xdelta = 1; %记录的间隔
X = [Xmin:Xdelta:Xmax]'; %所需要计算的插值位置
%下面计算分段线性插值的结果
Linear(:,1) = interp1(data(:,1), data(:,2), X);
%下面计算分段三次插值
Pchip(:,1) = interp1(data(:,1), data(:,2), X, 'pchip');
%下面计算三次样条插值
Spline(:,1) = interp1(data(:,1), data(:,2), X, 'spline');
%% 这一部分进行轮廓曲线的可视化操作
Xshow = X ./ 60; %展示时将单位换算成小时
scatter(data(:,1)./60, data(:,2),'k^')
hold on
plot(Xshow,Linear,'Color',[0.9 0.2 0]);
plot(Xshow, Pchip,'Color',[0 0.8 0.4]);
plot(Xshow, Spline,'Color',[0.1 0.3 0.8]);
xlabel('时间/h')
ylabel('车流量/min^{-1}')
title('三种插值方法效果比较')
box on
grid on
legend('原始数据点','分段线性插值','分段三次插值','三次样条插值','Location','NorthWest')
saveas(gcf, '三种插值方法效果比较.png')
%% 下面计算三种插值下的车流量估计值
S_linear = sum(Linear)
S_pchip = sum(Pchip)
S_spline = sum(Spline)