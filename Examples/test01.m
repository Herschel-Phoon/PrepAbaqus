%����Abaqus����Ԫģ��
modelFEM = PrepAbaqus();
%��ȡ��άʵ�������
[surfEleNode,indexEle] = Solid2Surf(modelFEM.elementNode,modelFEM.typeEle);
%��������Ԫ����
hMesh = figure('numbertitle','off','name','FEM Model');
set(hMesh,'Renderer','zbuffer','Color',[1,1,1],'Position',[60,60,1200,600]);
view(150,-56); axis equal; axis manual; axis vis3d; axis(modelFEM.axisLim); axis off;
patch('Faces',surfEleNode(:,end:-1:1),'Vertices',modelFEM.nodeCoor,'FaceColor',...
    'interp','FaceVertexCData',modelFEM.nodeCoor(:,3),'EdgeColor','k','LineWidth',0.01);
load('ColorMaps'); colormap(cool2warm);
%������Ⱦ
camlight('headlight');
set(findobj(gca,'type','patch'),'FaceLighting','phong','AmbientStrength',0.3,...
    'DiffuseStrength',0.8,'SpecularStrength',0.5,'SpecularColorReflectance',1,...
    'SpecularExponent',15,'BackFaceLighting','unlit');