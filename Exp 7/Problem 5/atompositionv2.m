%% XΪ������2-25�ŵ��47*1ά����Point1��Point2Ϊ��Ӧ�ĵ��ţ�DistanceΪ����֮�����

function f = atompositionv2(X, Point1, Point2, Distance)
    Xused = [0, 0; 0, X(1)]; %����ĵ������
    for i = 2:2:(length(X)-1)
        Xused = [Xused; X(i), X(i+1)];
    end 
    f = 0; %��ʼ�������Ϊ0
    for i = 1:length(Point1)
        delta = (Xused(Point1(i),:)-Xused(Point2(i),:));
        f = f + (delta * delta' - Distance(i)^2)^2;
    end
end