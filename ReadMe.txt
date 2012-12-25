========================================================================
    				NETRATE
========================================================================

Time plays an essential role in the diffusion of information, influence 
and disease over networks. In many cases we only observe when a node copies 
information, makes a decision or becomes infected -- but the connectivity,
transmission rates between nodes and transmission sources are unknown.
Inferring the underlying dynamics is of outstanding interest since it
enables forecasting, influencing and retarding infections, broadly construed.

To this end, we model diffusion processes as discrete networks of continuous
temporal processes occurring at different rates. Given cascade data --
observed infection times of nodes -- we infer the edges of the global
diffusion network and estimate the transmission rates of each edge that best
explain the observed data. 

The optimization problem is convex. The model naturally (without heuristics)
imposes sparse solutions and requires no parameter tuning. The problem
decouples into a collection of independent smaller problems, thus scaling
easily to networks on the order of hundreds of thousands of nodes.
Experiments on real and synthetic data show that our algorithm both recovers
the edges of diffusion networks and accurately estimates their transmission
rates from cascade data.

For more information about our method see:
  Uncovering the Temporal Dynamics of Diffusion Network 
  Manuel Gomez-Rodriguez, David Balduzzi, Bernhard Schölkopf. 
  http://www.stanford.edu/~manuelgr/pubs/netrate-icml11.pdf

CVX is needed for NetRate to work. CVX for Windows is available at http://cvxr.com/cvx/cvx.zip 
and for Unix (Linux, MACOSX) at http://cvxr.com/cvx/cvx.tar.gz.

Usage:

Infer the network given a text file with cascades (nodes and timestamps):

   [A_hat, total_obj, pr, mae] = netrate(network, cascades, horizon, type_diffusion, num_nodes)
   where,
     network: input ground-truth network (optional, example:''). Use [] for unknown groundtruth.
     cascades: input cascades (example:'example-cascades.txt').
     horizon: time window (example:10)
     type_diffusion: pairwise transmission model ('exp', 'pl' or 'rayleigh')
     num_nodes: number of nodes in the network (example:1024)
     
     A_hat: inferred transmission rates
     total_obj: optimal log-likelihood
     pr: precision-recall curve (empty if groundtruth is unknown)
     mae: normalized mean absolute error (empty if groundtruth is unknown) 

/////////////////////////////////////////////////////////////////////////////
Format input cascades:

The cascades input file should have two blocks separated by a blank line. 
- A first block with a line per node. The format of every line is <id>,<name>
- A second block with a line per cascade. The format of every line is <id>,<timestamp>,<id>,<timestamp>,<id>,<timestamp>...

A demo input file can be found under the name kronecker-core-periphery-n1024-h10-r0_01-0_25-1000-cascades.txt.
/////////////////////////////////////////////////////////////////////////////
Format ground truth:

The ground truth input file should have two blocks separated by a blank line
- A first block with a line per node. The format of every line is <id>,<name>
- A second block with a line per directed edge. The format of every line is <id1>,<id2>,alpha
where alpha is the pairwise transmission rate of the directed edge.

Demo input files (for the groundtruth and the cascades) can be found under
the name kronecker-core-periphery-n1024-h10-r0_01-0_25-1000-cascades.txt and
kronecker-core-periphery-n1024-h10-r0_01-0_25-network.txt.