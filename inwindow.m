%% by Chuhang Zou
% 2013.6.11

function [sign]= inwindow(p1,Clipwin)
% determine if the point is in the clipping window
% draw a vertical line down from p1, if have odd intersection, in-point, otherwise out-point 
% vertical line: start:p1, end: x coordinate on the screen
% naive version 
%
% Input:        p1: start of the polygon vector(in clock-wise)
%               Clipwin: the clipping window
% Output:       sign: 1  - in point
%                     -1 - out point
%
%����һ�α���
minline = min(Clipwin');
maxline = max(Clipwin');
xmin = minline(1); %�ҵ�x��С��ֵ��
ymin = minline(2); %�ҵ�y��С��ֵ��
xmax = maxline(1); %�ҵ�x����ֵ��
ymax = maxline(2); %�ҵ�y����ֵ��

if p1(1)<=xmax & p1(1)>=xmin & p1(2)<=ymax & p1(2)>=ymin  %��ʾ���ڽ����ڣ����߽��ϵĵ������ڲ���
    sign=1;
else
    sign=-1;
end
end