# Veeraraghavan etal 2017
Harini Veeraraghavan and James D. Brenton  
June 16 2017  







Load in clinical data.


```
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   sites = col_integer(),
##   c.se = col_double(),
##   clu.dev = col_double(),
##   clu.diss = col_double(),
##   energy = col_double(),
##   contrast = col_double(),
##   homogeneity = col_double(),
##   entropy = col_double(),
##   os.mos = col_double(),
##   pfs.mos = col_double(),
##   recurrence = col_integer(),
##   age = col_integer(),
##   dead = col_integer(),
##   stage = col_integer(),
##   resection.1.unknown.0.complete.2.1cm.3.1cm = col_integer(),
##   volume.cc = col_double(),
##   platinum.resistant = col_logical(),
##   residual.disease = col_integer(),
##   Follow.up.mos = col_double()
## )
```

```
## See spec(...) for full column specifications.
```

## Simple data exploration

Total number of patients


```
## # A tibble: 1 × 1
##       n
##   <int>
## 1    84
```


####Were there differences in the number of sites (ROI) between the cohorts?


```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <int> <dbl>   <dbl> <dbl> <int>
## 1           MSKCC     2   5.2       7     9    12
## 2            TCIA     2   3.0       4     4     7
```

Plot the ROI counts.


```
## notch went outside hinges. Try setting notch=FALSE.
```

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

```
## 
## 	Wilcoxon rank sum test with continuity correction
## 
## data:  clin.data$sites[clin.data$institution.bin == "MSKCC"] and clin.data$sites[clin.data$institution.bin != "MSKCC"]
## W = 1000, p-value = 1e-07
## alternative hypothesis: true location shift is not equal to 0
```


####Differences in OS in the two cohorts? (TCIA and MSKCC)


```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC   3.0    45      59    77   124
## 2            TCIA   0.3    16      31    50   120
```



```
## Source: local data frame [2 x 10]
## Groups: institution.bin [2]
## 
##   institution.bin records n.max n.start events rmean rmean.std.error
##             <chr>   <dbl> <dbl>   <dbl>  <dbl> <dbl>           <dbl>
## 1           MSKCC      46    46      46     28    74             6.3
## 2            TCIA      38    38      38     22    51             6.9
## # ... with 3 more variables: median <dbl>, conf.low <dbl>, conf.high <dbl>
```

#####Plot comparison of OS.

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-8-1.png)<!-- -->


####Differences in PFS in the two cohorts? (TCIA and MSKCC)


```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC   0.0  10.6      16    27    49
## 2            TCIA   0.3   7.8      17    25    75
```


```
## Source: local data frame [2 x 10]
## Groups: institution.bin [2]
## 
##   institution.bin records n.max n.start events rmean rmean.std.error
##             <chr>   <dbl> <dbl>   <dbl>  <dbl> <dbl>           <dbl>
## 1           MSKCC      46    46      46     44    20             1.7
## 2            TCIA      38    38      38     19    37             5.5
## # ... with 3 more variables: median <dbl>, conf.low <dbl>, conf.high <dbl>
```

#####Plot comparison of OS.

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-11-1.png)<!-- -->


####Differences in follow ups


```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC   2.4    24      41    55   108
## 2            TCIA   0.3     7      21    39    71
```

#####Plot comparison of follow ups
![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-13-1.png)<!-- -->

```
## 
## 	Wilcoxon rank sum test with continuity correction
## 
## data:  clin.data$sites[clin.data$institution.bin == "MSKCC"] and clin.data$sites[clin.data$institution.bin != "MSKCC"]
## W = 1000, p-value = 1e-07
## alternative hypothesis: true location shift is not equal to 0
```

#### Differences in total tumor volume between the datasets

```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC   7.4    65     122   232   744
## 2            TCIA   5.2   153     328   601  2585
```

Plot the volume distributions.

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-15-1.png)<!-- -->

Non-parametric test for volume distributions.


```
##   statistic p.value                 method alternative
## 1       514   0.001 Wilcoxon rank sum test   two.sided
```

***


####Differences in the computed texture measures between the datasets
#####Energy


```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC    94   163     186   222   254
## 2            TCIA   101   133     156   186   244
```

Plot the energy distribution

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-18-1.png)<!-- -->

Non-parametric test for energy distributions.


```
## Warning in wilcox.test.default(x = c(157.2, 214.4, 200.1, 193.4, 139.6, :
## cannot compute exact p-value with ties
```

```
##   statistic p.value                                            method
## 1      1260 0.00054 Wilcoxon rank sum test with continuity correction
##   alternative
## 1   two.sided
```

#####Entropy


```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC   1.4    30      47    63   166
## 2            TCIA  17.3    39      63    78    95
```

Plot the energy distribution

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-21-1.png)<!-- -->

Non-parametric test for entropy distributions.


```
## Warning in wilcox.test.default(x = c(75.9, 26.4, 34.2, 52.2, 67.4, 61.1, :
## cannot compute exact p-value with ties
```

```
##   statistic p.value                                            method
## 1       628   0.027 Wilcoxon rank sum test with continuity correction
##   alternative
## 1   two.sided
```


#####Contrast


```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC   0.5   2.8     9.4  30.2   131
## 2            TCIA   0.6   1.3     2.0   3.5    94
```

Plot the contrast distribution

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-24-1.png)<!-- -->

Non-parametric test for contrast distributions.


```
## Warning in wilcox.test.default(x = c(13.7, 8.5, 1.6, 15.1, 2.8, 4.1, 0.5, :
## cannot compute exact p-value with ties
```

```
##   statistic  p.value                                            method
## 1      1330 0.000042 Wilcoxon rank sum test with continuity correction
##   alternative
## 1   two.sided
```

#####Homogeneity


```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC   0.9   8.8      20    29   109
## 2            TCIA   2.0   7.4      11    16    73
```

Plot the homogeneity distribution

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-27-1.png)<!-- -->

Non-parametric test for homogeneity distributions.


```
## Warning in wilcox.test.default(x = c(60.9, 17.5, 7.5, 34.5, 10.4, 25.7, :
## cannot compute exact p-value with ties
```

```
##   statistic p.value                                            method
## 1      1087   0.056 Wilcoxon rank sum test with continuity correction
##   alternative
## 1   two.sided
```

#####cSE


```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC   1.5   3.4     4.0   4.4   5.2
## 2            TCIA   2.0   2.8     3.2   3.9   4.4
```

Plot the cSE distribution

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-30-1.png)<!-- -->

Non-parametric test for cSE distributions.


```
## Warning in wilcox.test.default(x = c(4.5, 3.7, 5, 3, 2.7, 5, 4, 2.2, 4.4, :
## cannot compute exact p-value with ties
```

```
##   statistic p.value                                            method
## 1      1278 0.00028 Wilcoxon rank sum test with continuity correction
##   alternative
## 1   two.sided
```

#####cluDev


```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC   0.5   2.0     4.2   7.0  21.3
## 2            TCIA   0.2   0.8     1.5   2.8   4.5
```

Plot the cluDev distribution

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-33-1.png)<!-- -->

Non-parametric test for cluDev distributions.


```
## Warning in wilcox.test.default(x = c(5.8, 2.2, 10.2, 0.6, 1.3, 11, 3.7, :
## cannot compute exact p-value with ties
```

```
##   statistic  p.value                                            method
## 1      1362 0.000012 Wilcoxon rank sum test with continuity correction
##   alternative
## 1   two.sided
```

#####cluDiss


```
## # A tibble: 2 × 6
##   institution.bin  min_   Q1_ median_   Q3_  max_
##             <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC   374  3582    6529  9700 30901
## 2            TCIA   378  1128    2896  4835 13150
```


Plot the cluDiss distribution

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-36-1.png)<!-- -->

Non-parametric test for cluDiss distributions.


```
##   statistic  p.value                 method alternative
## 1      1311 0.000058 Wilcoxon rank sum test   two.sided
```

***
##### Spearman rank correlation between texture measures and tumour burden

cSE vs. tumour volume


```
##   estimate p.value
## 1    0.016    0.88
```

cluDiss vs. tumour volume


```
##   estimate p.value
## 1    0.037    0.73
```

cluDev vs. tumour volume


```
##   estimate p.value
## 1    0.012    0.91
```

Energy vs. tumour volume


```
##   estimate p.value
## 1   -0.039    0.73
```

Entropy vs. tumour volume


```
##   estimate p.value
## 1    -0.16    0.15
```

Contrast vs. tumour volume


```
##   estimate  p.value
## 1    -0.42 0.000081
```

Homogeneity vs. tumour volume


