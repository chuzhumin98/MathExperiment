clear all;
%% 数据的导入和各插值方法插值结果的计算
[data] = textread('data10.txt'); %第1,2,3列分别为x,y1,y2
Xmax =  max(data(:,1));
Xmin =  min(data(:,1));
Xdelta = 0.1; %记录的间隔
X = [Xmin:Xdelta:Xmax]'; %所需要计算的插值位置
%下面计算分段线性插值的结果
Linear(:,1) = interp1(data(:,1), data(:,2), X);
Linear(:,2) = interp1(data(:,1), data(:,3), X);
%下面计算分段三次插值
Pchip(:,1) = interp1(data(:,1), data(:,2), X, 'pchip');
Pchip(:,2) = interp1(data(:,1), data(:,3), X, 'pchip');
%下面计算三次样条插值
Spline(:,1) = interp1(data(:,1), data(:,2), X, 'spline');
Spline(:,2) = interp1(data(:,1), data(:,3), X, 'spline');
%% 下面这些操作的目的是使得上下线合并，便于数据可视化
Xtotal = [X; X(end:-1:1)];
dataXtotal = [data(:,1); data(end:-1:1,1)];
dataYtotal = [data(:,2); data(end:-1:1,3)];
LinearTotal = [Linear(:,1); Linear(end:-1:1,2)];
PchipTotal = [Pchip(:,1); Pchip(end:-1:1,2)];
SplineTotal = [Spline(:,1); Spline(end:-1:1,2)];
%% 这一部分进行轮廓曲线的可视化操作
scatter(dataXtotal, dataYtotal,'k^')
hold on
plot(Xtotal,LinearTotal,'Color',[0.9 0.2 0]);
plot(Xtotal, PchipTotal,'Color',[0 0.8 0.4]);
plot(Xtotal, SplineTotal,'Color',[0.1 0.3 0.8]);
xlabel('x')
ylabel('y')
title('三种插值方法效果比较')
box on
grid on
legend('原始数据点','分段线性插值','分段三次插值','三次样条插值','Location','NorthWest')
saveas(gcf, '三种插值方法效果比较.png')
%% 这一部分我们利用数值积分求解围成区域的面积
% 计算上下线的差值，进而对差值做数值积分
LinearDelta = Linear(:,1) - Linear(:,2);
PchipDelta = Pchip(:,1) - Pchip(:,2);
SplineDelta = Spline(:,1) - Spline(:,2);
S_linear = trapz(X, LinearDelta); %采用梯形公式求数值积分
S_pchip = trapz(X, PchipDelta);
S_spline = trapz(X, SplineDelta);
[S_linear, S_pchip, S_spline] %输出积分结果
%% 将加工所需数据导出（采用分段三次和三次样条插值的平均值作为参数值）
dataOut(:,1) = X; %第一列为x
dataOut(:,2) = (Pchip(:,1)+Spline(:,1))./2; %第二列为y1
dataOut(:,3) = (Pchip(:,2)+Spline(:,2))./2; %第三列为y2
csvwrite('output.csv',dataOut)