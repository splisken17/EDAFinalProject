library(RColorBrewer)

df <- readRDS("./Data/summarySCC_PM25.rds")
head(df)

bal <- subset(df, fips == '24510')
head(bal)

sumdf <- aggregate(Emissions ~ year, bal, sum)
sumdf

png("plot2.png", width = 480, height = 480)

barplot(Emissions~year,
        sumdf,
        col=brewer.pal(4, "Pastel1"),
        xlab="Year",
        ylab="PM2.5 Emissions in Tons",
        main="Total Baltimore PM2.5 Emissions 1999 to 2008")

dev.off()
