function [ KeyList ] = KeyDeployment( NodeList, S, m );

Node_num = length(NodeList);
KeyList=[];

for i=1:Node_num
    KeyList = [KeyList;randsample(S,m)'];
end


end