```
##   estimate  p.value
## 1    -0.41 0.000097
```

Correlation with number of sites 

cSE vs. sites


```
##   estimate p.value
## 1     0.85 4.1e-24
```

cluDiss vs. sites


```
##   estimate p.value
## 1     0.87   2e-26
```

cluDev vs. sites


```
##   estimate p.value
## 1     0.89 1.7e-29
```

Energy vs. sites


```
##   estimate  p.value
## 1     0.43 0.000041
```
Entropy vs. sites


```
##   estimate  p.value
## 1    -0.44 0.000033
```

Contrast vs. sites


```
##   estimate p.value
## 1     0.19   0.077
```

Homogeneity vs. sites


```
##   estimate p.value
## 1    -0.11     0.3
```

*** 



### Resection and association to outomces
  
#### Cox regression to determine if resection was associated with survival in the two datasets
  
**Adjusted**

Check if resection was associated with PFS


```
## Source: local data frame [10 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.05  0.0051     1.02
## 2            MSKCC as.factor(residual.disease)3     3.19  0.0405     1.05
## 3            MSKCC as.factor(residual.disease)2     1.42  0.3876     0.64
## 4            MSKCC            as.factor(stage)4     1.18  0.6627     0.56
## 5            MSKCC                    volume.cc     1.00  0.9642     1.00
## 6             TCIA                    volume.cc     1.00  0.2333     1.00
## 7             TCIA            as.factor(stage)4     1.56  0.5126     0.41
## 8             TCIA                          age     1.01  0.6299     0.97
## 9             TCIA as.factor(residual.disease)2     1.04  0.9471     0.34
## 10            TCIA as.factor(residual.disease)3     0.96  0.9554     0.22
## # ... with 1 more variables: conf.high <dbl>
```

Check if resection was associated with OS


```
## Source: local data frame [10 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1   0.021     1.01
## 2            MSKCC as.factor(residual.disease)3      3.9   0.029     1.15
## 3            MSKCC                    volume.cc      1.0   0.195     1.00
## 4            MSKCC            as.factor(stage)4      1.6   0.369     0.59
## 5            MSKCC as.factor(residual.disease)2      1.4   0.502     0.52
## 6             TCIA as.factor(residual.disease)2      5.1   0.038     1.10
## 7             TCIA as.factor(residual.disease)3      5.7   0.039     1.09
## 8             TCIA                          age      1.0   0.137     0.99
## 9             TCIA                    volume.cc      1.0   0.226     1.00
## 10            TCIA            as.factor(stage)4      1.9   0.292     0.57
## # ... with 1 more variables: conf.high <dbl>
```

** Unadjusted**
  
  Check if resection was associated with PFS


```
## Source: local data frame [4 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin                         term estimate p.value conf.low
##             <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1           MSKCC as.factor(residual.disease)3     3.70  0.0067     1.44
## 2           MSKCC as.factor(residual.disease)2     1.71  0.1348     0.85
## 3            TCIA as.factor(residual.disease)3     0.95  0.9456     0.25
## 4            TCIA as.factor(residual.disease)2     0.98  0.9726     0.33
## # ... with 1 more variables: conf.high <dbl>
```

Check if resection was associated with OS


```
## Source: local data frame [4 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin                         term estimate p.value conf.low
##             <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1           MSKCC as.factor(residual.disease)3      6.0  0.0014     1.99
## 2           MSKCC as.factor(residual.disease)2      1.8  0.2609     0.66
## 3            TCIA as.factor(residual.disease)3      7.2  0.0182     1.40
## 4            TCIA as.factor(residual.disease)2      4.6  0.0462     1.03
## # ... with 1 more variables: conf.high <dbl>
```

###Stage and association to outcomes



#### Cox regression to determine if stage was associated with survival in the two datasets

**Adjusted**
  Check ifstage was associated with PFS


```
## Source: local data frame [10 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.05  0.0051     1.02
## 2            MSKCC as.factor(residual.disease)3     3.19  0.0405     1.05
## 3            MSKCC as.factor(residual.disease)2     1.42  0.3876     0.64
## 4            MSKCC            as.factor(stage)4     1.18  0.6627     0.56
## 5            MSKCC                    volume.cc     1.00  0.9642     1.00
## 6             TCIA                    volume.cc     1.00  0.2333     1.00
## 7             TCIA            as.factor(stage)4     1.56  0.5126     0.41
## 8             TCIA                          age     1.01  0.6299     0.97
## 9             TCIA as.factor(residual.disease)2     1.04  0.9471     0.34
## 10            TCIA as.factor(residual.disease)3     0.96  0.9554     0.22
## # ... with 1 more variables: conf.high <dbl>
```

Check if stage was associated with OS


```
## Source: local data frame [10 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1   0.021     1.01
## 2            MSKCC as.factor(residual.disease)3      3.9   0.029     1.15
## 3            MSKCC                    volume.cc      1.0   0.195     1.00
## 4            MSKCC            as.factor(stage)4      1.6   0.369     0.59
## 5            MSKCC as.factor(residual.disease)2      1.4   0.502     0.52
## 6             TCIA as.factor(residual.disease)2      5.1   0.038     1.10
## 7             TCIA as.factor(residual.disease)3      5.7   0.039     1.09
## 8             TCIA                          age      1.0   0.137     0.99
## 9             TCIA                    volume.cc      1.0   0.226     1.00
## 10            TCIA            as.factor(stage)4      1.9   0.292     0.57
## # ... with 1 more variables: conf.high <dbl>
```

** Unadjusted**
  
  Check if stage was associated with PFS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin              term estimate p.value conf.low conf.high
##             <chr>             <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC as.factor(stage)4      1.1    0.73     0.59       2.1
## 2            TCIA as.factor(stage)4      1.4    0.58     0.41       4.9
```

Was stage associated with OS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin              term estimate p.value conf.low conf.high
##             <chr>             <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC as.factor(stage)4      1.2   0.731     0.52       2.6
## 2            TCIA as.factor(stage)4      3.0   0.066     0.93       9.6
```



##Volume and association to outcomes

##### Cox regression to determine if volume was associated with survival in the two datasets

** Adjusted**
  
  Check if volume was associated with PFS Adjusted


```
## Source: local data frame [10 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.05  0.0051     1.02
## 2            MSKCC as.factor(residual.disease)3     3.19  0.0405     1.05
## 3            MSKCC as.factor(residual.disease)2     1.42  0.3876     0.64
## 4            MSKCC            as.factor(stage)4     1.18  0.6627     0.56
## 5            MSKCC                    volume.cc     1.00  0.9642     1.00
## 6             TCIA                    volume.cc     1.00  0.2333     1.00
## 7             TCIA            as.factor(stage)4     1.56  0.5126     0.41
## 8             TCIA                          age     1.01  0.6299     0.97
## 9             TCIA as.factor(residual.disease)2     1.04  0.9471     0.34
## 10            TCIA as.factor(residual.disease)3     0.96  0.9554     0.22
## # ... with 1 more variables: conf.high <dbl>
```

Check if volume was associated with OS Adjusted


```
## Source: local data frame [10 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1   0.021     1.01
## 2            MSKCC as.factor(residual.disease)3      3.9   0.029     1.15
## 3            MSKCC                    volume.cc      1.0   0.195     1.00
## 4            MSKCC            as.factor(stage)4      1.6   0.369     0.59
## 5            MSKCC as.factor(residual.disease)2      1.4   0.502     0.52
## 6             TCIA as.factor(residual.disease)2      5.1   0.038     1.10
## 7             TCIA as.factor(residual.disease)3      5.7   0.039     1.09
## 8             TCIA                          age      1.0   0.137     0.99
## 9             TCIA                    volume.cc      1.0   0.226     1.00
## 10            TCIA            as.factor(stage)4      1.9   0.292     0.57
## # ... with 1 more variables: conf.high <dbl>
```

**Unadjusted cox for volume**
  
  PFS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin      term estimate p.value conf.low conf.high
##             <chr>     <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC volume.cc        1    0.53        1         1
## 2            TCIA volume.cc        1    0.32        1         1
```

OS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin      term estimate p.value conf.low conf.high
##             <chr>     <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC volume.cc        1    0.04        1         1
## 2            TCIA volume.cc        1    0.25        1         1
```


##### Cox regression to determine if sites was associated with survival in the two datasets

