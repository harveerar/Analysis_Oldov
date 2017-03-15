library(survival)

dataTCGA<- read.table("/Users/veerarah/pubs/pubs/2017/ovary/PlosMed/analysis/TCGAOnlyCases.csv", sep=",", header=TRUE)
dataMSK <-read.table("/Users/veerarah/pubs/pubs/2017/ovary/PlosMed/analysis/MSKOnlyCases.csv", sep=",", header=TRUE)

##### KM survival curves for clusters grouped using ISTH measures
par(mfrow=c(2,2), mar=c(4,5,3,1))

## PFS using Clustering of ISTH
slo <- dataMSK$ClusterIDISTH==3
smid <- dataMSK$ClusterIDISTH==4
shi <- dataMSK$ClusterIDISTH==1
suhi <- dataMSK$ClusterIDISTH==2
monthsLo <- dataMSK$PFS[slo]
monthsMid <- dataMSK$PFS[smid]
monthsHi <- dataMSK$PFS[shi]
monthsUHi <- dataMSK$PFS[suhi]


mfitLo <- survfit(Surv(monthsLo, dataMSK$Recurrence[slo])~1)
mfitMid <- survfit(Surv(monthsMid, dataMSK$Recurrence[smid])~1)
mfitHi <- survfit(Surv(monthsHi, dataMSK$Recurrence[shi])~1)
mfitUHi <- survfit(Surv(monthsUHi, dataMSK$Recurrence[suhi])~1)


