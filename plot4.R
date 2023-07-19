library(data.table)
library(dplyr)
library(RColorBrewer)


df <- readRDS("./Data/summarySCC_PM25.rds")
df2 <- readRDS("./Data/Source_Classification_Code.rds")

coal <- df2[df2$EI.Sector %ilike% "Coal" & df2$EI.Sector %ilike% "Comb",]
df3 <- df %>%
        right_join(coal, by = "SCC") %>%
        select(SCC, Emissions, year, EI.Sector)

sumdf <- aggregate(Emissions ~ year, df3, sum)
sumdf

png("plot4.png", width = 480, height = 480)

barplot(Emissions/10^5~year,
        sumdf,
        col=brewer.pal(4, "Pastel1"),
        xlab="Year",
        ylab="PM2.5 Emissions in Tons (10^5)",
        main="US Coal Combustion PM2.5 Emissions 1999 to 2008")

dev.off()
