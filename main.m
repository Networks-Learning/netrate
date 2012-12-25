network = 'kronecker-core-periphery-n1024-h10-r0_01-0_25-network.txt';
cascades = 'kronecker-core-periphery-n1024-h10-r0_01-0_25-1000-cascades.txt';

horizon = 10;
type_diffusion = 'exp';
num_nodes = 1024;

[A_hat, total_obj, pr, mae] = netrate(network, cascades, horizon, type_diffusion, num_nodes)