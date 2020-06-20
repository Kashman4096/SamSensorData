---
title: "Samsung SensorData CodeSheet"
author: "Manish Kashyap"
date: "20/06/2020"
output: html_document
---

#Samsung SensorData CodeSheet

Data can be downloaded from here:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The actual big tidy table for the analysis is a combination of 
**TEST data** and **TRAIN data** provided in the very link above

This tidy table is then processed to obtain a smaller table 
which contains the **MEAN** of all the activity data of each subject

***

Below are the tables in which the data is stored for analysis
This will help you to understand the Rcode better


Variable names| File names
------------- | -------------
xtest         | X_test.txt
ytest         | y_test.txt 
xtrain        | X_train.txt
ytrain        | y_train.txt
features      | features.txt
tsub          | subject_test.txt
body1         | body_acc_x_test.txt and body_acc_x_train.txt
body2         | body_acc_y_test.txt and body_acc_y_train.txt
body3         | body_acc_z_test.txt and body_acc_z_train.txt
body4         | body_gyro_x_test.txt and body_gyro_x_train.txt
body5         | body_gyro_y_test.txt and body_gyro_y_train.txt
body6         | body_gyro_z_test.txt and body_gyro_z_train.txt
body7         | total_acc_x_test.txt and total_acc_x_train.txt
body8         | total_acc_y_test.txt and total_acc_y_train.txt
body9         | total_acc_z_test.txt and total_acc_z_train.txt

