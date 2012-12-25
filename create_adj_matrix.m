function [A] = create_adj_matrix(filename, num_nodes)

A = zeros(num_nodes,num_nodes);

if ~exist(filename),
	return;
end

v = dlmread(filename); 
v = v(num_nodes+1:end,:); % take network edges

for i=1:length(v),
    A(v(i,1)+1, v(i,2)+1) = v(i,3);
end