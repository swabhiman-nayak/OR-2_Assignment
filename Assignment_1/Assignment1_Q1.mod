//This code can pe used in Cplex solver as a mod file
//Here you can edit the values of n,return,covariance matrix ans target return

//24IM10012 Nayan Balpande
//24IM10021 Kartik Gupta
//24IM10063 Swabhiman Nayak

// Number of Assets
int n=2;
// Returns
float r[1..n] = [0.10, 0.15];
// Covariance matrix
float Q[1..n][1..n] =[
  [0.0064,0.00288],
  [0.00288,0.0144]
];
// Target return
float R= 0.12;
// Decision variables: Weights
dvar float+ w[1..n];

// Objective: Minimize variance
minimize
  sum(i in 1..n, j in 1..n) w[i]*Q[i][j]*w[j];

// Constraints
subject to{
  // Sum of weights = 1
  sum(i in 1..n) w[i]== 1;
  // Target return constraint
  sum(i in 1..n) r[i]*w[i]==R;
}

// Output
execute{
  writeln("Optimal weights:");
  for(var i in 1..n)
    writeln("w[",i,"]=",w[i]);
}


