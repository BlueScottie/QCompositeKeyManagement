function [ rawadjList,adjList ,NodeList ] = buildnetwork( Node_num ); 

threshold=250;
Length=1000;

NodeList=zeros(Node_num,3);
%generate ID
for k=1:Node_num
    NodeList(k,1)=k;
    NodeList(k,2)=randi(Length);
    NodeList(k,3)=randi(Length);
end

%Calculate the distance between each node
Distancematrix=zeros(Node_num,Node_num);
for k=1:Node_num
    for j=1:Node_num
        temp_x =(NodeList(k,2)-NodeList(j,2))^2;
        temp_y =(NodeList(k,3)-NodeList(j,3))^2;
        dis=sqrt(temp_x+temp_y);
        Distancematrix(k,j)=dis;
    end
end

%Calculate communicable relation
%0 -> cannot communicate
%2 -> can communicate
Rangematrix=zeros(Node_num,Node_num);
for k=1:Node_num
    for j=1:Node_num
        if(Distancematrix(k,j)==0)
            Rangematrix(k,j)=0;
        elseif(Distancematrix(k,j)<threshold)
            Rangematrix(k,j)=2;
        else
            Rangematrix(k,j)=0;
        end
    end
end
%Building up MST from Distancematrix
%in Distancematrix, all nodes are connected each other

min_span_tree_matrix = min_span_tree(Distancematrix);

%Overwrite min_span_tree to Rangematrix if the element is 1
adjList=Rangematrix;
for k=1:Node_num
    for j=1:Node_num
        if(min_span_tree_matrix(k,j)==1)
            adjList(k,j)=1;
        end
    end
end

rawadjList=adjList;

backup_adjList=adjList;
current_ID=2;
temp1=zeros(1,Node_num);
temp2=zeros(1,Node_num);
temp3=zeros(Node_num,1);
temp4=zeros(Node_num,1);
id_trans_table=1:1:Node_num;
for l=1:Node_num
    for k=l+1:Node_num
        if(backup_adjList(l,k)==1)
            for j=1:Node_num
                temp3(j,1)=backup_adjList(j,current_ID);
                temp4(j,1)=backup_adjList(j,k);
            end
            for j=1:Node_num
                backup_adjList(j,k)=temp3(j,1);
                backup_adjList(j,current_ID)=temp4(j,1);
            end
            for j=1:Node_num
                temp1(1,j)=backup_adjList(current_ID,j);
                temp2(1,j)=backup_adjList(k,j);
            end
            for j=1:Node_num
                backup_adjList(k,j)=temp1(1,j);
                backup_adjList(current_ID,j)=temp2(1,j);
            end
            temp=id_trans_table(1,current_ID);
            id_trans_table(1,current_ID)=id_trans_table(1,k);
            id_trans_table(1,k)=temp;
            current_ID=current_ID+1;
        end
    end
end

for k=1:Node_num
%    NodeList(k,1)=id_trans_table(1,k);
    NodeList(k,1)=find(id_trans_table==k);
end
adjList=backup_adjList;
end

