library(RColorBrewer)

df <- readRDS("./Data/summarySCC_PM25.rds")
head(df)

sumdf <- aggregate(Emissions ~ year, df, sum)
sumdf

png("plot1.png", width = 480, height = 480)

barplot(Emissions/10^6~year,
        sumdf,
        col=brewer.pal(4, "Pastel1"),
        xlab="Year",
        ylab="PM2.5 Emissions in Tons (10^6)",
        main="Total US PM2.5 Emissions 1999 to 2008")

dev.off()






















