function [ rawadjList,adjList ,NodeList ] = Connected_Network( Node )

flag=1;

while(1)
    [ rawadjList,adjList ,NodeList ] = buildnetwork( Node );
    adj_num=zeros(Node,1);
    
    for k=1:Node
        for l=1:Node
            if(adjList(k,l)==1)
                adj_num(k,1)=adj_num(k,1)+1;
            end
        end
    end
    
    for k=1:Node
        if(adj_num(k,1)==0)
            flag=0;
        end
    end
    
    if(flag==1)
        break;
    end
end


end

