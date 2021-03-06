%% X为包含了2-25号点的47*1维矩阵，Point1和Point2为对应的点编号，Distance为它们之间距离

function f = atompositionv2(X, Point1, Point2, Distance)
    Xused = [0, 0; 0, X(1)]; %增广的点阵矩阵
    for i = 2:2:(length(X)-1)
        Xused = [Xused; X(i), X(i+1)];
    end 
    f = 0; %初始化距离和为0
    for i = 1:length(Point1)
        delta = (Xused(Point1(i),:)-Xused(Point2(i),:));
        f = f + (delta * delta' - Distance(i)^2)^2;
    end
end