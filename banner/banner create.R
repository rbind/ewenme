library(packcircles)
library(ggplot2)

set.seed(1)

ncircles <- 1000
limits <- c(-500, 30)
inset <- diff(limits) / 5
maxarea <- 1000

areas <- rbeta(ncircles, 1, 5) * maxarea

res <- circleRepelLayout(areas, xlim = limits, ylim = limits)

cat(res$niter, "iterations performed")

dat.gg <- circleLayoutVertices(res$layout, sizetype = "radius")

dat.gg$fill <- dat.gg$x - dat.gg$y

# banner
png('themes/tuftesque/static/images/banner.png',
    width=1200,height=420,units="px",bg = "transparent")

ggplot(data = dat.gg, aes(x, y, group = id)) +
  geom_polygon(alpha=0.5, aes(fill=fill), colour="black") +
  scale_fill_gradient(low = "orchid2", high = "white") +
  coord_equal(xlim=limits, ylim=limits) +
  theme_void() +
  guides(fill=FALSE)

  dev.off()
  
# favicon
  png('static/img/favicon.png',
      width=128,height=128,units="px",bg = "transparent")
  
  ggplot(data = dat.gg, aes(x, y, group = id)) +
    geom_polygon(alpha=0.3, aes(fill=fill), colour="black") +
    scale_fill_gradient(low = "orchid2", high = "white") +
    coord_equal(xlim=limits, ylim=limits) +
    theme_void() +
    guides(fill=FALSE)
  
  dev.off()


