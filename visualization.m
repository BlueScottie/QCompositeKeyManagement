function visualization( adjList, NodeList );
[Node_num,temp]=size(adjList);

%visualize node
figure(1);
plot(NodeList(1,2),NodeList(1,3),'r--o')
hold on
str = 'Gateway';
text(NodeList(1,2)+2,NodeList(1,3),str);

hold on

for k=2:Node_num
    plot(NodeList(k,2),NodeList(k,3),'r--o')
    hold on

end

%visualize edge
for k=1:Node_num
    for j=1:Node_num
        if(adjList(k,j)==1)
            target_nodeID1=find(NodeList(:,1)==k);
            target_nodeID2=find(NodeList(:,1)==j);
            X=[NodeList(target_nodeID1,2),NodeList(target_nodeID2,2)];
            Y=[NodeList(target_nodeID1,3),NodeList(target_nodeID2,3)];
            plot(X,Y,'r-');
            hold on
        end
    end
end

title(['\fontsize{16}Node number:',int2str(Node_num)])%,'  &  Slot number:',int2str(max(timeslot)+1)])
hold on


end



