
# calculates change over a given time period
# default is first year to last year
# requires a basic iep df with cols value and year
change <- function(df, years = c(min(df$year), max(df$year))) {
  
  df <- df %>%
    filter(year %in% years) %>%
    spread(year, value) 
  
  pos <- c((length(names(df)) - 1), length(names(df)))
  key <- names(df)[pos] 
  old <- key[1]
  new <- key[2]
  
  df$change <- df[[new]] - df[[old]] 
  df$percent <- (df$change / df[[old]])*100
  df$improved <- ifelse(df$change < 0, 1, 0) # a fall in score is an improvement
  
  return(df)
  
}



