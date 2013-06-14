%% by Chuhang Zou
% 2013.6.11

function [Polygontab2]= construct_table(inter,Polygon)
% construct the linked table  
% naive version 
%
% Input:        inter: table of intersactions, 
%                      1st line: x-coordinate,2nd line: y-coordinate,3rd
%                      line: in-point or out-point
%               Polgon: table of the vertex of the polygon
% Output:       Polgontab: linked table
%
    nPolyVertex = size (Polygon,2);
    nInterVertex = size (inter,2);
    polytabindex = 1;
    Polygontab(1,polytabindex) =  Polygon(1,1);
    Polygontab(2,polytabindex) =  Polygon(2,1);
    Polygontab(3,polytabindex) =  0;
    polytabindex = polytabindex +1;
    
    for  i = 1 : (nPolyVertex-1)
        Polygontabtemp = [];
        intercount = 0;
        for j = 1 : nInterVertex
            [flag1]= isinline( inter(1,j),inter(2,j),Polygon(:,i),Polygon(:,i+1) );
            if flag1
                [flag2]= online(inter(1,j),inter(2,j),Polygon(:,i),Polygon(:,i+1));
                if flag2
                    intercount = intercount +1;
                    Polygontabtemp(1,intercount) =  inter(1,j);
                    Polygontabtemp(2,intercount) =  inter(2,j);
                    Polygontabtemp(3,intercount) =  inter(3,j);
                end
            end
            if intercount == 2;
                break;
            end
        end
         % modify the placement of intersection to be clock-wise
        if size(Polygontabtemp,2)==1;
            Polygontab(:,polytabindex) = Polygontabtemp(:,1); 
            polytabindex = polytabindex +1;
        end
        if size(Polygontabtemp,2)==2;
            d1 = (Polygon(1,i)-Polygontabtemp(1,1))^2+(Polygon(2,i)-Polygontabtemp(2,1))^2;
            d2 = (Polygon(1,i)-Polygontabtemp(1,2))^2+(Polygon(2,i)-Polygontabtemp(2,2))^2;
            if d1 > d2
                Polygontab(:,polytabindex) = Polygontabtemp(:,2);
                polytabindex = polytabindex +1;
                Polygontab(:,polytabindex) = Polygontabtemp(:,1);
                polytabindex = polytabindex +1;
            else
                Polygontab(:,polytabindex) = Polygontabtemp(:,1);
                polytabindex = polytabindex +1;
                Polygontab(:,polytabindex) = Polygontabtemp(:,2);
                polytabindex = polytabindex +1;
            end
        end  
        Polygontab(1,polytabindex) =  Polygon(1,i+1);
        Polygontab(2,polytabindex) =  Polygon(2,i+1);
        Polygontab(3,polytabindex) =  0;
        polytabindex = polytabindex +1;
    end
 
    % Delete Duplicate
    nPolyVertex = size (Polygontab,2);
    Polygontab2 = Polygontab(:,1);
    index = 1;
    for i = 1:(nPolyVertex-1)
        if Polygontab(1,i) ~= Polygontab(1,i+1) || Polygontab(2,i) ~= Polygontab(2,i+1) || Polygontab(3,i) ~= Polygontab(3,i+1)
            index = index +1;
        end
           Polygontab2(:,index) = Polygontab(:,i+1);
    end
            
end