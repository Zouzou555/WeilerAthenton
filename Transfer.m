function [ newPolygon,newClipwin ] = Transfer( Polygon,Clipwin,nPolyVertex,nClipVertex,r )
%  �˳����������ϵ����ת
% Input:        Polygon: ��Ҫ�ü��Ķ����
%               Clipwin: the clipping window
%               nPolyVertex:���ü�����ζ������+1
%               nClipVertex:�ü�����ζ������+1
%               r������ת�ĽǶȣ���Ӧ��ϵ���£�
% 
% Output:       newPolygon����ת������µı��ü����������
%               newClipwin����ת������µĲü����������

ROT15 = (sqrt(6)+sqrt(2))/4*[1,-2+sqrt(3);2-sqrt(3),1];%15����ת��ת�ƾ���(r=1)
ROT30 = sqrt(3)/2*[1,-sqrt(3)/3;1,sqrt(3)/3];%30����ת��ת�ƾ���(r=2)
ROT45 = sqrt(2)/2*[1,-1;1,1];%45����ת��ת�ƾ���(r=3)
ROT60 = 1/2*[1,-sqrt(3);1,sqrt(3)];%60����ת��ת�ƾ���(r=4)
ROT75 = (sqrt(6)-sqrt(2))/4*[1,-2-sqrt(3);2+sqrt(3),1];%75����ת��ת�ƾ���(r=5)
Trans = { ROT15,ROT30,ROT45,ROT60,ROT75 };
newPolygon = [];
newClipwin = [];
   for i = 1 : nPolyVertex
       A = Trans{r}*[Polygon(1,i);Polygon(2,i)];
       newPolygon = [newPolygon,A];  %���α�������ϵ�µ��������
   end
   for i = 1 : nClipVertex
       A = Trans{r}*[Clipwin(1,i);Clipwin(2,i)];
       newClipwin = [newClipwin,A];
   end
end

