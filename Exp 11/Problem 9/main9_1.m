clear all
n = 100000; %�����ĵ���
samples = normrnd(0,1,1,n);
samples = sort(samples, 'descend'); %�����ݵ�������
intvalue = zeros(1,n); %�洢��Ӧ����ֵ����ֵ
intvalue(1) = samples(1);
for i=2:n
    intvalue(i) = intvalue(i-1)+samples(i);
end
intvalue = intvalue / n;
plot(samples, intvalue,'LineWidth',1.5)
hold on
splitNum = 0.2/2;
plot(samples, ones(1,n)*splitNum, 'LineWidth',1.5)
box on; grid on
xlabel('��������')
ylabel('����ֵ')
title('�������ؿ��巨���˻���')
legend('����ֵ','����ֵ')
saveas(gcf, 'figure1.png')