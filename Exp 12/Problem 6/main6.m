clear all
data = textread('DATA.txt'); %��������
% %% �����������ɢ��ͼ
% scatter(data(:,1), data(:,2), 80, 'b.')
% xlabel('height/cm')
% ylabel('weight/kg')
% title('height vs weight')
% box on
% saveas(gcf, 'height vs weight.png')
corrmatrix = corrcoef(data) %���������ϵ��
% figure
% %% �������Ƶ��ͼ
% hist(data(:,1))
% xlabel('height/cm')
% ylabel('frequency')
% title('height vs frequency')
% box on
% saveas(gcf, 'height vs frequency.png')
% figure
% %% ��������Ƶ��ͼ
% hist(data(:,2))
% xlabel('weight/kg')
% ylabel('frequency')
% title('weight vs frequency')
% box on
% saveas(gcf, 'weight vs frequency.png')
%% ������̬�Եļ���
alpha = 0.05;
[h1, p1, jbstat1, cv1] = jbtest(data(:,1), alpha);
[h2, p2, jbstat2, cv2] = jbtest(data(:,2), alpha);
[h3, p3, lstat3, cv3] = lillietest(data(:,1), alpha);
[h4, p4, lstat4, cv4] = lillietest(data(:,2), alpha);
%% ���е���ƺ��������
[mu1, sigma1, muci1, sigmaci1] = normfit(data(:,1), alpha);
[mu2, sigma2, muci2, sigmaci2] = normfit(data(:,2), alpha);
%% �仯�������Լ���
[h5, sig5, ci5] = ttest(data(:,1), 167.5, alpha, 0);
[h6, sig6, ci6] = ttest(data(:,2), 60.2, alpha, 0);