%% ����ά��Ϊn��Ҫ������һ��XT�������

function XT = getRandom(n)
    xinit = rand(1,n); %���ɸ���ֵ������
    x = xinit / sum(xinit); %�������֮����й�һ��
    XT(1:n-1) = x(1:n-1);
    XT(n) = 50 + 250 * rand(); %�¶�ȡ-50��200��������
end