**Below are the column names of the tidy table which is created after analysis:**
```{r}
  [1] "subject"                           "activity"                          "tbodyaccmeanx"                    
  [4] "tbodyaccmeany"                     "tbodyaccmeanz"                     "tbodyaccstdx"                     
  [7] "tbodyaccstdy"                      "tbodyaccstdz"                      "tbodyaccmadx"                     
 [10] "tbodyaccmady"                      "tbodyaccmadz"                      "tbodyaccmaxx"                     
 [13] "tbodyaccmaxy"                      "tbodyaccmaxz"                      "tbodyaccminx"                     
 [16] "tbodyaccminy"                      "tbodyaccminz"                      "tbodyaccsma"                      
 [19] "tbodyaccenergyx"                   "tbodyaccenergyy"                   "tbodyaccenergyz"                  
 [22] "tbodyacciqrx"                      "tbodyacciqry"                      "tbodyacciqrz"                     
 [25] "tbodyaccentropyx"                  "tbodyaccentropyy"                  "tbodyaccentropyz"                 
 [28] "tbodyaccarcoeffx1"                 "tbodyaccarcoeffx2"                 "tbodyaccarcoeffx3"                
 [31] "tbodyaccarcoeffx4"                 "tbodyaccarcoeffy1"                 "tbodyaccarcoeffy2"                
 [34] "tbodyaccarcoeffy3"                 "tbodyaccarcoeffy4"                 "tbodyaccarcoeffz1"                
 [37] "tbodyaccarcoeffz2"                 "tbodyaccarcoeffz3"                 "tbodyaccarcoeffz4"                
 [40] "tbodyacccorrelationxy"             "tbodyacccorrelationxz"             "tbodyacccorrelationyz"            
 [43] "tgravityaccmeanx"                  "tgravityaccmeany"                  "tgravityaccmeanz"                 
 [46] "tgravityaccstdx"                   "tgravityaccstdy"                   "tgravityaccstdz"                  
 [49] "tgravityaccmadx"                   "tgravityaccmady"                   "tgravityaccmadz"                  
 [52] "tgravityaccmaxx"                   "tgravityaccmaxy"                   "tgravityaccmaxz"                  
 [55] "tgravityaccminx"                   "tgravityaccminy"                   "tgravityaccminz"                  
 [58] "tgravityaccsma"                    "tgravityaccenergyx"                "tgravityaccenergyy"               
 [61] "tgravityaccenergyz"                "tgravityacciqrx"                   "tgravityacciqry"                  
 [64] "tgravityacciqrz"                   "tgravityaccentropyx"               "tgravityaccentropyy"              
 [67] "tgravityaccentropyz"               "tgravityaccarcoeffx1"              "tgravityaccarcoeffx2"             
 [70] "tgravityaccarcoeffx3"              "tgravityaccarcoeffx4"              "tgravityaccarcoeffy1"             
 [73] "tgravityaccarcoeffy2"              "tgravityaccarcoeffy3"              "tgravityaccarcoeffy4"             
 [76] "tgravityaccarcoeffz1"              "tgravityaccarcoeffz2"              "tgravityaccarcoeffz3"             
 [79] "tgravityaccarcoeffz4"              "tgravityacccorrelationxy"          "tgravityacccorrelationxz"         
 [82] "tgravityacccorrelationyz"          "tbodyaccjerkmeanx"                 "tbodyaccjerkmeany"                
 [85] "tbodyaccjerkmeanz"                 "tbodyaccjerkstdx"                  "tbodyaccjerkstdy"                 
 [88] "tbodyaccjerkstdz"                  "tbodyaccjerkmadx"                  "tbodyaccjerkmady"                 
 [91] "tbodyaccjerkmadz"                  "tbodyaccjerkmaxx"                  "tbodyaccjerkmaxy"                 
 [94] "tbodyaccjerkmaxz"                  "tbodyaccjerkminx"                  "tbodyaccjerkminy"                 
 [97] "tbodyaccjerkminz"                  "tbodyaccjerksma"                   "tbodyaccjerkenergyx"              
[100] "tbodyaccjerkenergyy"               "tbodyaccjerkenergyz"               "tbodyaccjerkiqrx"                 
[103] "tbodyaccjerkiqry"                  "tbodyaccjerkiqrz"                  "tbodyaccjerkentropyx"             
[106] "tbodyaccjerkentropyy"              "tbodyaccjerkentropyz"              "tbodyaccjerkarcoeffx1"            
[109] "tbodyaccjerkarcoeffx2"             "tbodyaccjerkarcoeffx3"             "tbodyaccjerkarcoeffx4"            
[112] "tbodyaccjerkarcoeffy1"             "tbodyaccjerkarcoeffy2"             "tbodyaccjerkarcoeffy3"            
[115] "tbodyaccjerkarcoeffy4"             "tbodyaccjerkarcoeffz1"             "tbodyaccjerkarcoeffz2"            
[118] "tbodyaccjerkarcoeffz3"             "tbodyaccjerkarcoeffz4"             "tbodyaccjerkcorrelationxy"        
[121] "tbodyaccjerkcorrelationxz"         "tbodyaccjerkcorrelationyz"         "tbodygyromeanx"                   
[124] "tbodygyromeany"                    "tbodygyromeanz"                    "tbodygyrostdx"                    
[127] "tbodygyrostdy"                     "tbodygyrostdz"                     "tbodygyromadx"                    
[130] "tbodygyromady"                     "tbodygyromadz"                     "tbodygyromaxx"                    
[133] "tbodygyromaxy"                     "tbodygyromaxz"                     "tbodygyrominx"                    
[136] "tbodygyrominy"                     "tbodygyrominz"                     "tbodygyrosma"                     
[139] "tbodygyroenergyx"                  "tbodygyroenergyy"                  "tbodygyroenergyz"                 
[142] "tbodygyroiqrx"                     "tbodygyroiqry"                     "tbodygyroiqrz"                    
[145] "tbodygyroentropyx"                 "tbodygyroentropyy"                 "tbodygyroentropyz"                
[148] "tbodygyroarcoeffx1"                "tbodygyroarcoeffx2"                "tbodygyroarcoeffx3"               
[151] "tbodygyroarcoeffx4"                "tbodygyroarcoeffy1"                "tbodygyroarcoeffy2"               
[154] "tbodygyroarcoeffy3"                "tbodygyroarcoeffy4"                "tbodygyroarcoeffz1"               
[157] "tbodygyroarcoeffz2"                "tbodygyroarcoeffz3"                "tbodygyroarcoeffz4"               
[160] "tbodygyrocorrelationxy"            "tbodygyrocorrelationxz"            "tbodygyrocorrelationyz"           
[163] "tbodygyrojerkmeanx"                "tbodygyrojerkmeany"                "tbodygyrojerkmeanz"               
[166] "tbodygyrojerkstdx"                 "tbodygyrojerkstdy"                 "tbodygyrojerkstdz"                
[169] "tbodygyrojerkmadx"                 "tbodygyrojerkmady"                 "tbodygyrojerkmadz"                
[172] "tbodygyrojerkmaxx"                 "tbodygyrojerkmaxy"                 "tbodygyrojerkmaxz"                
[175] "tbodygyrojerkminx"                 "tbodygyrojerkminy"                 "tbodygyrojerkminz"                
[178] "tbodygyrojerksma"                  "tbodygyrojerkenergyx"              "tbodygyrojerkenergyy"             
[181] "tbodygyrojerkenergyz"              "tbodygyrojerkiqrx"                 "tbodygyrojerkiqry"                
[184] "tbodygyrojerkiqrz"                 "tbodygyrojerkentropyx"             "tbodygyrojerkentropyy"            
[187] "tbodygyrojerkentropyz"             "tbodygyrojerkarcoeffx1"            "tbodygyrojerkarcoeffx2"           
[190] "tbodygyrojerkarcoeffx3"            "tbodygyrojerkarcoeffx4"            "tbodygyrojerkarcoeffy1"           
[193] "tbodygyrojerkarcoeffy2"            "tbodygyrojerkarcoeffy3"            "tbodygyrojerkarcoeffy4"           
[196] "tbodygyrojerkarcoeffz1"            "tbodygyrojerkarcoeffz2"            "tbodygyrojerkarcoeffz3"           
[199] "tbodygyrojerkarcoeffz4"            "tbodygyrojerkcorrelationxy"        "tbodygyrojerkcorrelationxz"       
[202] "tbodygyrojerkcorrelationyz"        "tbodyaccmagmean"                   "tbodyaccmagstd"                   
[205] "tbodyaccmagmad"                    "tbodyaccmagmax"                    "tbodyaccmagmin"                   
[208] "tbodyaccmagsma"                    "tbodyaccmagenergy"                 "tbodyaccmagiqr"                   
[211] "tbodyaccmagentropy"                "tbodyaccmagarcoeff1"               "tbodyaccmagarcoeff2"              
[214] "tbodyaccmagarcoeff3"               "tbodyaccmagarcoeff4"               "tgravityaccmagmean"               
[217] "tgravityaccmagstd"                 "tgravityaccmagmad"                 "tgravityaccmagmax"                
[220] "tgravityaccmagmin"                 "tgravityaccmagsma"                 "tgravityaccmagenergy"             
[223] "tgravityaccmagiqr"                 "tgravityaccmagentropy"             "tgravityaccmagarcoeff1"           
[226] "tgravityaccmagarcoeff2"            "tgravityaccmagarcoeff3"            "tgravityaccmagarcoeff4"           
[229] "tbodyaccjerkmagmean"               "tbodyaccjerkmagstd"                "tbodyaccjerkmagmad"               
[232] "tbodyaccjerkmagmax"                "tbodyaccjerkmagmin"                "tbodyaccjerkmagsma"               
[235] "tbodyaccjerkmagenergy"             "tbodyaccjerkmagiqr"                "tbodyaccjerkmagentropy"           
[238] "tbodyaccjerkmagarcoeff1"           "tbodyaccjerkmagarcoeff2"           "tbodyaccjerkmagarcoeff3"          
[241] "tbodyaccjerkmagarcoeff4"           "tbodygyromagmean"                  "tbodygyromagstd"                  
[244] "tbodygyromagmad"                   "tbodygyromagmax"                   "tbodygyromagmin"                  
[247] "tbodygyromagsma"                   "tbodygyromagenergy"                "tbodygyromagiqr"                  
[250] "tbodygyromagentropy"               "tbodygyromagarcoeff1"              "tbodygyromagarcoeff2"             
[253] "tbodygyromagarcoeff3"              "tbodygyromagarcoeff4"              "tbodygyrojerkmagmean"             
[256] "tbodygyrojerkmagstd"               "tbodygyrojerkmagmad"               "tbodygyrojerkmagmax"              
[259] "tbodygyrojerkmagmin"               "tbodygyrojerkmagsma"               "tbodygyrojerkmagenergy"           
[262] "tbodygyrojerkmagiqr"               "tbodygyrojerkmagentropy"           "tbodygyrojerkmagarcoeff1"         
[265] "tbodygyrojerkmagarcoeff2"          "tbodygyrojerkmagarcoeff3"          "tbodygyrojerkmagarcoeff4"         
[268] "fbodyaccmeanx"                     "fbodyaccmeany"                     "fbodyaccmeanz"                    
[271] "fbodyaccstdx"                      "fbodyaccstdy"                      "fbodyaccstdz"                     
[274] "fbodyaccmadx"                      "fbodyaccmady"                      "fbodyaccmadz"                     
[277] "fbodyaccmaxx"                      "fbodyaccmaxy"                      "fbodyaccmaxz"                     
[280] "fbodyaccminx"                      "fbodyaccminy"                      "fbodyaccminz"                     
[283] "fbodyaccsma"                       "fbodyaccenergyx"                   "fbodyaccenergyy"                  
[286] "fbodyaccenergyz"                   "fbodyacciqrx"                      "fbodyacciqry"                     
[289] "fbodyacciqrz"                      "fbodyaccentropyx"                  "fbodyaccentropyy"                 
[292] "fbodyaccentropyz"                  "fbodyaccmaxindsx"                  "fbodyaccmaxindsy"                 
[295] "fbodyaccmaxindsz"                  "fbodyaccmeanfreqx"                 "fbodyaccmeanfreqy"                
[298] "fbodyaccmeanfreqz"                 "fbodyaccskewnessx"                 "fbodyacckurtosisx"                
[301] "fbodyaccskewnessy"                 "fbodyacckurtosisy"                 "fbodyaccskewnessz"                
[304] "fbodyacckurtosisz"                 "fbodyaccbandsenergy18"             "fbodyaccbandsenergy916"           
[307] "fbodyaccbandsenergy1724"           "fbodyaccbandsenergy2532"           "fbodyaccbandsenergy3340"          
[310] "fbodyaccbandsenergy4148"           "fbodyaccbandsenergy4956"           "fbodyaccbandsenergy5764"          
[313] "fbodyaccbandsenergy116"            "fbodyaccbandsenergy1732"           "fbodyaccbandsenergy3348"          
[316] "fbodyaccbandsenergy4964"           "fbodyaccbandsenergy124"            "fbodyaccbandsenergy2548"          
[319] "fbodyaccbandsenergy18"             "fbodyaccbandsenergy916"            "fbodyaccbandsenergy1724"          
[322] "fbodyaccbandsenergy2532"           "fbodyaccbandsenergy3340"           "fbodyaccbandsenergy4148"          
[325] "fbodyaccbandsenergy4956"           "fbodyaccbandsenergy5764"           "fbodyaccbandsenergy116"           
[328] "fbodyaccbandsenergy1732"           "fbodyaccbandsenergy3348"           "fbodyaccbandsenergy4964"          
[331] "fbodyaccbandsenergy124"            "fbodyaccbandsenergy2548"           "fbodyaccbandsenergy18"            
[334] "fbodyaccbandsenergy916"            "fbodyaccbandsenergy1724"           "fbodyaccbandsenergy2532"          
[337] "fbodyaccbandsenergy3340"           "fbodyaccbandsenergy4148"           "fbodyaccbandsenergy4956"          
[340] "fbodyaccbandsenergy5764"           "fbodyaccbandsenergy116"            "fbodyaccbandsenergy1732"          
[343] "fbodyaccbandsenergy3348"           "fbodyaccbandsenergy4964"           "fbodyaccbandsenergy124"           
[346] "fbodyaccbandsenergy2548"           "fbodyaccjerkmeanx"                 "fbodyaccjerkmeany"                
[349] "fbodyaccjerkmeanz"                 "fbodyaccjerkstdx"                  "fbodyaccjerkstdy"                 
[352] "fbodyaccjerkstdz"                  "fbodyaccjerkmadx"                  "fbodyaccjerkmady"                 
[355] "fbodyaccjerkmadz"                  "fbodyaccjerkmaxx"                  "fbodyaccjerkmaxy"                 
[358] "fbodyaccjerkmaxz"                  "fbodyaccjerkminx"                  "fbodyaccjerkminy"                 
[361] "fbodyaccjerkminz"                  "fbodyaccjerksma"                   "fbodyaccjerkenergyx"              
[364] "fbodyaccjerkenergyy"               "fbodyaccjerkenergyz"               "fbodyaccjerkiqrx"                 
[367] "fbodyaccjerkiqry"                  "fbodyaccjerkiqrz"                  "fbodyaccjerkentropyx"             
[370] "fbodyaccjerkentropyy"              "fbodyaccjerkentropyz"              "fbodyaccjerkmaxindsx"             
[373] "fbodyaccjerkmaxindsy"              "fbodyaccjerkmaxindsz"              "fbodyaccjerkmeanfreqx"            
[376] "fbodyaccjerkmeanfreqy"             "fbodyaccjerkmeanfreqz"             "fbodyaccjerkskewnessx"            
[379] "fbodyaccjerkkurtosisx"             "fbodyaccjerkskewnessy"             "fbodyaccjerkkurtosisy"            
[382] "fbodyaccjerkskewnessz"             "fbodyaccjerkkurtosisz"             "fbodyaccjerkbandsenergy18"        
[385] "fbodyaccjerkbandsenergy916"        "fbodyaccjerkbandsenergy1724"       "fbodyaccjerkbandsenergy2532"      
[388] "fbodyaccjerkbandsenergy3340"       "fbodyaccjerkbandsenergy4148"       "fbodyaccjerkbandsenergy4956"      
[391] "fbodyaccjerkbandsenergy5764"       "fbodyaccjerkbandsenergy116"        "fbodyaccjerkbandsenergy1732"      
[394] "fbodyaccjerkbandsenergy3348"       "fbodyaccjerkbandsenergy4964"       "fbodyaccjerkbandsenergy124"       
[397] "fbodyaccjerkbandsenergy2548"       "fbodyaccjerkbandsenergy18"         "fbodyaccjerkbandsenergy916"       
[400] "fbodyaccjerkbandsenergy1724"       "fbodyaccjerkbandsenergy2532"       "fbodyaccjerkbandsenergy3340"      
[403] "fbodyaccjerkbandsenergy4148"       "fbodyaccjerkbandsenergy4956"       "fbodyaccjerkbandsenergy5764"      
[406] "fbodyaccjerkbandsenergy116"        "fbodyaccjerkbandsenergy1732"       "fbodyaccjerkbandsenergy3348"      
[409] "fbodyaccjerkbandsenergy4964"       "fbodyaccjerkbandsenergy124"        "fbodyaccjerkbandsenergy2548"      
[412] "fbodyaccjerkbandsenergy18"         "fbodyaccjerkbandsenergy916"        "fbodyaccjerkbandsenergy1724"      
[415] "fbodyaccjerkbandsenergy2532"       "fbodyaccjerkbandsenergy3340"       "fbodyaccjerkbandsenergy4148"      
[418] "fbodyaccjerkbandsenergy4956"       "fbodyaccjerkbandsenergy5764"       "fbodyaccjerkbandsenergy116"       
[421] "fbodyaccjerkbandsenergy1732"       "fbodyaccjerkbandsenergy3348"       "fbodyaccjerkbandsenergy4964"      
[424] "fbodyaccjerkbandsenergy124"        "fbodyaccjerkbandsenergy2548"       "fbodygyromeanx"                   
[427] "fbodygyromeany"                    "fbodygyromeanz"                    "fbodygyrostdx"                    
[430] "fbodygyrostdy"                     "fbodygyrostdz"                     "fbodygyromadx"                    
[433] "fbodygyromady"                     "fbodygyromadz"                     "fbodygyromaxx"                    
[436] "fbodygyromaxy"                     "fbodygyromaxz"                     "fbodygyrominx"                    
[439] "fbodygyrominy"                     "fbodygyrominz"                     "fbodygyrosma"                     
[442] "fbodygyroenergyx"                  "fbodygyroenergyy"                  "fbodygyroenergyz"                 
[445] "fbodygyroiqrx"                     "fbodygyroiqry"                     "fbodygyroiqrz"                    
[448] "fbodygyroentropyx"                 "fbodygyroentropyy"                 "fbodygyroentropyz"                
[451] "fbodygyromaxindsx"                 "fbodygyromaxindsy"                 "fbodygyromaxindsz"                
[454] "fbodygyromeanfreqx"                "fbodygyromeanfreqy"                "fbodygyromeanfreqz"               
[457] "fbodygyroskewnessx"                "fbodygyrokurtosisx"                "fbodygyroskewnessy"               
[460] "fbodygyrokurtosisy"                "fbodygyroskewnessz"                "fbodygyrokurtosisz"               
[463] "fbodygyrobandsenergy18"            "fbodygyrobandsenergy916"           "fbodygyrobandsenergy1724"         
[466] "fbodygyrobandsenergy2532"          "fbodygyrobandsenergy3340"          "fbodygyrobandsenergy4148"         
[469] "fbodygyrobandsenergy4956"          "fbodygyrobandsenergy5764"          "fbodygyrobandsenergy116"          
[472] "fbodygyrobandsenergy1732"          "fbodygyrobandsenergy3348"          "fbodygyrobandsenergy4964"         
[475] "fbodygyrobandsenergy124"           "fbodygyrobandsenergy2548"          "fbodygyrobandsenergy18"           
[478] "fbodygyrobandsenergy916"           "fbodygyrobandsenergy1724"          "fbodygyrobandsenergy2532"         
[481] "fbodygyrobandsenergy3340"          "fbodygyrobandsenergy4148"          "fbodygyrobandsenergy4956"         
[484] "fbodygyrobandsenergy5764"          "fbodygyrobandsenergy116"           "fbodygyrobandsenergy1732"         
[487] "fbodygyrobandsenergy3348"          "fbodygyrobandsenergy4964"          "fbodygyrobandsenergy124"          
[490] "fbodygyrobandsenergy2548"          "fbodygyrobandsenergy18"            "fbodygyrobandsenergy916"          
[493] "fbodygyrobandsenergy1724"          "fbodygyrobandsenergy2532"          "fbodygyrobandsenergy3340"         
[496] "fbodygyrobandsenergy4148"          "fbodygyrobandsenergy4956"          "fbodygyrobandsenergy5764"         
[499] "fbodygyrobandsenergy116"           "fbodygyrobandsenergy1732"          "fbodygyrobandsenergy3348"         
[502] "fbodygyrobandsenergy4964"          "fbodygyrobandsenergy124"           "fbodygyrobandsenergy2548"         
[505] "fbodyaccmagmean"                   "fbodyaccmagstd"                    "fbodyaccmagmad"                   
[508] "fbodyaccmagmax"                    "fbodyaccmagmin"                    "fbodyaccmagsma"                   
[511] "fbodyaccmagenergy"                 "fbodyaccmagiqr"                    "fbodyaccmagentropy"               
[514] "fbodyaccmagmaxinds"                "fbodyaccmagmeanfreq"               "fbodyaccmagskewness"              
[517] "fbodyaccmagkurtosis"               "fbodybodyaccjerkmagmean"           "fbodybodyaccjerkmagstd"           
[520] "fbodybodyaccjerkmagmad"            "fbodybodyaccjerkmagmax"            "fbodybodyaccjerkmagmin"           
[523] "fbodybodyaccjerkmagsma"            "fbodybodyaccjerkmagenergy"         "fbodybodyaccjerkmagiqr"           
[526] "fbodybodyaccjerkmagentropy"        "fbodybodyaccjerkmagmaxinds"        "fbodybodyaccjerkmagmeanfreq"      
[529] "fbodybodyaccjerkmagskewness"       "fbodybodyaccjerkmagkurtosis"       "fbodybodygyromagmean"             
[532] "fbodybodygyromagstd"               "fbodybodygyromagmad"               "fbodybodygyromagmax"              
[535] "fbodybodygyromagmin"               "fbodybodygyromagsma"               "fbodybodygyromagenergy"           
[538] "fbodybodygyromagiqr"               "fbodybodygyromagentropy"           "fbodybodygyromagmaxinds"          
[541] "fbodybodygyromagmeanfreq"          "fbodybodygyromagskewness"          "fbodybodygyromagkurtosis"         
[544] "fbodybodygyrojerkmagmean"          "fbodybodygyrojerkmagstd"           "fbodybodygyrojerkmagmad"          
[547] "fbodybodygyrojerkmagmax"           "fbodybodygyrojerkmagmin"           "fbodybodygyrojerkmagsma"          
[550] "fbodybodygyrojerkmagenergy"        "fbodybodygyrojerkmagiqr"           "fbodybodygyrojerkmagentropy"      
[553] "fbodybodygyrojerkmagmaxinds"       "fbodybodygyrojerkmagmeanfreq"      "fbodybodygyrojerkmagskewness"     
[556] "fbodybodygyrojerkmagkurtosis"      "angletbodyaccmeangravity"          "angletbodyaccjerkmeangravitymean" 
[559] "angletbodygyromeangravitymean"     "angletbodygyrojerkmeangravitymean" "anglexgravitymean"                
[562] "angleygravitymean"                 "anglezgravitymean"
[564]     "bodyaccxentry1" ..."bodyaccxentry128" 
[692]     "bodyaccyentry1" ..."bodyaccyentry128"
[820]     "bodyacczentry1" ..."bodyacczentry128"
[948]     "bodygyroxentry1"..."bodygyroxentry128"
[1076]    "bodygyroyentry1"..."bodygyroyentry128"
[1204]    "bodygyrozentry1"..."bodygyrozentry128"
[1332]    "totalaccxentry1"..."totalaccxentry128"
[1460]    "totalaccyentry1"..."totalaccyentry128"
[1588]    "totalacczentry1"..."totalacczentry128"
```
**which adds up to a total of 1715 variables**