** Adjusted**
  
  Check if sites was associated with PFS Adjusted


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.05  0.0103     1.01
## 2            MSKCC as.factor(residual.disease)3     2.97  0.0968     0.82
## 3            MSKCC as.factor(residual.disease)2     1.33  0.5750     0.49
## 4            MSKCC            as.factor(stage)4     1.15  0.7147     0.53
## 5            MSKCC                        sites     1.02  0.8303     0.86
## 6            MSKCC                    volume.cc     1.00  0.9680     1.00
## 7             TCIA                        sites     1.95  0.0034     1.25
## 8             TCIA                          age     1.05  0.0695     1.00
## 9             TCIA                    volume.cc     1.00  0.2688     1.00
## 10            TCIA            as.factor(stage)4     2.04  0.3055     0.52
## 11            TCIA as.factor(residual.disease)2     0.75  0.6326     0.24
## 12            TCIA as.factor(residual.disease)3     0.86  0.8347     0.21
## # ... with 1 more variables: conf.high <dbl>
```

Check if volume was associated with OS Adjusted


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.0   0.055     1.00
## 2            MSKCC as.factor(residual.disease)3      3.2   0.080     0.87
## 3            MSKCC                    volume.cc      1.0   0.297     1.00
## 4            MSKCC                        sites      1.1   0.421     0.90
## 5            MSKCC            as.factor(stage)4      1.4   0.488     0.53
## 6            MSKCC as.factor(residual.disease)2      1.1   0.891     0.34
## 7             TCIA as.factor(residual.disease)2      5.1   0.038     1.10
## 8             TCIA as.factor(residual.disease)3      5.7   0.040     1.08
## 9             TCIA                          age      1.0   0.201     0.98
## 10            TCIA                    volume.cc      1.0   0.242     1.00
## 11            TCIA            as.factor(stage)4      1.9   0.302     0.56
## 12            TCIA                        sites      1.0   0.981     0.67
## # ... with 1 more variables: conf.high <dbl>
```

**Unadjusted cox for sites**
  
  PFS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin  term estimate p.value conf.low conf.high
##             <chr> <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC sites      1.1   0.028      1.0       1.3
## 2            TCIA sites      1.6   0.012      1.1       2.4
```

OS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin  term estimate p.value conf.low conf.high
##             <chr> <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC sites     1.18   0.017     1.03       1.3
## 2            TCIA sites     0.92   0.607     0.69       1.2
```



#### Was age associated to survival?

**Adjusted**
  
  Check if volume was associated with PFS Adjusted


```
## Source: local data frame [10 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.05  0.0051     1.02
## 2            MSKCC as.factor(residual.disease)3     3.19  0.0405     1.05
## 3            MSKCC as.factor(residual.disease)2     1.42  0.3876     0.64
## 4            MSKCC            as.factor(stage)4     1.18  0.6627     0.56
## 5            MSKCC                    volume.cc     1.00  0.9642     1.00
## 6             TCIA                    volume.cc     1.00  0.2333     1.00
## 7             TCIA            as.factor(stage)4     1.56  0.5126     0.41
## 8             TCIA                          age     1.01  0.6299     0.97
## 9             TCIA as.factor(residual.disease)2     1.04  0.9471     0.34
## 10            TCIA as.factor(residual.disease)3     0.96  0.9554     0.22
## # ... with 1 more variables: conf.high <dbl>
```

Check if volume was associated with OS Adjusted


```
## Source: local data frame [10 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1   0.021     1.01
## 2            MSKCC as.factor(residual.disease)3      3.9   0.029     1.15
## 3            MSKCC                    volume.cc      1.0   0.195     1.00
## 4            MSKCC            as.factor(stage)4      1.6   0.369     0.59
## 5            MSKCC as.factor(residual.disease)2      1.4   0.502     0.52
## 6             TCIA as.factor(residual.disease)2      5.1   0.038     1.10
## 7             TCIA as.factor(residual.disease)3      5.7   0.039     1.09
## 8             TCIA                          age      1.0   0.137     0.99
## 9             TCIA                    volume.cc      1.0   0.226     1.00
## 10            TCIA            as.factor(stage)4      1.9   0.292     0.57
## # ... with 1 more variables: conf.high <dbl>
```

**Unadjusted cox for age**
  
  PFS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin  term estimate p.value conf.low conf.high
##             <chr> <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC   age      1.1  0.0028     1.02       1.1
## 2            TCIA   age      1.0  0.7964     0.97       1.0
```

OS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin  term estimate p.value conf.low conf.high
##             <chr> <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC   age        1   0.024     1.01       1.1
## 2            TCIA   age        1   0.156     0.99       1.1
```

  

##### Non-parametric two-sided analysis for volume vs. platinum status


```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC        82   0.027
## 2            TCIA        54   0.757
```

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-73-1.png)<!-- -->![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-73-2.png)<!-- -->

Sites vs. Platinum


```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC        98   0.084
## 2            TCIA        48   0.449
```

cSE/Sites vs. Platinum


```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC       236   0.024
## 2            TCIA        70   0.504
```

![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-75-1.png)<!-- -->![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-75-2.png)<!-- -->


cluDev/Sites vs. Platinum


```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC       132    0.48
## 2            TCIA        51    0.61
```


cluDiss/Sites vs. platinum


```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC       136    0.55
## 2            TCIA        58    0.95
```


***


##ISTH measures and association to outcomes

 ##ISTH measures and association to outcomes
  
  ####Cox hazard regression for continuous ISTH measures with PFS in the two datasets
  
  **Adjusted**
  
  Check if cSE was associated with PFS Adjusted


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.05  0.0055     1.02
## 2            MSKCC                         c.se     1.55  0.0849     0.94
## 3            MSKCC as.factor(residual.disease)3     2.17  0.2149     0.64
## 4            MSKCC                    volume.cc     1.00  0.5707     1.00
## 5            MSKCC            as.factor(stage)4     1.10  0.8121     0.51
## 6            MSKCC as.factor(residual.disease)2     0.97  0.9524     0.41
## 7             TCIA                         c.se     3.35  0.0032     1.50
## 8             TCIA                    volume.cc     1.00  0.0485     1.00
## 9             TCIA                          age     1.03  0.2281     0.98
## 10            TCIA            as.factor(stage)4     1.61  0.4875     0.42
## 11            TCIA as.factor(residual.disease)3     0.92  0.9059     0.22
## 12            TCIA as.factor(residual.disease)2     1.01  0.9802     0.33
## # ... with 1 more variables: conf.high <dbl>
```

Check if cSE was associated with OS Adjusted


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1   0.027     1.01
## 2            MSKCC as.factor(residual.disease)3      3.6   0.043     1.04
## 3            MSKCC                    volume.cc      1.0   0.229     1.00
## 4            MSKCC            as.factor(stage)4      1.5   0.450     0.54
## 5            MSKCC                         c.se      1.3   0.458     0.68
## 6            MSKCC as.factor(residual.disease)2      1.2   0.708     0.43
## 7             TCIA as.factor(residual.disease)2      5.5   0.033     1.14
## 8             TCIA as.factor(residual.disease)3      5.9   0.036     1.12
## 9             TCIA                          age      1.0   0.119     0.99
## 10            TCIA                    volume.cc      1.0   0.217     1.00
## 11            TCIA            as.factor(stage)4      2.0   0.270     0.59
## 12            TCIA                         c.se      1.2   0.602     0.60
## # ... with 1 more variables: conf.high <dbl>
```

Check if cluDev was associated with PFS 


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1  0.0044     1.02
## 2            MSKCC as.factor(residual.disease)3      2.7  0.0969     0.83
## 3            MSKCC                      clu.dev      1.0  0.3931     0.96
## 4            MSKCC as.factor(residual.disease)2      1.2  0.6555     0.51
## 5            MSKCC            as.factor(stage)4      1.2  0.6858     0.55
## 6            MSKCC                    volume.cc      1.0  0.8876     1.00
## 7             TCIA                      clu.dev      1.7  0.0105     1.13
## 8             TCIA                    volume.cc      1.0  0.1732     1.00
## 9             TCIA                          age      1.0  0.2701     0.98
## 10            TCIA            as.factor(stage)4      2.0  0.3276     0.50
## 11            TCIA as.factor(residual.disease)3      1.3  0.7461     0.30
## 12            TCIA as.factor(residual.disease)2      1.1  0.8942     0.35
## # ... with 1 more variables: conf.high <dbl>
```

Check if cluDev was associated with OS


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.05   0.021     1.01
## 2            MSKCC as.factor(residual.disease)3     3.77   0.037     1.08
## 3            MSKCC                    volume.cc     1.00   0.211     1.00
## 4            MSKCC            as.factor(stage)4     1.57   0.366     0.59
## 5            MSKCC as.factor(residual.disease)2     1.33   0.593     0.47
## 6            MSKCC                      clu.dev     1.01   0.758     0.93
## 7             TCIA as.factor(residual.disease)3     5.66   0.040     1.08
## 8             TCIA as.factor(residual.disease)2     5.08   0.041     1.07
## 9             TCIA                          age     1.04   0.171     0.99
## 10            TCIA                    volume.cc     1.00   0.248     1.00
## 11            TCIA            as.factor(stage)4     1.90   0.306     0.56
## 12            TCIA                      clu.dev     0.99   0.968     0.66
## # ... with 1 more variables: conf.high <dbl>
```

