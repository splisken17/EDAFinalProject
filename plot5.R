library(RColorBrewer)


df <- readRDS("./Data/summarySCC_PM25.rds")
df2 <- readRDS("./Data/Source_Classification_Code.rds")

bal <- subset(df, fips == '24510')
head(bal)

car <- subset(bal, type == "ON-ROAD")
str(car)
head(car)

sumdf <- aggregate(Emissions ~ year, car, sum)
sumdf

png("plot5.png", width = 480, height = 480)

barplot(Emissions~year,
        sumdf,
        col=brewer.pal(4, "Pastel1"),
        xlab="Year",
        ylab="PM2.5 Emissions in Tons",
        main="Baltimore Vehicle PM2.5 Emissions 1999 to 2008")

dev.off()


