knitr::opts_chunk$set(echo = TRUE)

library(rmarkdown)
library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(scales)
library(rgdal)
library(sp)
library(classInt)
library(RColorBrewer)
library(rgeos)
library(ggmap)
library(mapview)

elec <- rbind(read_csv("S:/CEE224X/A1/Data/PGE_2017_Q1_ElectricUsageByZip.csv"), read_csv("S:/CEE224X/A1/Data/PGE_2017_Q2_ElectricUsageByZip.csv"), read_csv("S:/CEE224X/A1/Data/PGE_2017_Q3_ElectricUsageByZip.csv"), read_csv("S:/CEE224X/A1/Data/PGE_2017_Q4_ElectricUsageByZip.csv"))
gas <- rbind(read_csv("S:/CEE224X/A1/Data/PGE_2017_Q1_GasUsageByZip.csv"), read_csv("S:/CEE224X/A1/Data/PGE_2017_Q2_GasUsageByZip.csv"), read_csv("S:/CEE224X/A1/Data/PGE_2017_Q3_GasUsageByZip.csv"), read_csv("S:/CEE224X/A1/Data/PGE_2017_Q4_GasUsageByZip.csv"))

elec <- elec %>% filter(CUSTOMERCLASS == "Elec- Residential")
gas  <- gas %>% filter(CUSTOMERCLASS == "Gas- Residential")
colnames(gas)[6] <- "GASCUSTOMERS"
colnames(elec)[6] <- "ELECCUSTOMERS"

gas_elec <- bind_rows(elec, gas) %>% mutate_all(funs(replace(.,is.na(.),0)))

monthly_summaries <- gas_elec %>% group_by(CUSTOMERCLASS, MONTH) %>% summarize(monthly_total = sum(total_kbtu))
ggplot(monthly_summaries, aes(as.factor(MONTH), monthly_total)) + geom_bar(stat = "identity", aes(fill = CUSTOMERCLASS), position = "dodge") + labs(x = "Month", y = "kBTU", title = "PG&E Territory Monthly Energy Usage, 2017", fill = "Energy Type")

zip_yearly_avg <- gas_elec %>% group_by(ZIPCODE) %>% summarise(total_kbtu = sum(total_kbtu), total_elec = sum(ELECCUSTOMERS), total_gas = sum(GASCUSTOMERS))
zip_yearly_avg$total_custs <- apply(zip_yearly_avg[,c(3,4)],1,max)
# Remove entries with 0 customers
zip_yearly_avg <- zip_yearly_avg %>% filter(total_custs > 0)
zip_yearly_avg$yearly_avg <- zip_yearly_avg$total_kbtu/zip_yearly_avg$total_custs*12
zip_yearly_avg$ZIPCODE <- as.character(zip_yearly_avg$ZIPCODE)

ca_zips <- readOGR(dsn = "S:/CEE224X/A1/data/ca_zips", layer = "ca_zips")

ca_zips <- ca_zips[ca_zips@data$spatial_id %in% zip_yearly_avg$ZIPCODE,]
ca_zips@data <- ca_zips@data %>% left_join(zip_yearly_avg, by = c("spatial_id" = "ZIPCODE"))

breaks.qt <- classIntervals(ca_zips@data$yearly_avg, n = 5, style = "jenks", intervalClosure = "right")
breaks.qt$brks <- breaks.qt$brks %>% signif(digits = 2)
my.palette <- brewer.pal(n = 5, name = "Reds")

mapview(ca_zips, "yearly_avg", col = "transparent", col.regions = my.palette, at = breaks.qt$brks, legend = TRUE, layer.name = "Average Energy Use in kBTU")
#mapview(ca_zips, "yearly_avg", sp.layout = sp.raster, col = "transparent", col.regions = my.palette, at = breaks.qt$brks, legend = TRUE, layer.name = "Average Energy Use in kBTU")