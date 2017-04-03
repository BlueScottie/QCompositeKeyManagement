function Demo_WSN( Node, S )

%%
%build a network(spanning tree)
[ rawadjList,adjList ,NodeList ] = Connected_Network( Node );


%Network Visualization
visualization( adjList, NodeList);
hold on

OverlappingProbability=[];
for m = 1:ceil(S/2)
    %key deployment
    [ KeyList ] = KeyDeployment( NodeList, S, m );
    Probability=probability(adjList, KeyList);

    OverlappingProbability = [OverlappingProbability; Probability];
end
drawResult(OverlappingProbability, Node, S);

end

