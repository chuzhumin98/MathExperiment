clear all
data = textread('data11.txt');
y = data(:,2);
n = length(y);
X = zeros(n, 8);
X(:,1) = data(:,3); %x_1项
X(:,2) = data(:,4); %x_2项
X(:,3) = data(:,5); %x_3项
X(:,4) = data(:,3) .* data(:,4); %x_1*x_2项
X(:,5) = data(:,3) .* data(:,5); %x_1*x_3项
X(:,6) = data(:,4) .* data(:,5); %x_2*x_3项
X(:,7) = data(:,3) .* data(:,3); %x_1^2项
X(:,8) = data(:,5) .* data(:,5); %x_3^2项

stepwise(X, y,[1,5])


% plot(data(:,3),y,'+')
% xlim([1 11])
% title('y vs x_1')
% saveas(gcf, 'y vs x_1.png')
% 
% figure
% plot(data(:,4),y,'+')
% xlim([-0.5, 1.5])
% title('y vs x_2')
% saveas(gcf, 'y vs x_2.png')
% 
% figure
% plot(data(:,5),y,'+')
% xlim([0 1])
% title('y vs x_3')
% saveas(gcf, 'y vs x_3.png')
% 
% figure
% plot(data(:,3) .* data(:,4),y,'+')
% xlim([-1 11])
% title('y vs x_1x_2')
% saveas(gcf, 'y vs x_1x_2.png')
% 
% figure
% plot(data(:,3) .* data(:,5),y,'+')
% xlim([2 11])
% title('y vs x_1x_3')
% saveas(gcf, 'y vs x_1x_3.png')
% 
% figure
% plot(data(:,4) .* data(:,5),y,'+')
% xlim([-0.5 1.5])
% title('y vs x_2x_3')
% saveas(gcf, 'y vs x_2x_3.png')