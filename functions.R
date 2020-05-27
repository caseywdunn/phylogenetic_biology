# simple simulation under the jc model
sim_jc = function( mu = 0.001, t = 100, n = 10000  ){
  beta = mu / 4
  i = t/n  # time interval per step
  y = sample( c('C', 'G', 'T', 'A', NA), size=n, replace = TRUE, prob=c( beta, beta, beta, beta, 1-4 * beta  ) )
  y[1] = sample( c('C', 'G', 'T', 'A') ) # initialize ancestral state
  
  t = which(!is.na(y))
  
  segments = tibble(
    nucleotide = y[t],
    start = t * i,
    end = c((t-1)[2:length(t)], length(y)) * i
    
  )
  
  segments
}