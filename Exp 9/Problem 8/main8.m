clear all
%% ��0��,������������ʲ�����15%�����
data = textread('data.txt');
mu = mean(data);
mu = mu(2:4)-1; %ȡ��2,3,4��Ϊ���õľ�ֵ��(��Ҫȥ������1����Ϊ����)
V = cov(data(:,2:4)); %����Э�������
H = 2*V; %Э�������ĸ���Ԫ�ؾ���Ҫ��2
c = [0,0,0];
A1 = -mu;
b1 = -0.15;
A2 = [1,1,1];
b2 = [1];
v1 = [0,0,0];
v2 = [1,1,1];
x0 = [0,0,1];
[x,fv,ef,out,lag] = quadprog(H,c,A1,b1,A2,b2,v1,v2,x0);
%% ��1��,�۲������������ʱ仯ʱ�Ĳ����仯
b1s = 0.080:0.001:0.234; %ѡȡ���鲻ͬ��b1,�������������
xs = []; %��¼��֮��Ӧ���Ż����
fvs = []; %��¼���յı仯
for i=1:length(b1s)
    [x1,fv1,ef1,out1,lag1] = quadprog(H,c,A1,-b1s(i),A2,b2,v1,v2,x0);
    xs = [xs, x1];
    fvs = [fvs, fv1];
end
plot(b1s, xs(1,:), 'r', 'LineWidth',2)
hold on
plot(b1s, xs(2,:), 'b', 'LineWidth',2)
plot(b1s, xs(3,:), 'g', 'LineWidth',2)
xlabel('������������')
ylabel('��ռͶ�ʱ���')
title('��Ʊ��� vs ������������')
box on; grid on
legend('��ƱA','��ƱB','��ƱC','Location','NorthWest')
saveas(gcf, 'combine-rate.png')
figure
plot(b1s, fvs, 'b', 'LineWidth', 2)
xlabel('������������')
ylabel('Ͷ�ʷ���')
title('Ͷ�ʷ��� vs ������������')
box on; grid on
saveas(gcf, 'risk-rate.png')