Check if cluDiss was associated with PFS 


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1  0.0062     1.01
## 2            MSKCC                     clu.diss      1.0  0.0152     1.00
## 3            MSKCC as.factor(residual.disease)3      2.0  0.2355     0.63
## 4            MSKCC                    volume.cc      1.0  0.7553     1.00
## 5            MSKCC            as.factor(stage)4      1.1  0.7554     0.54
## 6            MSKCC as.factor(residual.disease)2      1.0  0.9945     0.44
## 7             TCIA                     clu.diss      1.0  0.0013     1.00
## 8             TCIA                          age      1.1  0.0594     1.00
## 9             TCIA as.factor(residual.disease)2      2.4  0.2059     0.62
## 10            TCIA                    volume.cc      1.0  0.4252     1.00
## 11            TCIA            as.factor(stage)4      1.7  0.4781     0.41
## 12            TCIA as.factor(residual.disease)3      1.4  0.6572     0.28
## # ... with 1 more variables: conf.high <dbl>
```

Check if cluDiss was associated with OS


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1   0.024     1.01
## 2            MSKCC as.factor(residual.disease)3      3.2   0.061     0.95
## 3            MSKCC                     clu.diss      1.0   0.064     1.00
## 4            MSKCC                    volume.cc      1.0   0.312     1.00
## 5            MSKCC            as.factor(stage)4      1.4   0.542     0.50
## 6            MSKCC as.factor(residual.disease)2      1.1   0.899     0.38
## 7             TCIA as.factor(residual.disease)3      5.6   0.043     1.06
## 8             TCIA as.factor(residual.disease)2      4.9   0.054     0.98
## 9             TCIA                          age      1.0   0.153     0.99
## 10            TCIA                    volume.cc      1.0   0.256     1.00
## 11            TCIA            as.factor(stage)4      1.9   0.301     0.57
## 12            TCIA                     clu.diss      1.0   0.885     1.00
## # ... with 1 more variables: conf.high <dbl>
```


**Unadjusted**
  
  
  Check if cSE was associated with PFS Unadjusted


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin  term estimate p.value conf.low conf.high
##             <chr> <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC  c.se      1.6  0.0271      1.1       2.4
## 2            TCIA  c.se      3.0  0.0075      1.3       6.8
```

Check if cSE was associated with OS Unadjusted


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin  term estimate p.value conf.low conf.high
##             <chr> <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC  c.se      1.5    0.16     0.86       2.5
## 2            TCIA  c.se      1.1    0.81     0.60       1.9
```

Check if cluDev was associated with PFS 


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin    term estimate p.value conf.low conf.high
##             <chr>   <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC clu.dev      1.0   0.140     0.98       1.1
## 2            TCIA clu.dev      1.6   0.016     1.09       2.3
```

Check if cluDev was associated with OS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin    term estimate p.value conf.low conf.high
##             <chr>   <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC clu.dev     1.03    0.40     0.96       1.1
## 2            TCIA clu.dev     0.87    0.41     0.62       1.2
```

Check if cluDiss was associated with PFS 


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin     term estimate p.value conf.low conf.high
##             <chr>    <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC clu.diss        1  0.0012        1         1
## 2            TCIA clu.diss        1  0.0011        1         1
```

Check if cluDiss was associated with OS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin     term estimate p.value conf.low conf.high
##             <chr>    <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC clu.diss        1   0.013        1         1
## 2            TCIA clu.diss        1   0.277        1         1
```


#### Non-parameteric tests to test association of ISTH measures with platinum status

Was cSE associated with Platinum sensitivity


```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC       132    0.46
## 2            TCIA        46    0.43
```

Was cluDev associated with Platinum sensitivity


```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC       112    0.19
## 2            TCIA        44    0.34
```

Was cluDiss associated with Platinum sensitivity


```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC       109    0.17
## 2            TCIA        47    0.46
```

#####Distribution of ISTH measures across cluster groups -- category boundaries

cSE


```
## Source: local data frame [8 x 7]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.ISTH  min_   Q1_ median_   Q3_  max_
##             <chr>          <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC           High   3.9   4.0     4.3   4.5   4.6
## 2           MSKCC            Low   1.5   2.7     2.8   3.0   3.0
## 3           MSKCC         Medium   3.1   3.7     3.9   4.1   4.4
## 4           MSKCC      UltraHigh   4.1   4.7     5.0   5.0   5.2
## 5            TCIA           High   3.3   3.9     3.9   4.1   4.2
## 6            TCIA            Low   2.0   2.2     2.8   3.0   3.3
## 7            TCIA         Medium   2.6   2.9     3.1   3.4   3.7
## 8            TCIA      UltraHigh   4.2   4.2     4.3   4.4   4.4
```

cluDev


```
## Source: local data frame [8 x 7]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.ISTH  min_   Q1_ median_   Q3_  max_
##             <chr>          <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC           High   2.7  5.00     6.0   6.8   8.4
## 2           MSKCC            Low   0.5  0.80     0.8   0.9   1.3
## 3           MSKCC         Medium   1.7  2.30     3.2   4.2  21.3
## 4           MSKCC      UltraHigh   6.6  9.30    10.6  12.3  17.4
## 5            TCIA           High   0.9  2.40     2.8   3.4   4.5
## 6            TCIA            Low   0.2  0.70     0.8   1.5   2.3
## 7            TCIA         Medium   0.6  0.72     0.9   1.2   3.2
## 8            TCIA      UltraHigh   3.8  3.90     4.0   4.1   4.2
```

cluDiss


```
## Source: local data frame [8 x 7]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.ISTH  min_   Q1_ median_   Q3_  max_
##             <chr>          <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC           High  7204  8082    8552  9700 12105
## 2           MSKCC            Low   374   733     990  1221  2246
## 3           MSKCC         Medium  2600  3857    5220  5816  6616
## 4           MSKCC      UltraHigh 14959 15983   16501 18367 30901
## 5            TCIA           High  4079  4365    4907  5456  5773
## 6            TCIA            Low   378   616     862  1066  1594
## 7            TCIA         Medium  2040  2576    2728  3043  3533
## 8            TCIA      UltraHigh 12847 12923   12999 13075 13150
```


####Association between high, ultra-high vs. low, medium ISTH clusters and survival

** Adjusted**
  
  Was low,medium cluster heterogeneity associated with PFS?


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.06 0.00324     1.02
## 2            MSKCC             clusterISTHbHigh     2.58 0.01196     1.23
## 3            MSKCC as.factor(residual.disease)3     2.07 0.24025     0.62
## 4            MSKCC            as.factor(stage)4     1.39 0.39773     0.65
## 5            MSKCC                    volume.cc     1.00 0.87573     1.00
## 6            MSKCC as.factor(residual.disease)2     0.98 0.96168     0.43
## 7             TCIA             clusterISTHbHigh     9.75 0.00081     2.57
## 8             TCIA                    volume.cc     1.00 0.08101     1.00
## 9             TCIA as.factor(residual.disease)3     2.14 0.32458     0.47
## 10            TCIA                          age     1.02 0.35001     0.98
## 11            TCIA as.factor(residual.disease)2     1.29 0.67114     0.39
## 12            TCIA            as.factor(stage)4     1.26 0.73989     0.32
## # ... with 1 more variables: conf.high <dbl>
```

Was low,medium cluster heterogeneity associated with OS?


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC             clusterISTHbHigh     3.18  0.0097     1.32
## 2            MSKCC                          age     1.06  0.0216     1.01
## 3            MSKCC as.factor(residual.disease)3     2.79  0.1172     0.77
## 4            MSKCC            as.factor(stage)4     1.68  0.3250     0.60
## 5            MSKCC                    volume.cc     1.00  0.4495     1.00
## 6            MSKCC as.factor(residual.disease)2     0.92  0.8776     0.32
## 7             TCIA as.factor(residual.disease)2     5.44  0.0361     1.12
## 8             TCIA as.factor(residual.disease)3     6.39  0.0418     1.07
## 9             TCIA                          age     1.04  0.1373     0.99
## 10            TCIA                    volume.cc     1.00  0.2117     1.00
## 11            TCIA            as.factor(stage)4     1.90  0.2924     0.58
## 12            TCIA             clusterISTHbHigh     1.19  0.7252     0.46
## # ... with 1 more variables: conf.high <dbl>
```


