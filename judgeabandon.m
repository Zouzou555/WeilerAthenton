function [ flag ] = judgeabandon( encode,numencode,i )
%  �˳����жϱ��ü��Ķ���ε�ĳ�����Ƿ�
% Input:        encode: ����
%               numencode: �������
%               i:�������ü�����ε�ĳ����
% Output:       flag��1 ��ʾ�ñ���Ҫ��
%                     0 ��ʾ�ñ���Ҫ����
   flag = 1; %flag=1��ʾ�ñ���Ҫ��
   for k = 1 : numencode
       if (encode(i,4*k-3:4*k)&encode(i+1,4*k-3:4*k))==zeros(1,4);
       else
           flag = 0;%��ʾ����
           break;
       end
   end

end

