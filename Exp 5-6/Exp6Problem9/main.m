clear all
format short
%% �����ĳ�ʼ��
a = 0.025; b = 0.02;
r = 1.5; N = 100;
X0 = [50, 10]; %�����ĳ�ʼֵ
%% ��ֵ������ⷽ����
[X Y] = fsolve(@jisheng, X0, [], a, b, r, N);