**Unadjusted**
  
  

```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin             term estimate p.value conf.low conf.high
##             <chr>            <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC clusterISTHbHigh      2.8 0.00361      1.4       5.5
## 2            TCIA clusterISTHbHigh      6.8 0.00065      2.3      20.7
```

Was low,medium cluster heterogeneity associated with OS?


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin             term estimate p.value conf.low conf.high
##             <chr>            <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC clusterISTHbHigh     3.47  0.0025     1.55       7.8
## 2            TCIA clusterISTHbHigh     0.84  0.6934     0.36       2.0
```


#### Distribution of clinical characteristics in the clustered groups for the two datasets

Number of ROIs


```
## Source: local data frame [8 x 8]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.ISTH  min_   Q1_ median_   Q3_  max_  sum_
##             <chr>          <chr> <int> <dbl>   <dbl> <dbl> <int> <int>
## 1           MSKCC           High     6   7.0     8.0   8.8    10   109
## 2           MSKCC            Low     2   2.0     3.0   3.0     5    27
## 3           MSKCC         Medium     4   6.0     6.0   7.5    12   103
## 4           MSKCC      UltraHigh     9   9.8    10.5  11.0    11    82
## 5            TCIA           High     3   4.0     4.0   5.0     6    59
## 6            TCIA            Low     2   2.0     2.0   4.0     5    36
## 7            TCIA         Medium     3   3.0     3.0   3.8     5    34
## 8            TCIA      UltraHigh     6   6.2     6.5   6.8     7    13
```

Volume 



```
## Source: local data frame [8 x 8]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.ISTH  min_   Q1_ median_   Q3_  max_  sum_
##             <chr>          <chr> <dbl> <dbl>   <dbl> <dbl> <dbl> <dbl>
## 1           MSKCC           High  12.9    66     124   230   744  3022
## 2           MSKCC            Low   7.4    20      61   259   610  1446
## 3           MSKCC         Medium  35.4    72     115   202   479  2281
## 4           MSKCC      UltraHigh 102.7   146     198   280   508  1991
## 5            TCIA           High   5.2   168     258   369  2585  6474
## 6            TCIA            Low  14.0    81     363   583  1262  5789
## 7            TCIA         Medium  34.6   231     298   565  1441  4613
## 8            TCIA      UltraHigh 953.0   957     961   965   969  1922
```

Number of cases


```
## Source: local data frame [8 x 3]
## Groups: institution.bin, ClusterID.ISTH [8]
## 
##   institution.bin ClusterID.ISTH  nrow
##             <chr>          <chr> <int>
## 1           MSKCC           High    14
## 2           MSKCC            Low     9
## 3           MSKCC         Medium    15
## 4           MSKCC      UltraHigh     8
## 5            TCIA           High    13
## 6            TCIA            Low    13
## 7            TCIA         Medium    10
## 8            TCIA      UltraHigh     2
```

PFS 


```
## Source: local data frame [8 x 7]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.ISTH  min_   Q1_ median_   Q3_  max_
##             <chr>          <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC           High   8.7  10.9      13    21    32
## 2           MSKCC            Low   0.0  10.1      33    37    46
## 3           MSKCC         Medium   0.0  12.9      19    28    49
## 4           MSKCC      UltraHigh   0.0   9.4      14    20    26
## 5            TCIA           High   6.0  12.0      13    20    40
## 6            TCIA            Low   0.3   5.9      22    32    75
## 7            TCIA         Medium   3.0   7.2      15    29    56
## 8            TCIA      UltraHigh   3.3   7.3      11    15    19
```

OS 


```
## Source: local data frame [8 x 7]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.ISTH  min_   Q1_ median_   Q3_  max_
##             <chr>          <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC           High  18.1  33.0      47    63    90
## 2           MSKCC            Low  10.4  59.2      76   109   124
## 3           MSKCC         Medium  35.3  54.3      69    76   106
## 4           MSKCC      UltraHigh   3.0  25.1      50    77   110
## 5            TCIA           High  13.0  27.0      36    40    82
## 6            TCIA            Low   0.3   5.9      32    60    75
## 7            TCIA         Medium   3.0   7.2      18    29    56
## 8            TCIA      UltraHigh  39.8  59.8      80   100   120
```

Resection status


```
## Source: local data frame [23 x 4]
## Groups: institution.bin, ClusterID.ISTH, residual.disease [23]
## 
##    institution.bin ClusterID.ISTH residual.disease  nrow
##              <chr>          <chr>            <int> <int>
## 1            MSKCC           High                0     2
## 2            MSKCC           High                2     9
## 3            MSKCC           High                3     3
## 4            MSKCC            Low                0     7
## 5            MSKCC            Low                2     1
## 6            MSKCC            Low                3     1
## 7            MSKCC         Medium                0     5
## 8            MSKCC         Medium                2     8
## 9            MSKCC         Medium                3     2
## 10           MSKCC      UltraHigh                0     1
## 11           MSKCC      UltraHigh                2     5
## 12           MSKCC      UltraHigh                3     2
## 13            TCIA           High                0     3
## 14            TCIA           High                2     7
## 15            TCIA           High                3     3
## 16            TCIA            Low                0     2
## 17            TCIA            Low                2     7
## 18            TCIA            Low                3     3
## 19            TCIA         Medium                0     2
## 20            TCIA         Medium                2     2
## 21            TCIA         Medium                3     5
## 22            TCIA      UltraHigh                0     1
## 23            TCIA      UltraHigh                3     1
```



Platinum resistant


```
## Source: local data frame [21 x 4]
## Groups: institution.bin, ClusterID.ISTH, platinum.resistant [21]
## 
##    institution.bin ClusterID.ISTH platinum.resistant  nrow
##              <chr>          <chr>              <lgl> <int>
## 1            MSKCC           High              FALSE     9
## 2            MSKCC           High               TRUE     5
## 3            MSKCC            Low              FALSE     8
## 4            MSKCC            Low               TRUE     1
## 5            MSKCC         Medium              FALSE    13
## 6            MSKCC         Medium               TRUE     1
## 7            MSKCC         Medium                 NA     1
## 8            MSKCC      UltraHigh              FALSE     5
## 9            MSKCC      UltraHigh               TRUE     2
## 10           MSKCC      UltraHigh                 NA     1
## 11            TCIA           High              FALSE     9
## 12            TCIA           High               TRUE     3
## 13            TCIA           High                 NA     1
## 14            TCIA            Low              FALSE     4
## 15            TCIA            Low               TRUE     1
## 16            TCIA            Low                 NA     8
## 17            TCIA         Medium              FALSE     3
## 18            TCIA         Medium               TRUE     2
## 19            TCIA         Medium                 NA     5
## 20            TCIA      UltraHigh              FALSE     1
## 21            TCIA      UltraHigh               TRUE     1
```

Fisher exact test for MSKCC clusters ISTH vs. platinum resistance


```
##   p.value                             method alternative
## 1    0.23 Fisher's Exact Test for Count Data   two.sided
```

Fisher exact test for TCIA clusters ISTH vs. platinum resistance

```
##   p.value                             method alternative
## 1    0.79 Fisher's Exact Test for Count Data   two.sided
```



#### Prevalence of Platinum resistance in clusters

Platinum resistance/sensitivity in low,medium vs. high/ultra-high ISTH clusters


```
## Source: local data frame [8 x 4]
## Groups: institution.bin, clusterISTH, platinum.resistant [8]
## 
##   institution.bin clusterISTH platinum.resistant  nrow
##             <chr>       <chr>              <lgl> <int>
## 1           MSKCC        aLow              FALSE    21
## 2           MSKCC        aLow               TRUE     2
## 3           MSKCC       bHigh              FALSE    14
## 4           MSKCC       bHigh               TRUE     7
## 5            TCIA        aLow              FALSE     7
## 6            TCIA        aLow               TRUE     3
## 7            TCIA       bHigh              FALSE    10
## 8            TCIA       bHigh               TRUE     4
```

Fisher exact test for MSKCC clusters ISTH vs. platinum resistance


```
##   estimate p.value conf.low conf.high
## 1      5.1   0.064      0.8        57
```

Fisher exact test for TCIA clusters ISTH vs. platinum resistance

```
##   estimate p.value conf.low conf.high
## 1      5.1   0.064      0.8        57
```

#### Prevalence of CCNE1 amplifications in the datasets


```
## Source: local data frame [10 x 4]
## Groups: institution.bin, clusterISTH, CCNE1.amp [10]
## 
##    institution.bin clusterISTH CCNE1.amp  nrow
##              <chr>       <chr>     <chr> <int>
## 1            MSKCC        aLow        No    17
## 2            MSKCC        aLow       Yes     4
## 3            MSKCC        aLow      <NA>     3
## 4            MSKCC       bHigh        No    13
## 5            MSKCC       bHigh       Yes     8
## 6            MSKCC       bHigh      <NA>     1
## 7             TCIA        aLow        No    17
## 8             TCIA        aLow       Yes     6
## 9             TCIA       bHigh        No    10
## 10            TCIA       bHigh       Yes     5
```

Fisher exact test for clusters vs. CCNE1: MSKCC


```
##   estimate p.value conf.low conf.high                             method
## 1      2.6    0.31     0.54        14 Fisher's Exact Test for Count Data
##   alternative
## 1   two.sided
```

Fisher exact test for clusters vs. CCNE1: TCIA


```
##   estimate p.value conf.low conf.high                             method
## 1      1.4    0.72     0.26       7.3 Fisher's Exact Test for Count Data
##   alternative
## 1   two.sided
```

Resection status


```
## Source: local data frame [12 x 4]
## Groups: institution.bin, clusterISTH, residual.disease [12]
## 
##    institution.bin clusterISTH residual.disease  nrow
##              <chr>       <chr>            <int> <int>
## 1            MSKCC        aLow                0    12
## 2            MSKCC        aLow                2     9
## 3            MSKCC        aLow                3     3
## 4            MSKCC       bHigh                0     3
## 5            MSKCC       bHigh                2    14
## 6            MSKCC       bHigh                3     5
## 7             TCIA        aLow                0     4
## 8             TCIA        aLow                2     9
## 9             TCIA        aLow                3     8
## 10            TCIA       bHigh                0     4
## 11            TCIA       bHigh                2     7
## 12            TCIA       bHigh                3     4
```

Fisher exact test for clusters vs. resection: MSKCC


```
##      Complete Optimal Suboptimal
## High       12       9          3
## Low         3      14          5
```

```
##   p.value                             method alternative
## 1   0.029 Fisher's Exact Test for Count Data   two.sided
```

Fisher exact test for clusters vs. resection: TCIA


```
##      Complete Optimal Suboptimal
## High        4       9          8
## Low         4       7          4
```

```
##   p.value                             method alternative
## 1    0.75 Fisher's Exact Test for Count Data   two.sided
```


***

##Haralick textures and association to outcomes
####Cox hazard regression for continuous Haralick texture measures with PFS in the two datasets
  
**Adjusted**
  
Check if Energy was associated with PFS 


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.06  0.0027     1.02
## 2            MSKCC as.factor(residual.disease)3     4.14  0.0196     1.26
## 3            MSKCC                       energy     0.99  0.0750     0.98
## 4            MSKCC as.factor(residual.disease)2     1.83  0.1528     0.80
## 5            MSKCC            as.factor(stage)4     1.40  0.4003     0.64
## 6            MSKCC                    volume.cc     1.00  0.7669     1.00
## 7             TCIA                       energy     0.99  0.1037     0.97
## 8             TCIA                    volume.cc     1.00  0.2977     1.00
## 9             TCIA as.factor(residual.disease)3     1.93  0.4213     0.39
## 10            TCIA as.factor(residual.disease)2     1.60  0.4567     0.46
## 11            TCIA            as.factor(stage)4     1.37  0.6444     0.36
## 12            TCIA                          age     1.00  0.9012     0.95
## # ... with 1 more variables: conf.high <dbl>
```

