# simple simulation under the jc model
sim_jc = function( mu = 0.001, t = 100, n = 1000, first =  NULL ){
  
  if( is.null(first)){
    first = sample( c('C', 'G', 'T', 'A') )
  }
  
  beta = mu / 4
  i = t/n  # time interval per step
  p = beta * i
  y = sample( c('C', 'G', 'T', 'A', NA), size=n, replace = TRUE, prob=c( p, p, p, p, (1 - 4 * p)  ) )
  y[1] = first # initialize ancestral state
  
  events = which(!is.na(y))
  
  segments = tibble(
    nucleotide = y[events],
    start = t * i,
    end = c((events-1)[2:length(events)], length(y)) * i
    
  )
  
  segments
}