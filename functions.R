# simple simulation under the jc model
sim_jc = function( mu = 1, t = 100, n = 1000, first =  NULL ){
  
  if( is.null(first)){
    first = sample( c('C', 'G', 'T', 'A') )
  }
  
  beta = mu / 4
  i = t/n  # time interval per step
  p = beta * i # expected change over the interval
  y = sample( c('C', 'G', 'T', 'A', NA), size=n, replace = TRUE, prob=c( p, p, p, p, (1 - 4 * p)  ) )
  y[1] = first # initialize ancestral state
  
  events = which(!is.na(y))
  
  start = (events-1) * i
  
  # If there multiple events, the end times are just the start time of the next events. If there is a single 
  # event, there are no future events with start times to consider.
  end = c()
  
  if ( length(events) > 1 ){
    end = start[2:length(events)]
  }
  
  # need to add the end time of the last event, which is just the total time elapsed
  end = c( end, t )
  
  segments = tibble(
    nucleotide = y[events],
    start = start,
    end = end
  )
  
  segments
}