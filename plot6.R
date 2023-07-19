library(ggplot2)
library(RColorBrewer)


df <- readRDS("./Data/summarySCC_PM25.rds")
df2 <- readRDS("./Data/Source_Classification_Code.rds")

bal <- subset(df, fips == '24510')
balcar <- subset(bal, type == "ON-ROAD")
sumbal <- aggregate(Emissions ~ year, balcar, sum)
sumbal$city <- "Baltimore City"
sumbal

la <- subset(df, fips == '06037')
lacar <- subset(la, type == "ON-ROAD")
sumla <- aggregate(Emissions ~ year, lacar, sum)
sumla$city <- "Los Angeles County"
sumla

sumdf <- rbind(sumbal, sumla)
sumdf

png("plot6.png", width = 480, height = 480)

ggplot(sumdf, aes(year, Emissions, group=city)) +
        geom_line(aes(color=city)) +
        geom_point(aes(color=city)) +
        labs(title="Baltimore vs LA Vehicle PM2.5 Emissions, 1999 to 2008", x="Year", y="PM2.5 Emissions in Tons") +
        guides(color=guide_legend(title="City"))

dev.off()