plot(mfitLo, conf.int=FALSE, mark.time = TRUE, mark= 3, col='royalblue3', xaxs="S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitMid, conf.int=FALSE, mark.time = TRUE, mark = 3, col='purple1', xaxs="S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, lty=2)
lines(mfitHi, conf.int=FALSE, mark.time = TRUE, mark = 3, col='orangered', xaxs="S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, lty=1)
lines(mfitUHi, conf.int=FALSE, mark.time = TRUE, mark = 3, col='black', xaxs = "S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, lty=2)

legend(x="topright", .6, c('Low ISTH', 'Medium ISTH', 'High ISTH', 'Ultra-high ISTH'), 
       col=c('royalblue3', 'purple1', 'orangered', 'black'), cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")

title('(a) MSKCC: ISTH-Clustering PFS')


## PFS using clustering of Textures into 3 groups
# low vs. rest
sediff <- dataMSK$ClusterIDTextures==2
survdiff(Surv(dataMSK$PFS, dataMSK$Recurrence)~sediff)

# low vs. high
data21 <- dataMSK[dataMSK$ClusterIDTextures==2 | dataMSK$ClusterIDTextures==1,]
sediff<- data21$ClusterIDTextures==2
survdiff(Surv(data21$PFS, data21$Recurrence)~sediff)
survdiff(Surv(data21$OS, data21$status)~sediff)

#low vs. mid
data23 <- dataMSK[dataMSK$ClusterIDTextures==2 | dataMSK$ClusterIDTextures==3,]
sediff<- data23$ClusterIDTextures==2
survdiff(Surv(data23$PFS, data23$Recurrence)~sediff)
survdiff(Surv(data23$OS, data23$status)~sediff)

# high vs. rest
sediff<- dataMSK$ClusterIDTextures==1
survdiff(Surv(dataMSK$PFS, dataMSK$Recurrence)~sediff)
survdiff(Surv(dataMSK$OS, dataMSK$status)~sediff)

## generate plots
slo <- dataMSK$ClusterIDTextures==2
smid <- dataMSK$ClusterIDTextures==3
shi <- dataMSK$ClusterIDTextures==1

monthsLo <- dataMSK$PFS[slo]
monthsMid <- dataMSK$PFS[smid]
monthsHi <- dataMSK$PFS[shi]

mfitLo <- survfit(Surv(monthsLo, dataMSK$Recurrence[slo])~1)
mfitMid <- survfit(Surv(monthsMid, dataMSK$Recurrence[smid])~1)
mfitHi <- survfit(Surv(monthsHi, dataMSK$Recurrence[shi])~1)


plot(mfitLo, conf.int=FALSE, col='royalblue3', xlab='Time(months)', ylab="Proportion Surviving", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitMid, conf.int=FALSE, col='purple1', xlab='Time(months)', ylab="Proportion Surviving", lwd=3, lty=2)
lines(mfitHi, conf.int=FALSE, col='orangered', xlab='Time(months)', ylab="Proportion Surviving", lwd=3, lty=1)

legend(x="topright", .9, c('Low Entropy', 'Medium Entropy', 'High Entropy'), 
       col=c('royalblue3', 'purple1', 'orangered'), cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")

title('(b) MSKCC: Texture-Clustering PFS')



######### PFS for TCIA ISTH clustering  into 4 groups
## low + med vs. high + ultrahigh
sediff <- dataTCGA$ClusterIDISTH==3 | dataTCGA$ClusterIDISTH==4
survdiff(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~sediff)

survdiff(Surv(dataTCGA$OS, dataTCGA$status)~sediff)

## low vs. med
data34 <- dataTCGA[dataTCGA$ClusterIDISTH==3 | dataTCGA$ClusterIDISTH==4,]
sediff <- data34$ClusterIDISTH==3
survdiff(Surv(data34$PFS, data34$Recurrence)~sediff)
survdiff(Surv(data34$OS, data34$status)~sediff)

## low vs. high
data31 <- dataTCGA[dataTCGA$ClusterIDISTH==3 | dataTCGA$ClusterIDISTH==1,]
sediff <- data31$ClusterIDISTH==3
survdiff(Surv(data31$PFS, data31$Recurrence)~sediff)
survdiff(Surv(data31$OS, data31$status)~sediff)

data32 <- dataTCGA[dataTCGA$ClusterIDISTH==3 | dataTCGA$ClusterIDISTH==2,]
sediff <- data32$ClusterIDISTH==3
survdiff(Surv(data32$PFS, data32$Recurrence)~sediff)
survdiff(Surv(data32$OS, data32$status)~sediff)

### generate the plots
slo <- dataTCGA$ClusterIDISTH==3
smid <- dataTCGA$ClusterIDISTH==4
shi <- dataTCGA$ClusterIDISTH==1
suhi <- dataTCGA$ClusterIDISTH==2
monthsLo <- dataTCGA$PFS[slo]
monthsMid <- datTCGA$PFS[smid]
monthsHi <- dataTCGA$PFS[shi]
monthsUHi <- dataTCGA$PFS[suhi]


mfitLo <- survfit(Surv(monthsLo, dataTCGA$Recurrence[slo])~1)
mfitMid <- survfit(Surv(monthsMid, dataTCGA$Recurrence[smid])~1)
mfitHi <- survfit(Surv(monthsHi, dataTCGA$Recurrence[shi])~1)
mfitUHi <- survfit(Surv(monthsUHi, dataTCGA$Recurrence[suhi])~1)


plot(mfitLo, conf.int=FALSE, col='royalblue3', xlab='Time(months)', ylab="Proportion Surviving", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitMid, conf.int=FALSE, col='purple1', xlab='Time(months)', ylab="Proportion Surviving", lwd=3, lty=2)
lines(mfitHi, conf.int=FALSE, col='orangered', xlab='Time(months)', ylab="Proportion Surviving", lwd=3, lty=1)
lines(mfitUHi, conf.int=FALSE, col='black', xlab='Time(months)', ylab="Proportion Surviving", lwd=3, lty=2)

legend(x="topright", .9, c('Low ISTH', 'Medium ISTH', 'High ISTH', 'Ultra-high ISTH'), 
       col=c('royalblue3', 'purple1', 'orangered', 'black'), cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")

title('(c) TCIA: ISTH-Clustering PFS')


#### Textures 
sediff <- dataTCGA$ClusterIDTextures==2 | dataTCGA$ClusterIDTextures==3
survdiff(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~sediff)
survdiff(Surv(dataTCGA$OS, dataTCGA$status)~sediff)

sediff <- dataTCGA$ClusterIDTextures==2
survdiff(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~sediff)
survdiff(Surv(dataTCGA$OS, dataTCGA$status)~sediff)

## low vs. high
data21 <- dataTCGA[dataTCGA$ClusterIDTextures==2 | dataTCGA$ClusterIDTextures==1,]
sediff<- data21$ClusterIDTextures==2
survdiff(Surv(data21$PFS, data21$Recurrence)~sediff)
survdiff(Surv(data21$OS, data21$status)~sediff)

# low vs. mid
data23 <- dataTCGA[dataTCGA$ClusterIDTextures==2 | dataTCGA$ClusterIDTextures==3,]
sediff<- data23$ClusterIDTextures==2
survdiff(Surv(data23$PFS, data23$Recurrence)~sediff)
survdiff(Surv(data23$OS, data23$status)~sediff)

## generate plots
slo <- dataTCGA$ClusterIDTextures==2
smid <- dataTCGA$ClusterIDTextures==3
shi <- dataTCGA$ClusterIDTextures==1

monthsLo <- dataTCGA$PFS[slo]
monthsMid <- dataTCGA$PFS[smid]
monthsHi <- dataTCGA$PFS[shi]

mfitLo <- survfit(Surv(monthsLo, dataTCGA$Recurrence[slo])~1)
mfitMid <- survfit(Surv(monthsMid, dataTCGA$Recurrence[smid])~1)
mfitHi <- survfit(Surv(monthsHi, dataTCGA$Recurrence[shi])~1)


plot(mfitLo, conf.int=FALSE, col='royalblue3', xlab='Time(months)', ylab="Proportion Surviving", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitMid, conf.int=FALSE, col='purple1', xlab='Time(months)', ylab="Proportion Surviving", lwd=3, lty=2)
lines(mfitHi, conf.int=FALSE, col='orangered', xlab='Time(months)', ylab="Proportion Surviving", lwd=3, lty=1)

legend(x="topright", .9, c('Low Entropy', 'Medium Entropy', 'High Entropy'), 
       col=c('royalblue3', 'purple1', 'orangered'), cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")

title('(d) TCIA: Texture-Clustering PFS')

##########################################################

##### Cox Regression
### Using the clusters computed using heterogeneity measures-
## clusters were computed using unsupervised self-tuning spectral clustering of 
## texture heterogeneity measures and separately using Haralick texture measures
#MSKCC
##PFS
dataMSK["dSites"] <- as.numeric(dataMSK$Sites > median(dataMSK$Sites))
dataTCGA["dSites"] <- as.numeric(dataTCGA$Sites > median(dataTCGA$Sites))

#mod.mskccSitesVolumeClustHetPFS <- coxph(Surv(dataMSK$PFS, dataMSK$Recurrence)~
#                                            Sites+Volume+ClusterIDISTH+ClusterIDTextures,
#                                         data=dataMSK)
### ISTH measures
mod.mskccSitesVolumeClustHetPFS <- coxph(Surv(dataMSK$PFS, dataMSK$Recurrence)~
                                           Sites+Volume+ClusterIDISTH,
                                         data=dataMSK)

summary(mod.mskccSitesVolumeClustHetPFS)

## Haralick measures
mod.mskccSitesVolumeClustHetPFS <- coxph(Surv(dataMSK$PFS, dataMSK$Recurrence)~
                                           Sites+Volume+ClusterIDTextures,
                                         data=dataMSK)

summary(mod.mskccSitesVolumeClustHetPFS)


## using discrete sites >7 versus <= 7
mod.mskccSitesVolumeClustHetPFS <- coxph(Surv(dataMSK$PFS, dataMSK$Recurrence)~
                                           dSites+Volume+ClusterIDISTH+ClusterIDTextures,
                                         data=dataMSK)
summary(mod.mskccSitesVolumeClustHetPFS)


###OS
## ISTH
mod.mskccSitesVolumeClustHetOS <- coxph(Surv(dataMSK$OS, dataMSK$status)~
                                          Sites+Volume+ClusterIDISTH,
                                        data=dataMSK)

summary(mod.mskccSitesVolumeClustHetOS)

## Haralick
mod.mskccSitesVolumeClustHetOS <- coxph(Surv(dataMSK$OS, dataMSK$status)~
                                          Sites+Volume+ClusterIDTextures,
                                        data=dataMSK)

summary(mod.mskccSitesVolumeClustHetOS)

## using discrete sites >7 versus <= 7
mod.mskccSitesVolumeClustHetOS <- coxph(Surv(dataMSK$OS, dataMSK$status)~
                                          dSites+Volume+ClusterIDISTH+ClusterIDTextures,
                                        data=dataMSK)
summary(mod.mskccSitesVolumeClustHetOS)



#### TCIA
##PFS
#ISTH
mod.tcgaSitesVolumeClustHetPFS <- coxph(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~
                                          Sites+Volume+ClusterIDISTH,data=dataTCGA)

summary(mod.tcgaSitesVolumeClustHetPFS)

# Haralick
mod.tcgaSitesVolumeClustHetPFS <- coxph(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~
                                          Sites+Volume+ClusterIDTextures,data=dataTCGA)
summary(mod.tcgaSitesVolumeClustHetPFS)

## using discrete sites >4 versus <=4
mod.tcgaSitesVolumeClustHetPFS <- coxph(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~
                                          dSites+Volume+ClusterIDISTH+ClusterIDTextures,data=dataTCGA)
summary(mod.tcgaSitesVolumeClustHetPFS)


###OS
##ISTH
mod.tcgaSitesVolumeClustHetOS <- coxph(Surv(dataTCGA$OS, dataTCGA$status)~
                                         Sites+Volume+ClusterIDISTH,data=dataTCGA)

summary(mod.tcgaSitesVolumeClustHetOS)

#Haralick
mod.tcgaSitesVolumeClustHetOS <- coxph(Surv(dataTCGA$OS, dataTCGA$status)~
                                         Sites+Volume+ClusterIDTextures,data=dataTCGA)

summary(mod.tcgaSitesVolumeClustHetOS)

## using discrete sites > 4 versus <= 4
mod.tcgaSitesVolumeClustHetOS <- coxph(Surv(dataTCGA$OS, dataTCGA$status)~
                                         dSites+Volume+ClusterIDISTH+ClusterIDTextures,data=dataTCGA)
summary(mod.tcgaSitesVolumeClustHetOS)


### Multi-variate Cox regression using continuous valued ISTH measures (cSE, cluVar or cSCV, cluDiss or cSCP), volume+sites
##MSKCC 
#PFS
mod.mskccISTHVolumeSitesPFS <- coxph(Surv(dataMSK$PFS, dataMSK$Recurrence)~
                                       Sites+Volume+cSE+cSCV+cSCP, data=dataMSK)
summary(mod.mskccISTHVolumeSitesPFS)

#OS
mod.mskccISTHVolumeSitesOS <- coxph(Surv(dataMSK$OS, dataMSK$status)~
                                       Sites+Volume+cSE+cSCV+cSCP, data=dataMSK)
summary(mod.mskccISTHVolumeSitesOS)

## TCIA
#PFS
mod.tcgaISTHVolumeSitesPFS <- coxph(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~
                                       Sites+Volume+cSE+cSCV+cSCP, data=dataTCGA)
summary(mod.tcgaISTHVolumeSitesPFS)

#OS
mod.tcgaISTHVolumeSitesOS <- coxph(Surv(dataTCGA$OS, dataTCGA$status)~
                                      Sites+Volume+cSE+cSCV+cSCP, data=dataTCGA)
summary(mod.tcgaISTHVolumeSitesOS)

## Multi-variate cox regression only using ISTH measures
##MSKCC 
#PFS
mod.mskccISTHPFS <- coxph(Surv(dataMSK$PFS, dataMSK$Recurrence)~
                                       cSE+cSCP, data=dataMSK)
summary(mod.mskccISTHPFS)

#OS
mod.mskccISTHOS <- coxph(Surv(dataMSK$OS, dataMSK$status)~
                                      cSE+cSCP, data=dataMSK)
summary(mod.mskccISTHOS)

## TCIA
#PFS
mod.tcgaISTHPFS <- coxph(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~
                                      cSE+cSCP, data=dataTCGA)
summary(mod.tcgaISTHPFS)

#OS
mod.tcgaISTHOS <- coxph(Surv(dataTCGA$OS, dataTCGA$status)~
                                     cSE+cSCP, data=dataTCGA)
summary(mod.tcgaISTHOS)


## Cox using only the Haralick textures and Volume + Sites
##MSKCC 
#PFS
mod.mskccHaralickPFS <- coxph(Surv(dataMSK$PFS, dataMSK$Recurrence)~
                                Volume+Sites+Energy+Entropy+Homogeneity+Contrast, data=dataMSK)
summary(mod.mskccHaralickPFS)

#OS
mod.mskccHaralickOS <- coxph(Surv(dataMSK$OS, dataMSK$status)~
                               Volume+Sites+Energy+Entropy+Homogeneity+Contrast, data=dataMSK)
summary(mod.mskccHaralickOS)

## TCIA
#PFS
mod.tcgaHaralickPFS <- coxph(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~
                               Volume+Sites+Energy+Entropy+Homogeneity+Contrast, data=dataTCGA)
summary(mod.tcgaHaralickPFS)

#OS
mod.tcgaHaralickOS <- coxph(Surv(dataTCGA$OS, dataTCGA$status)~
                              Volume+Sites+Energy+Entropy+Homogeneity+Contrast, data=dataTCGA)
summary(mod.tcgaHaralickOS)




## Cox using only the Haralick textures
##MSKCC 
#PFS
mod.mskccHaralickPFS <- coxph(Surv(dataMSK$PFS, dataMSK$Recurrence)~
                            Energy+Entropy+Homogeneity+Contrast, data=dataMSK)
summary(mod.mskccHaralickPFS)

#OS
mod.mskccHaralickOS <- coxph(Surv(dataMSK$OS, dataMSK$status)~
                           Energy+Entropy+Homogeneity+Contrast, data=dataMSK)
summary(mod.mskccHaralickOS)

## TCIA
#PFS
mod.tcgaHaralickPFS <- coxph(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~
                           Energy+Entropy+Homogeneity+Contrast, data=dataTCGA)
summary(mod.tcgaHaralickPFS)

#OS
mod.tcgaHaralickOS <- coxph(Surv(dataTCGA$OS, dataTCGA$status)~
                          Energy+Entropy+Homogeneity+Contrast, data=dataTCGA)
summary(mod.tcgaHaralickOS)



########## Survival curves using Sites
par(mfrow=c(2,2), mar=c(4,5,3,1))

sediff <- dataMSK$Sites > median(dataMSK$Sites)
survdiff(Surv(dataMSK$PFS, dataMSK$Recurrence)~sediff)
sLo <- dataMSK$Sites <= median(dataMSK$Sites)
sHi <- dataMSK$Sites > median(dataMSK$Sites)

monthsLo <- dataMSK$PFS[sLo]
monthsHi <- dataMSK$PFS[sHi]
mfitLo <- survfit(Surv(monthsLo, dataMSK$Recurrence[sLo])~1)
mfitHi <- survfit(Surv(monthsHi, dataMSK$Recurrence[sHi])~1)
plot(mfitLo, conf.int=FALSE, mark.time = TRUE, mark= 3, col='royalblue3', xaxs="S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitHi, conf.int=FALSE, mark.time = TRUE, mark = 3, col='orangered', xaxs="S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, lty=1)

legend(x="topright", inset=0.1, c("Num Sites <= 7", "Num Sites > 7"), 
       col=c('royalblue3', 'orangered'), 
       cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")
title('(a) MSKCC: Number of Tumor Sites vs. PFS')
y <-c("p=0.036")
lab <-toString(y);
text(10, 0.15, label=lab, font=2)


survdiff(Surv(dataMSK$OS, dataMSK$status)~sediff)

monthsLo <- dataMSK$OS[sLo]
monthsHi <- dataMSK$OS[sHi]
mfitLo <- survfit(Surv(monthsLo, dataMSK$status[sLo])~1)
mfitHi <- survfit(Surv(monthsHi, dataMSK$status[sHi])~1)

plot(mfitLo, conf.int=FALSE, mark.time = TRUE, mark= 3, col='royalblue3', xaxs="S", xlab='Time(months)', ylab="Proportion OS", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitHi, conf.int=FALSE, mark.time = TRUE, mark = 3, col='orangered', xaxs="S", xlab='Time(months)', ylab="Proportion OS", lwd=3, lty=1)

legend(x="topright", inset=0.1, c("Num Sites <= 7", "Num Sites > 7"), 
       col=c('royalblue3', 'orangered'), 
       cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")
title('(b) MSKCC: Number of Tumor Sites vs. OS')
y <-c("p=0.031")
lab <-toString(y);
text(10, 0.15, label=lab, font=2)



sediff <- dataTCGA$Sites > median(dataTCGA$Sites)
survdiff(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~sediff)

sLo <- dataTCGA$Sites <= median(dataTCGA$Sites)
sHi <- dataTCGA$Sites > median(dataTCGA$Sites)
montshLo <- dataTCGA$PFS[sLo]
monthsHi <- dataTCGA$PFS[sHi]
mfitLo <- survfit(Surv(monthsLo, dataTCGA$Recurrence[sLo])~1)
mfitHi <- survfit(Surv(monthsHi, dataTCGA$Recurrence[sHi])~1)
plot(mfitLo, conf.int=FALSE, mark.time = TRUE, mark= 3, col='royalblue3', xaxs="S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitHi, conf.int=FALSE, mark.time = TRUE, mark = 3, col='orangered', xaxs="S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, lty=1)

legend(x="topright", inset=0.1, c("Num Sites <= 4", "Num Sites > 4"), 
       col=c('royalblue3', 'orangered'), 
       cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")
title('(c) TCIA: Number of Tumor Sites vs. PFS')
y <-c("p=0.039")
lab <-toString(y);
text(10, 0.15, label=lab, font=2)

survdiff(Surv(dataTCGA$OS, dataTCGA$status)~sediff)


sLo <- dataTCGA$Sites <= median(dataTCGA$Sites)
sHi <- dataTCGA$Sites > median(dataTCGA$Sites)
montshLo <- dataTCGA$OS[sLo]
monthsHi <- dataTCGA$OS[sHi]
mfitLo <- survfit(Surv(monthsLo, dataTCGA$status[sLo])~1)
mfitHi <- survfit(Surv(monthsHi, dataTCGA$status[sHi])~1)
plot(mfitLo, conf.int=FALSE, mark.time = TRUE, mark= 3, col='royalblue3', xaxs="S", xlab='Time(months)', ylab="Proportion OS", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitHi, conf.int=FALSE, mark.time = TRUE, mark = 3, col='orangered', xaxs="S", xlab='Time(months)', ylab="Proportion OS", lwd=3, lty=1)

legend(x="topright", inset=0.1, c("Num Sites <= 4", "Num Sites > 4"), 
       col=c('royalblue3', 'orangered'), 
       cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")
title('(d) TCIA: Number of Tumor Sites vs. OS')
y <-c("p=0.66")
lab <-toString(y);
text(10, 0.15, label=lab, font=2)

####################################################################
########## Clinical measures significance tests
dataOnlyPlatinum <- dataMSK[dataMSK$Platinum>0,]
sediff<-dataOnlyPlatinum$Platinum==1
survdiff(Surv(dataOnlyPlatinum$PFS, dataOnlyPlatinum$Recurrence)~sediff)
survdiff(Surv(dataOnlyPlatinum$OS, dataOnlyPlatinum$status)~sediff)


dataOnlyPlatinum <- dataTCGA[dataTCGA$Platinum>0,]
sediff<-dataOnlyPlatinum$Platinum==1
survdiff(Surv(dataOnlyPlatinum$PFS, dataOnlyPlatinum$Recurrence)~sediff)
survdiff(Surv(dataOnlyPlatinum$OS, dataOnlyPlatinum$status)~sediff)

### resection
sediff <- dataMSK$TCGA.CSE==0
survdiff(Surv(dataMSK$PFS, dataMSK$Recurrence)~sediff)
survdiff(Surv(dataMSK$OS, dataMSK$status)~sediff)

sediff <- dataMSK$TCGA.CSE==3
survdiff(Surv(dataMSK$PFS, dataMSK$Recurrence)~sediff)
survdiff(Surv(dataMSK$OS, dataMSK$status)~sediff)

dataOnlyRes <- dataTCGA[dataTCGA$CSE > -1,]
sediff<- dataOnlyRes$CSE == 0
survdiff(Surv(dataOnlyRes$PFS, dataOnlyRes$Recurrence)~sediff)
survdiff(Surv(dataOnlyRes$OS, dataOnlyRes$status)~sediff)

sediff<- dataOnlyRes$CSE==3
survdiff(Surv(dataOnlyRes$PFS, dataOnlyRes$Recurrence)~sediff)
survdiff(Surv(dataOnlyRes$OS, dataOnlyRes$status)~sediff)


sediff<-dataMSK$Volume > median(dataMSK$Volume)
survdiff(Surv(dataMSK$PFS, dataMSK$Recurrence)~sediff)
survdiff(Surv(dataMSK$OS, dataMSK$status)~sediff)

sediff<-dataTCGA$Volume > median(dataTCGA$Volume)
survdiff(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~sediff)
survdiff(Surv(dataTCGA$OS, dataTCGA$status)~sediff)



## Additional 
############# Survival analysis by tumor volume ################


par(mfrow=c(2,2), mar=c(4,5,3,1))

sediff <- dataMSK$Volume > median(dataMSK$Volume)
survdiff(Surv(dataMSK$PFS, dataMSK$Recurrence)~sediff)
sLo <- dataMSK$Volume <= median(dataMSK$Volume)
sHi <- dataMSK$Volume > median(dataMSK$Volume)

monthsLo <- dataMSK$PFS[sLo]
monthsHi <- dataMSK$PFS[sHi]
mfitLo <- survfit(Surv(monthsLo, dataMSK$Recurrence[sLo])~1)
mfitHi <- survfit(Surv(monthsHi, dataMSK$Recurrence[sHi])~1)
plot(mfitLo, conf.int=FALSE, mark.time = TRUE, mark= 3, col='royalblue3', xaxs="S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitHi, conf.int=FALSE, mark.time = TRUE, mark = 3, col='orangered', xaxs="S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, lty=1)

legend(x="topright", .6, c("Tumor Volume <= 122cc", "Tumor Volume > 122cc"), 
       col=c('royalblue3', 'orangered'), 
       cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")
title('Tumor Volume vs. PFS')
y <-c("p=0.945")
lab <-toString(y);
text(10, 0.15, label=lab)


survdiff(Surv(dataMSK$OS, dataMSK$status)~sediff)

monthsLo <- dataMSK$OS[sLo]
monthsHi <- dataMSK$OS[sHi]
mfitLo <- survfit(Surv(monthsLo, dataMSK$status[sLo])~1)
mfitHi <- survfit(Surv(monthsHi, dataMSK$status[sHi])~1)

plot(mfitLo, conf.int=FALSE, mark.time = TRUE, mark= 3, col='royalblue3', xaxs="S", xlab='Time(months)', ylab="Proportion OS", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitHi, conf.int=FALSE, mark.time = TRUE, mark = 3, col='orangered', xaxs="S", xlab='Time(months)', ylab="Proportion OS", lwd=3, lty=1)

legend(x="topright", .6, c("Tumor Volume <= 122cc", "Tumor Volume > 122cc"), 
       col=c('royalblue3', 'orangered'), 
       cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")
title('Tumor Volume vs. OS')
y <-c("p=0.078")
lab <-toString(y);
text(10, 0.15, label=lab)



sediff <- dataTCGA$Volume > median(dataTCGA$Volume)
survdiff(Surv(dataTCGA$PFS, dataTCGA$Recurrence)~sediff)

sLo <- dataTCGA$Volume <= median(dataTCGA$Volume)
sHi <- dataTCGA$Volume > median(dataTCGA$Volume)
montshLo <- dataTCGA$PFS[sLo]
monthsHi <- dataTCGA$PFS[sHi]
mfitLo <- survfit(Surv(monthsLo, dataTCGA$Recurrence[sLo])~1)
mfitHi <- survfit(Surv(monthsHi, dataTCGA$Recurrence[sHi])~1)
plot(mfitLo, conf.int=FALSE, mark.time = TRUE, mark= 3, col='royalblue3', xaxs="S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitHi, conf.int=FALSE, mark.time = TRUE, mark = 3, col='orangered', xaxs="S", xlab='Time(months)', ylab="Proportion PFS", lwd=3, lty=1)

legend(x="topright", .6, c("Tumor Volume <= 327.8cc", "Num Sites > 327.8cc"), 
       col=c('royalblue3', 'orangered'), 
       cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")
title('Tumor Volume vs. PFS')
y <-c("p=0.81")
lab <-toString(y);
text(10, 0.15, label=lab)

survdiff(Surv(dataTCGA$OS, dataTCGA$status)~sediff)

montshLo <- dataTCGA$OS[sLo]
monthsHi <- dataTCGA$OS[sHi]
mfitLo <- survfit(Surv(monthsLo, dataTCGA$status[sLo])~1)
mfitHi <- survfit(Surv(monthsHi, dataTCGA$status[sHi])~1)
plot(mfitLo, conf.int=FALSE, mark.time = TRUE, mark= 3, col='royalblue3', xaxs="S", xlab='Time(months)', ylab="Proportion OS", lwd=3, cex.axis=1.25, cex.lab=1.5, font=2.0)
lines(mfitHi, conf.int=FALSE, mark.time = TRUE, mark = 3, col='orangered', xaxs="S", xlab='Time(months)', ylab="Proportion OS", lwd=3, lty=1)

legend(x="topright", .6, c("Tumor Volume <= 327.8cc", "Tumor Volume > 327.8cc"), 
       col=c('royalblue3', 'orangered'), 
       cex=1.5, y.intersp=1.0, lty=1:2, lwd=2, bty="n")
title('Tumor Volume vs. OS')
y <-c("p=0.53")
lab <-toString(y);
text(10, 0.15, label=lab)

################
