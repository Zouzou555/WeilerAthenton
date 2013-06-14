function [ encode ] = Encodefunction( Polygon,Clipwin,nPolyVertex,nClipVertex )
%  �˳�����б��빤��
% Input:        Polygon: ��Ҫ�ü��Ķ����
%               Clipwin: the clipping window
% Output:       encode������ɵı���
minline = min(Clipwin');
maxline = max(Clipwin');
xmin = minline(1); %�ҵ�x��С��ֵ��
ymin = minline(2); %�ҵ�y��С��ֵ��
xmax = maxline(1); %�ҵ�x����ֵ��
ymax = maxline(2); %�ҵ�y����ֵ��
encode = [];
for i = 1 : (nPolyVertex)
    x = Polygon(1,i);
    y = Polygon(2,i);
    if x<=xmax & x>=xmin 
        if y<=ymax & y>=ymin
            encode = [encode;0,0,0,0];
        elseif y>ymax
            encode = [encode;1,0,0,0];
        else
            encode = [encode;0,1,0,0];
        end
    elseif x>xmax
            if y>=ymax
                encode = [encode;1,0,1,0];
            elseif y<=ymin
                encode = [encode;0,1,1,0];
            else
                encode = [encode;0,0,1,0];
            end
    else
        if y>=ymax
                encode = [encode;1,0,0,1];
            elseif y<=ymin
                encode = [encode;0,1,0,1];
            else
                encode = [encode;0,0,0,1];
        end
    end
end
end

