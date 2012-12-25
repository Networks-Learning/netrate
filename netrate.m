function [A_hat, total_obj, pr, mae] = netrate(network, cascades, horizon, type_diffusion, num_nodes)

min_tol = 1e-4;

pr = zeros(1,2);

disp 'Reading groundtruth...'
A = create_adj_matrix(network, num_nodes);

disp 'Reading cascades...'
C = create_cascades(cascades, num_nodes);

disp 'Building data structures...'
[A_hat, total_obj] = estimate_network(A, C, num_nodes, horizon, type_diffusion);

if exist(network),
    mae = mean(abs(A_hat(A~=0)-A(A~=0))./A(A~=0)); % mae
    pr(2) = sum(sum(A_hat>min_tol & A>min_tol))/sum(sum(A>min_tol)); % recall
    pr(1) = sum(sum(A>min_tol))/sum(sum(A_hat>min_tol)); % precision
else
    mae = [];
    pr = [];
    
end

save(['solution-', network], 'A_hat', 'mae', 'pr', total_obj);