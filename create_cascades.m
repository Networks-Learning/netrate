function [C] = create_cascades(filename, num_nodes)

if ~exist(filename),
	C = [];
	return;
end

v = dlmread(filename);
v = v(num_nodes+1:end,:); % take network edges

C = -ones(size(v,1),num_nodes);

for i=1:size(v,1),
    C(i, v(i,1)+1) = v(i, 2);
    
    j = 3;
    while (j < size(v,2) && v(i, j+1) > 0)
        C(i, v(i,j)+1) = v(i, j+1);
        j = j+2;
    end
end