**A subset of the Final table is given below:**

```{r}
    subject          activity tbodyaccmeanx tbodyaccmeany tbodyaccmeanz tbodyaccstdx tbodyaccstdy tbodyaccstdz
c         1           walking     0.2773308  -0.017383819    -0.1111481  -0.28374026  0.114461337  -0.26002790
c1        1   walkingupstairs     0.2554617  -0.023953149    -0.0973020  -0.35470802 -0.002320265  -0.01947924
c2        1 walkingdownstairs     0.2891883  -0.009918505    -0.1075662   0.03003534 -0.031935943  -0.23043421
c3        1           sitting     0.2612376  -0.001308288    -0.1045442  -0.97722901 -0.922618642  -0.93958629
c4        1          standing     0.2789176  -0.016137590    -0.1106018  -0.99575990 -0.973190056  -0.97977588
c5        1            laying     0.2215982  -0.040513953    -0.1132036  -0.92805647 -0.836827405  -0.82606140
c6        2           walking     0.2764266  -0.018594920    -0.1055004  -0.42364284 -0.078091253  -0.42525752
c7        2   walkingupstairs     0.2471648  -0.021412113    -0.1525139  -0.30437641  0.108027280  -0.11212102
c8        2 walkingdownstairs     0.2776153  -0.022661416    -0.1168129   0.04636668  0.262881791  -0.10283791
c9        2           sitting     0.2770874  -0.015687994    -0.1092183  -0.98682228 -0.950704500  -0.95982817
c10       2          standing     0.2779115  -0.018420827    -0.1059085  -0.98727189 -0.957304990  -0.94974185
c11       2            laying     0.2813734  -0.018158740    -0.1072456  -0.97405946 -0.980277399  -0.98423330
c12       3           walking     0.2755675  -0.017176784    -0.1126749  -0.36035673 -0.069914065  -0.38741199
c13       3   walkingupstairs     0.2608199  -0.032410941    -0.1100649  -0.31312344  0.011628081  -0.36975460
c14       3 walkingdownstairs     0.2924235  -0.019355408    -0.1161398  -0.05741005 -0.033150373  -0.36224024
```

