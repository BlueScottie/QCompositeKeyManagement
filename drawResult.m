function DrawResult(OverlappingProbability, Node, S)

%visualize node
figure(2);
plot(OverlappingProbability','b--o')

hold on
xlim([1 length(OverlappingProbability)])
ylabel('Probability')
ylabel('m')

title(['\fontsize{16}Node number:',int2str(Node),'  &  S:',int2str(S)])



end



