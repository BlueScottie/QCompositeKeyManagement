function Probability=probability(adjList, KeyList)

[temp, Key_num]=size(KeyList);
Node_num = length(adjList);
Edge_num = 0;
SharedEdge_num = 0;
for i=1:Node_num
    for j=1:Node_num
        if(adjList(i,j)==1)
            Edge_num = Edge_num+1;
            %Confirm duplication
            KeysinTwoNode= [KeyList(i,:),KeyList(j,:)];
            uniqueKeys = unique(KeysinTwoNode);
            if(length(KeysinTwoNode)-length(uniqueKeys) > 0)
                SharedEdge_num = SharedEdge_num + 1;
            end
        end
    end
end

Probability = SharedEdge_num/Edge_num;

end



