clear all;
%% �������ݣ����鿴���Լ����´��µ�Ч��ͼ��
[data] = textread('data11.txt'); %��1,2,3�зֱ�Ϊx,y1,y2
Xtotal = [data(:,1); data(end:-1:1,1)];
Ytotal = [data(:,2); data(end:-1:1,3)];
plot(Xtotal,Ytotal,'Color',[0.9 0.2 0]);
xlabel('x')
ylabel('y')
title('���Լ����±߽����Ч��')
box on
grid on
saveas(gcf, '�߽����Ч��ͼ.png')
%% ����ù��������
%�ȵ��ϱ�����Ĳ�ֵ������ֻ��һ����ֵ����
Ydelta = data(:,3) - data(:,2); 
S_map = trapz(data(:,1), Ydelta) %��ͼ�ϵ��������λmm^2
S = S_map*(40/18)^2 %��ʵ�е��������λΪkm^2