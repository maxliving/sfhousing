library(ggplot2)
source("date.r")
source("explore-data.r")
source("explore-inflation.r")
theme_set(theme_bw())

# Basic summaries of data --------------------------------------
daily <- ddply(geo, .(date), function(df) {
  data.frame(
    n = nrow(df),
    avg_priceadj = mean(df$priceadj, na.rm = TRUE), 
    avg_price = mean(df$price, na.rm = TRUE), 
    cpi = df$cpi[1]
  )
})

qplot(date, n, data = daily, geom = "line", ylab = "Number of sales") + xlab(NULL)
ggsave(file = "beautiful-data/graphics/daily-sales.pdf", width = 8, height = 4)

qplot(date, avg_price / 1e6, data = daily, geom = "line", ylab = "Average price (millions)") + xlab(NULL)
ggsave(file = "beautiful-data/graphics/daily-price.pdf", width = 8, height = 4)


qplot(date, cpi / cpi[1], data = daily, geom = "line", ylab = "Inflation", xlim=) + xlab(NULL)
ggsave(file = "beautiful-data/graphics/daily-cpi.pdf", width = 8, height = 4)

ggplot(daily, aes(x = date)) + 
  geom_line(aes(y = avg_price / 1e6), colour = "grey60") + 
  geom_line(aes(y = avg_priceadj / 1e6)) + 
  labs(x = NULL, y = "Average price (millions)")
ggsave(file = "beautiful-data/graphics/daily-price-adj.pdf", width = 8, height = 4)