Check if Energy was associated with OS


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.05   0.021     1.01
## 2            MSKCC as.factor(residual.disease)3     4.20   0.029     1.15
## 3            MSKCC                    volume.cc     1.00   0.217     1.00
## 4            MSKCC            as.factor(stage)4     1.60   0.350     0.60
## 5            MSKCC as.factor(residual.disease)2     1.53   0.447     0.51
## 6            MSKCC                       energy     1.00   0.724     0.99
## 7             TCIA as.factor(residual.disease)3    10.22   0.020     1.45
## 8             TCIA as.factor(residual.disease)2     7.09   0.020     1.36
## 9             TCIA                    volume.cc     1.00   0.165     1.00
## 10            TCIA                       energy     0.99   0.254     0.98
## 11            TCIA            as.factor(stage)4     1.83   0.321     0.55
## 12            TCIA                          age     1.02   0.457     0.97
## # ... with 1 more variables: conf.high <dbl>
```

Check if Entropy was associated with PFS 


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1  0.0034     1.02
## 2            MSKCC as.factor(residual.disease)3      4.5  0.0157     1.33
## 3            MSKCC                      entropy      1.0  0.0786     1.00
## 4            MSKCC as.factor(residual.disease)2      1.9  0.1319     0.82
## 5            MSKCC            as.factor(stage)4      1.5  0.3506     0.66
## 6            MSKCC                    volume.cc      1.0  0.6469     1.00
## 7             TCIA                      entropy      1.0  0.1192     0.99
## 8             TCIA                    volume.cc      1.0  0.3432     1.00
## 9             TCIA as.factor(residual.disease)3      2.0  0.4125     0.39
## 10            TCIA as.factor(residual.disease)2      1.5  0.5401     0.44
## 11            TCIA            as.factor(stage)4      1.4  0.6445     0.36
## 12            TCIA                          age      1.0  0.8389     0.95
## # ... with 1 more variables: conf.high <dbl>
```

Check if Entropy was associated with OS


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1   0.024     1.01
## 2            MSKCC as.factor(residual.disease)3      4.2   0.032     1.13
## 3            MSKCC                    volume.cc      1.0   0.190     1.00
## 4            MSKCC            as.factor(stage)4      1.6   0.352     0.59
## 5            MSKCC as.factor(residual.disease)2      1.5   0.471     0.50
## 6            MSKCC                      entropy      1.0   0.787     0.98
## 7             TCIA as.factor(residual.disease)3     11.2   0.016     1.57
## 8             TCIA as.factor(residual.disease)2      6.6   0.020     1.34
## 9             TCIA                    volume.cc      1.0   0.152     1.00
## 10            TCIA                      entropy      1.0   0.217     0.99
## 11            TCIA            as.factor(stage)4      1.8   0.324     0.55
## 12            TCIA                          age      1.0   0.568     0.96
## # ... with 1 more variables: conf.high <dbl>
```

Check if Contrast was associated with PFS 


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.06  0.0032     1.02
## 2            MSKCC as.factor(residual.disease)3     2.86  0.0726     0.91
## 3            MSKCC                     contrast     0.99  0.1517     0.98
## 4            MSKCC as.factor(residual.disease)2     1.35  0.4690     0.60
## 5            MSKCC                    volume.cc     1.00  0.8175     1.00
## 6            MSKCC            as.factor(stage)4     1.08  0.8454     0.51
## 7             TCIA                    volume.cc     1.00  0.2080     1.00
## 8             TCIA                     contrast     1.03  0.3857     0.96
## 9             TCIA            as.factor(stage)4     1.63  0.4797     0.42
## 10            TCIA                          age     1.01  0.7382     0.96
## 11            TCIA as.factor(residual.disease)2     0.96  0.9468     0.31
## 12            TCIA as.factor(residual.disease)3     1.02  0.9787     0.23
## # ... with 1 more variables: conf.high <dbl>
```

Check if Contrast was associated with OS


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.05   0.029     1.00
## 2            MSKCC as.factor(residual.disease)3     3.88   0.031     1.13
## 3            MSKCC                     contrast     0.99   0.204     0.96
## 4            MSKCC                    volume.cc     1.00   0.302     1.00
## 5            MSKCC as.factor(residual.disease)2     1.48   0.434     0.55
## 6            MSKCC            as.factor(stage)4     1.34   0.573     0.49
## 7             TCIA as.factor(residual.disease)3     6.09   0.034     1.14
## 8             TCIA as.factor(residual.disease)2     4.06   0.080     0.85
## 9             TCIA                     contrast     1.03   0.104     0.99
## 10            TCIA            as.factor(stage)4     2.22   0.209     0.64
## 11            TCIA                          age     1.03   0.228     0.98
## 12            TCIA                    volume.cc     1.00   0.380     1.00
## # ... with 1 more variables: conf.high <dbl>
```

Check if Homogeneity was associated with PFS 


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1  0.0064     1.01
## 2            MSKCC as.factor(residual.disease)3      3.6  0.0395     1.06
## 3            MSKCC as.factor(residual.disease)2      1.5  0.3256     0.65
## 4            MSKCC            as.factor(stage)4      1.2  0.5978     0.57
## 5            MSKCC                  homogeneity      1.0  0.6394     0.99
## 6            MSKCC                    volume.cc      1.0  0.8875     1.00
## 7             TCIA                    volume.cc      1.0  0.3323     1.00
## 8             TCIA            as.factor(stage)4      1.6  0.5042     0.41
## 9             TCIA                  homogeneity      1.0  0.7528     0.97
## 10            TCIA                          age      1.0  0.8312     0.95
## 11            TCIA as.factor(residual.disease)3      1.1  0.9407     0.22
## 12            TCIA as.factor(residual.disease)2      1.0  0.9420     0.34
## # ... with 1 more variables: conf.high <dbl>
```

