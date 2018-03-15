clear all;
%% 导入数据，并查看线性假设下大致的效果图像
[data] = textread('data11.txt'); %第1,2,3列分别为x,y1,y2
Xtotal = [data(:,1); data(end:-1:1,1)];
Ytotal = [data(:,2); data(end:-1:1,3)];
plot(Xtotal,Ytotal,'Color',[0.9 0.2 0]);
xlabel('x')
ylabel('y')
title('线性假设下边界近似效果')
box on
grid on
saveas(gcf, '边界近似效果图.png')
%% 计算该国国土面积
%等到南北距离的差值，方便只求一次数值积分
Ydelta = data(:,3) - data(:,2); 
S_map = trapz(data(:,1), Ydelta) %地图上的面积，单位mm^2
S = S_map*(40/18)^2 %现实中的面积，单位为km^2