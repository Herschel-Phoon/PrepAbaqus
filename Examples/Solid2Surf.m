function [surfEleNode,indexEle] = Solid2Surf(elementNode,typeEle)
%AQUASϵ��֮-��ȡ��άʵ�������ĵ�Ԫ-�ڵ����
%������
%Email:lizuyu0091@163.com
%Last modified: April 11, 2019    
    switch typeEle
        case {'3D4'}
            idx = [1,2,4;2,3,4;3,1,4;1,3,2];
            surfEleNode = [elementNode(:,idx(1,:));elementNode(:,idx(2,:));
                           elementNode(:,idx(3,:));elementNode(:,idx(4,:))];              
        case {'3D8'}
            idx = [1,2,6,5;3,4,8,7;4,1,5,8;2,3,7,6;5,6,7,8;4,3,2,1];
            surfEleNode = [elementNode(:,idx(1,:));elementNode(:,idx(2,:));
                           elementNode(:,idx(3,:));elementNode(:,idx(4,:));
                           elementNode(:,idx(5,:));elementNode(:,idx(6,:))];            
    end    
    [~,~,indexn] = unique(sort(surfEleNode,2),'rows'); %���ظ��ļ�Ϊ�����
    [n,xout]=hist(indexn,unique(indexn));
    indexSurf = ismember(indexn,xout(n==1));
    surfEleNode = surfEleNode(indexSurf,:); %�����ĵ�Ԫ-�ڵ����
    nEle = size(elementNode,1);
    indexEle = mod(find(indexSurf),nEle);
    indexEle(indexEle==0) = nEle; %��Ӧ�ĵ�Ԫ���(���ظ�ֵ)    
end