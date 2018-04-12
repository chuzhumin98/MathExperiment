%% XΪ������2-25�ŵ��24*2ά����Point1��Point2Ϊ��Ӧ�ĵ��ţ�DistanceΪ����֮�����

function f = atomposition(X, Point1, Point2, Distance)
    Xused = [0, 0; X]; %����ĵ������
    f = 0; %��ʼ�������Ϊ0
    for i = 1:length(Point1)
        delta = (Xused(Point1(i),:)-Xused(Point2(i),:));
        f = f + (delta * delta' - Distance(i))^2;
    end
end