Check if Homogeneity was associated with OS


```
## Source: local data frame [12 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age     1.05   0.031     1.00
## 2            MSKCC as.factor(residual.disease)3     3.16   0.063     0.94
## 3            MSKCC                  homogeneity     0.98   0.198     0.95
## 4            MSKCC                    volume.cc     1.00   0.384     1.00
## 5            MSKCC            as.factor(stage)4     1.37   0.523     0.52
## 6            MSKCC as.factor(residual.disease)2     1.10   0.857     0.39
## 7             TCIA as.factor(residual.disease)2     5.04   0.041     1.07
## 8             TCIA as.factor(residual.disease)3     5.91   0.047     1.03
## 9             TCIA                    volume.cc     1.00   0.229     1.00
## 10            TCIA            as.factor(stage)4     1.92   0.288     0.58
## 11            TCIA                          age     1.03   0.313     0.97
## 12            TCIA                  homogeneity     1.00   0.889     0.96
## # ... with 1 more variables: conf.high <dbl>
```

**Unadjusted**
  
  
  Check if Energy was associated with PFS 


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin   term estimate p.value conf.low conf.high
##             <chr>  <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC energy     1.00    0.91     0.99         1
## 2            TCIA energy     0.99    0.23     0.98         1
```

Check if Energy was associated with OS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin   term estimate p.value conf.low conf.high
##             <chr>  <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC energy        1    0.39     0.99         1
## 2            TCIA energy        1    0.78     0.99         1
```

Check if Entropy was associated with PFS 


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin    term estimate p.value conf.low conf.high
##             <chr>   <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC entropy        1    0.95     0.99         1
## 2            TCIA entropy        1    0.20     0.99         1
```

Check if Entropy was associated with OS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin    term estimate p.value conf.low conf.high
##             <chr>   <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC entropy     0.99    0.17     0.98         1
## 2            TCIA entropy     1.00    0.91     0.98         1
```

Check if Contrast was associated with PFS 


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin     term estimate p.value conf.low conf.high
##             <chr>    <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC contrast     0.99    0.20     0.98       1.0
## 2            TCIA contrast     1.03    0.34     0.97       1.1
```

Check if Contrast was associated with OS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin     term estimate p.value conf.low conf.high
##             <chr>    <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC contrast     0.98   0.108     0.96       1.0
## 2            TCIA contrast     1.03   0.024     1.00       1.1
```

Check if Homogeneity was associated with PFS 


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin        term estimate p.value conf.low conf.high
##             <chr>       <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC homogeneity        1    0.82     0.98         1
## 2            TCIA homogeneity        1    0.25     0.99         1
```

Check if Homogeneity was associated with OS


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin        term estimate p.value conf.low conf.high
##             <chr>       <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC homogeneity     0.97   0.023     0.95         1
## 2            TCIA homogeneity     1.00   0.878     0.97         1
```


#### Non-parameteric tests to test association of Haralick textures with platinum status



```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC       133   0.492
## 2            TCIA        33   0.099
```

Was entropy associated with Platinum sensitivity


```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC       193    0.31
## 2            TCIA        80    0.21
```

Was contrast associated with Platinum sensitivity


```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC       192    0.32
## 2            TCIA        66    0.68
```


Was homogeneity associated with Platinum sensitivity


```
## Source: local data frame [2 x 3]
## Groups: institution.bin [2]
## 
##   institution.bin statistic p.value
##             <chr>     <dbl>   <dbl>
## 1           MSKCC       180    0.51
## 2            TCIA        70    0.53
```



###### Category boundaries for Haralick clusters

Energy


```
## Source: local data frame [6 x 7]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.Haralick  min_   Q1_ median_   Q3_  max_
##             <chr>              <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC               High    94   144     157   163   179
## 2           MSKCC                Low   195   225     235   245   254
## 3           MSKCC             Medium   171   180     188   202   214
## 4            TCIA               High   101   122     134   140   166
## 5            TCIA                Low   202   204     206   232   244
## 6            TCIA             Medium   160   170     180   186   192
```

Entropy


```
## Source: local data frame [6 x 7]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.Haralick  min_   Q1_ median_   Q3_  max_
##             <chr>              <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC               High  59.1    63      71    77   166
## 2           MSKCC                Low   1.4    12      26    37    61
## 3           MSKCC             Medium  24.2    35      41    47    52
## 4            TCIA               High  58.9    69      77    86    95
## 5            TCIA                Low  17.3    26      29    31    36
## 6            TCIA             Medium  36.5    39      41    51    56
```

Contrast


```
## Source: local data frame [6 x 7]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.Haralick  min_   Q1_ median_   Q3_  max_
##             <chr>              <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC               High   1.2   3.2     7.4  15.0  61.3
## 2           MSKCC                Low   2.8  28.0    34.9  48.7 131.2
## 3           MSKCC             Medium   0.5   1.3     1.9   7.7  15.1
## 4            TCIA               High   0.6   1.4     2.6   3.9  93.6
## 5            TCIA                Low   0.6   2.0     3.3   4.8  39.4
## 6            TCIA             Medium   0.6   0.9     1.6   1.9   2.8
```

Homogeneity


```
## Source: local data frame [6 x 7]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.Haralick  min_   Q1_ median_   Q3_  max_
##             <chr>              <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC               High   9.1  21.9    27.3  52.6   109
## 2           MSKCC                Low   0.9   8.2    16.0  27.6    47
## 3           MSKCC             Medium   2.4   4.4     8.7  21.6    34
## 4            TCIA               High   7.5  10.8    15.7  27.4    73
## 5            TCIA                Low   2.0   3.6     5.4  11.8    20
## 6            TCIA             Medium   4.6   5.2     7.4   9.3    14
```





####Association between Haralick clusters and survival

**Adjusted**
  
  Haralick clusters and association with PFS?


```
## Source: local data frame [14 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1  0.0043     1.02
## 2            MSKCC as.factor(residual.disease)3      3.7  0.0321     1.12
## 3            MSKCC                HclustercHigh      1.8  0.1663     0.78
## 4            MSKCC as.factor(residual.disease)2      1.7  0.2126     0.74
## 5            MSKCC              HclusterbMedium      1.6  0.2685     0.70
## 6            MSKCC            as.factor(stage)4      1.2  0.5910     0.56
## 7            MSKCC                    volume.cc      1.0  0.7809     1.00
## 8             TCIA                HclustercHigh      3.1  0.1365     0.70
## 9             TCIA                    volume.cc      1.0  0.4363     1.00
## 10            TCIA as.factor(residual.disease)3      1.7  0.5001     0.36
## 11            TCIA as.factor(residual.disease)2      1.5  0.5004     0.45
## 12            TCIA            as.factor(stage)4      1.5  0.5433     0.40
## 13            TCIA              HclusterbMedium      1.7  0.5563     0.30
## 14            TCIA                          age      1.0  0.9908     0.96
## # ... with 1 more variables: conf.high <dbl>
```

Haralick clusters and association with OS?


```
## Source: local data frame [14 x 6]
## Groups: institution.bin [2]
## 
##    institution.bin                         term estimate p.value conf.low
##              <chr>                        <chr>    <dbl>   <dbl>    <dbl>
## 1            MSKCC                          age      1.1   0.023     1.01
## 2            MSKCC as.factor(residual.disease)3      4.3   0.026     1.19
## 3            MSKCC                    volume.cc      1.0   0.201     1.00
## 4            MSKCC            as.factor(stage)4      1.7   0.276     0.64
## 5            MSKCC as.factor(residual.disease)2      1.5   0.470     0.50
## 6            MSKCC              HclusterbMedium      0.8   0.681     0.28
## 7            MSKCC                HclustercHigh      1.2   0.772     0.40
## 8             TCIA as.factor(residual.disease)2      7.1   0.018     1.41
## 9             TCIA as.factor(residual.disease)3      9.1   0.023     1.36
## 10            TCIA                    volume.cc      1.0   0.164     1.00
## 11            TCIA                HclustercHigh      2.4   0.196     0.64
## 12            TCIA              HclusterbMedium      2.2   0.237     0.60
## 13            TCIA            as.factor(stage)4      2.0   0.247     0.61
## 14            TCIA                          age      1.0   0.407     0.97
## # ... with 1 more variables: conf.high <dbl>
```


