# Make map of region
library(maps)

rlong <- c(-124.5, -113.5)
rlat <- c(32.5, 42.5)



ca <- data.frame(map("county", xlim = rlong, ylim = rlat, plot = F, fill = T)[c("x", "y")])
camap <- c(
  geom_path(aes(x, y), data = ca, colour=alpha("grey40", 0.5), size = 0.5),
  xlim(rlong),
  ylim(rlat)
)


bayarea <- c(
  geom_polygon(aes(x, y), data = ca, colour=alpha("grey40", 0.5), size = 0.5, fill = "grey95"),
  coord_cartesian(xlim = c(-123.5576, -120.5427), ylim = c(35.80061, 38.84582))
)