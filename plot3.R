library(ggplot2)
library(RColorBrewer)

df <- readRDS("./Data/summarySCC_PM25.rds")
head(df)

bal <- subset(df, fips == '24510')
head(bal)

sumdf <- aggregate(Emissions ~ year + type, bal, sum)
sumdf

png("plot3.png", width = 480, height = 480)

ggplot(sumdf, aes(year, Emissions, group=type)) +
        geom_line(aes(color=type)) +
        geom_point(aes(color=type)) +
        labs(title="Baltimore PM2.5 Emissions by Type, 1999 to 2008", x="Year", y="PM2.5 Emissions in Tons") +
             guides(color=guide_legend(title="Type"))

dev.off()