**Unadjusted**
  
  Haralick clusters and association with PFS?


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin          term estimate p.value conf.low conf.high
##             <chr>         <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC HclustercHigh      1.1    0.75     0.58       2.1
## 2            TCIA HclustercHigh      1.9    0.18     0.73       5.1
```

Haralick clusters and association with OS?


```
## Source: local data frame [2 x 6]
## Groups: institution.bin [2]
## 
##   institution.bin          term estimate p.value conf.low conf.high
##             <chr>         <chr>    <dbl>   <dbl>    <dbl>     <dbl>
## 1           MSKCC HclustercHigh     0.89    0.78     0.40       2.0
## 2            TCIA HclustercHigh     0.79    0.59     0.34       1.8
```

#### Distribution of clinical characteristics in the clustered groups for the two datasets

Number of ROIs


```
## Source: local data frame [6 x 8]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.Haralick  min_   Q1_ median_   Q3_  max_  sum_
##             <chr>              <chr> <int> <dbl>   <dbl> <dbl> <int> <int>
## 1           MSKCC               High     2   3.0     6.5   8.2    11    99
## 2           MSKCC                Low     2   6.5     8.0  10.0    12   120
## 3           MSKCC             Medium     2   5.5     6.0   9.0    11   102
## 4            TCIA               High     2   2.0     3.5   4.0     6    70
## 5            TCIA                Low     2   3.0     4.0   4.5     7    28
## 6            TCIA             Medium     3   3.0     4.0   4.5     6    44
```

Volume 



```
## Source: local data frame [6 x 8]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.Haralick  min_   Q1_ median_   Q3_  max_  sum_
##             <chr>              <chr> <dbl> <dbl>   <dbl> <dbl> <dbl> <dbl>
## 1           MSKCC               High  10.7    35      99   159   649  2436
## 2           MSKCC                Low  28.3   116     186   231   610  2959
## 3           MSKCC             Medium   7.4    66     126   359   744  3346
## 4            TCIA               High  14.0    81     261   644  2585 10218
## 5            TCIA                Low   5.2   206     378   759   969  3281
## 6            TCIA             Medium  37.0   256     331   587  1441  5299
```

Number of cases


```
## Source: local data frame [6 x 3]
## Groups: institution.bin, ClusterID.Haralick [6]
## 
##   institution.bin ClusterID.Haralick  nrow
##             <chr>              <chr> <int>
## 1           MSKCC               High    16
## 2           MSKCC                Low    15
## 3           MSKCC             Medium    15
## 4            TCIA               High    20
## 5            TCIA                Low     7
## 6            TCIA             Medium    11
```

PFS 


```
## Source: local data frame [6 x 7]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.Haralick  min_   Q1_ median_   Q3_  max_
##             <chr>              <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC               High   0.0  10.1      13    30    37
## 2           MSKCC                Low   8.0  11.8      16    26    49
## 3           MSKCC             Medium   0.0  11.6      18    26    42
## 4            TCIA               High   0.3   9.9      17    24    71
## 5            TCIA                Low   3.3  17.1      22    52    75
## 6            TCIA             Medium   3.0   5.4      10    19    56
```

OS 


```
## Source: local data frame [6 x 7]
## Groups: institution.bin [?]
## 
##   institution.bin ClusterID.Haralick  min_   Q1_ median_   Q3_  max_
##             <chr>              <chr> <dbl> <dbl>   <dbl> <dbl> <dbl>
## 1           MSKCC               High  25.8  47.9      56    83   114
## 2           MSKCC                Low  10.4  41.8      57    68    77
## 3           MSKCC             Medium   3.0  42.8      69    83   124
## 4            TCIA               High   0.3  17.5      32    45    82
## 5            TCIA                Low  20.9  35.2      40    63    75
## 6            TCIA             Medium   3.0   5.5      18    28   120
```



Resection status


```
## Source: local data frame [17 x 4]
## Groups: institution.bin, ClusterID.Haralick, residual.disease [17]
## 
##    institution.bin ClusterID.Haralick residual.disease  nrow
##              <chr>              <chr>            <int> <int>
## 1            MSKCC               High                0     7
## 2            MSKCC               High                2     8
## 3            MSKCC               High                3     1
## 4            MSKCC                Low                0     2
## 5            MSKCC                Low                2     9
## 6            MSKCC                Low                3     4
## 7            MSKCC             Medium                0     6
## 8            MSKCC             Medium                2     6
## 9            MSKCC             Medium                3     3
## 10            TCIA               High                0     7
## 11            TCIA               High                2     6
## 12            TCIA               High                3     5
## 13            TCIA                Low                2     5
## 14            TCIA                Low                3     2
## 15            TCIA             Medium                0     1
## 16            TCIA             Medium                2     5
## 17            TCIA             Medium                3     5
```

Were clusters associated with resection status


```
##        Complete Optimal Suboptimal
## High          7       8          1
## Low           2       9          4
## Medium        6       6          3
```

```
##   p.value                             method alternative
## 1    0.38 Fisher's Exact Test for Count Data   two.sided
```

Fisher exact test for clusters vs. resection: TCIA


```
##      Complete Optimal Suboptimal
## High        6       6          3
## Low         7       6          5
```

```
##   p.value                             method alternative
## 1    0.91 Fisher's Exact Test for Count Data   two.sided
```


#### Prevalence of Platinum resistance in clusters

Platinum resistant


```
## Source: local data frame [12 x 4]
## Groups: institution.bin, ClusterID.Haralick, platinum.resistant [12]
## 
##    institution.bin ClusterID.Haralick platinum.resistant  nrow
##              <chr>              <chr>              <lgl> <int>
## 1            MSKCC               High              FALSE    13
## 2            MSKCC               High               TRUE     3
## 3            MSKCC                Low              FALSE    10
## 4            MSKCC                Low               TRUE     4
## 5            MSKCC             Medium              FALSE    12
## 6            MSKCC             Medium               TRUE     2
## 7             TCIA               High              FALSE    11
## 8             TCIA               High               TRUE     3
## 9             TCIA                Low              FALSE     2
## 10            TCIA                Low               TRUE     1
## 11            TCIA             Medium              FALSE     4
## 12            TCIA             Medium               TRUE     3
```


Fisher exact test for MSKCC clusters Haralick vs. platinum resistance


```
##   p.value                             method alternative
## 1    0.73 Fisher's Exact Test for Count Data   two.sided
```

Fisher exact test for TCIA clusters Haralick vs. platinum resistance

```
##   p.value                             method alternative
## 1    0.57 Fisher's Exact Test for Count Data   two.sided
```

***

##Differences in the texture values for scan manufacturers



cSE vs. Scanner


```
##   statistic p.value                                            method
## 1       148    0.56 Wilcoxon rank sum test with continuity correction
##   alternative
## 1   two.sided
```


cluDev vs. scanner


```
##   statistic p.value                                            method
## 1       130    0.26 Wilcoxon rank sum test with continuity correction
##   alternative
## 1   two.sided
```

cluDiss vs. scanner


```
##   statistic p.value                 method alternative
## 1       168       1 Wilcoxon rank sum test   two.sided
```

Energy vs. scanner


```
##   statistic p.value                 method alternative
## 1        65  0.0013 Wilcoxon rank sum test   two.sided
```

Contrast vs. scanner


```
##   statistic p.value                                            method
## 1       194    0.43 Wilcoxon rank sum test with continuity correction
##   alternative
## 1   two.sided
```

Homogeneity vs. scanner


```
##   statistic p.value                                            method
## 1       238   0.034 Wilcoxon rank sum test with continuity correction
##   alternative
## 1   two.sided
```

Entropy vs. scanner


```
##   statistic p.value                 method alternative
## 1       277 0.00062 Wilcoxon rank sum test   two.sided
```


## Generate the KM curves for using the ISTH clusters (low,mid vs. high, ultra-high)

PFS



OS


![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-166-1.png)<!-- -->![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-166-2.png)<!-- -->![](2017-Veeraraghavan_files/figure-html/unnamed-chunk-166-3.png)<!-- -->






