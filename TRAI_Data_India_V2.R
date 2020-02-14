#Accumulating TRAI data to make a usable dataFrame

year = c(09, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19)

india_pop_total = 1210

wired_broadband_total = c(7.57, 10.71, 13.13, 14.82, 14.47, 15.23, 16.38, 18.06, 17.85, 18.09, 19.13)
wireless_broadband_total = c(0, 0, 0, 0, 0, 66.99, 115.11, 200.20, 332.85, 493.81, 642.14)

urban_wireless = c(0, 0, 581.33, 553.91, 523.80, 546.99, 577.84, 638.46, 664.94, 645.71, 647.33)
rural_wireless = c(0, 0, 303.04, 336.70, 357.33, 390.06, 431.61, 461.05, 497.53, 526.05, 507.26)

teledensity_urban = c(0, 0 ,159.92, 149.32, 138.42, 141.75, 146.89, 159.27, 162.84, 155.28, 152.92)
teledensity_rural = c(0, 0, 36.05, 39.67, 41.71, 45.13, 49.51, 52.45, 56.15, 58.92, 56.40)
total_broadband = c(7.57, 10.71, 13.13, 14.82, 14.47, 82.22, 131.49, 218.26, 350.70, 511.90, 661.27)

unconnected = c(1294 -total_broadband)
unconnected
wired_phone = c(37.16, 35.19, 32.96, 30.87, 29.01, 27.14, 25.72, 24.44, 23.41, 21.96, 21.29)
total_subscribers = c(543.20, 742.12, 917.33, 921.47, 910.14, 964.20, 1035.18, 1123.96, 1185.88, 1193.72, 1175.88)

trai_df = data.frame(rural_wireless, urban_wireless, wired_broadband_total, wireless_broadband_total,
                     teledensity_rural, teledensity_urban, total_broadband, wired_phone, total_subscribers)

trai_df

trai_v2_df = data.frame(year, rural_wireless, urban_wireless, wired_broadband_total, wireless_broadband_total,
                        teledensity_rural, teledensity_urban, total_broadband, wired_phone, total_subscribers, unconnected)

trai_v2_df

teledensity_df <- cbind.data.frame(trai_df$teledensity_rural, trai_df$teledensity_urban)
teledensity_df
plot(teledensity_df)
plot(trai_df)
#Plotting the new dataframe with dates to see if we can get dates on our x axis

plot(trai_v2_df$year, trai_v2_df$teledensity_rural)
summary(trai_v2_df)

#invoking ggplot2
library(ggplot2)
qplot(trai_v2_df$year, trai_v2_df$wireless_broadband_total)

discrete_year <- cut(year, breaks = year)
discrete_year
qplot(year, trai_v2_df$wireless_broadband_total, data = trai_v2_df, geom = c("point", "smooth"))

qplot(year, trai_v2_df$wireless_broadband_total, data = trai_v2_df, geom = c("point", "smooth"))

tab <-trai_v2_df
plot(tab[,3],type="b",ylim=c(min(tab),max(tab)),col="red",lty=1,ylab="Value",lwd=2,xlab="Year",xaxt="n")
plot(tab[,2],type="b",ylim=c(min(tab),max(tab)),col="blue",lty=1,ylab="Value",lwd=2,xlab="Year",xaxt="n")
#Main plot time
plot(tab[,10],type="b",ylim=c(min(tab),max(tab)),col="red",lty=1,ylab="Value",lwd=2,xlab="Year",xaxt="n")
#Plotting second line
lines(tab[,5],type="b",col="black",lty=2,lwd=2)
lines(tab[,4],type="b",col="orange",lty=2,lwd=2)
lines(tab[,11],type="b",col="green",lty=2,lwd=2)
grid()
legend("topleft",legend=colnames(tab),lty=c(1,2,3, 4),col=c("red","black","orange", "green"),bg="white",lwd=2)
axis(1,at=c(1:nrow(tab)),labels=rownames(year))


