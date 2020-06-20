library(data.table)                                                                        #importing data.table lib
xtest <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/X_test.txt")      #fast reading the text file
ytest <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/y_test.txt")      #fast reading the text file
features <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/features.txt")      #fast reading the text file
tsub <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/subject_test.txt") #fast reading the text file


features <- features[,-1]                                                       #removing the extra numeric column
cnames <- data.frame()                                                          #empty data frame

for(i in 1:561){
  w <- tolower(gsub("[[:punct:]]", "", features[i]))                            #removes all special characters
  cnames <- rbind(cnames,w)
}

xtest <- t(cbind(cnames,data.frame(t(xtest))))                                  #back to normal by transposing again
colnames(xtest) <- as.character(unlist(xtest[1,]))                              #column name same as first row
xtest <- xtest[-1,]                                                             #deleting the first row

xtest <- cbind(ytest,xtest)                                                     #adding the activity column
xtest <- cbind(tsub,xtest)                                                      #adding the subject column
colnames(xtest)[1:2] <- c("subject","activity")                                 #renaming

body1 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body2 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body3 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
body4 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body5 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body6 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
body7 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
body8 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
body9 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

xtest <- cbind(xtest,body1)                                                     #combining data one by one
colnames(xtest)[564:691] <- paste0(rep("bodyaccxentry",times=128),1:128)        #simultaneously renaming the colnames
xtest <- cbind(xtest,body2)
colnames(xtest)[692:819] <- paste0(rep("bodyaccyentry",times=128),1:128)
xtest <- cbind(xtest,body3)
colnames(xtest)[820:947] <- paste0(rep("bodyacczentry",times=128),1:128)
xtest <- cbind(xtest,body4)
colnames(xtest)[948:1075] <- paste0(rep("bodygyroxentry",times=128),1:128)
xtest <- cbind(xtest,body5)
colnames(xtest)[1076:1203] <- paste0(rep("bodygyroyentry",times=128),1:128)
xtest <- cbind(xtest,body6)
colnames(xtest)[1204:1331] <- paste0(rep("bodygyrozentry",times=128),1:128)
xtest <- cbind(xtest,body7)
colnames(xtest)[1332:1459] <- paste0(rep("totalaccxentry",times=128),1:128)
xtest <- cbind(xtest,body8)
colnames(xtest)[1460:1587] <- paste0(rep("totalaccyentry",times=128),1:128)
xtest <- cbind(xtest,body9)
colnames(xtest)[1588:1715] <- paste0(rep("totalaccyentry",times=128),1:128)


rm("body1")                                                                     #removing unnecessary vectors
rm("body2")
rm("body3")
rm("body4")
rm("body5")
rm("body6")
rm("body7")
rm("body8")
rm("body9")
rm("cnames")
rm("features")
rm("tsub")
rm("ytest")
rm("i")
rm("w")
print("retrieved test data. \n processing...")

xtrain <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/X_train.txt")     #fast reading the text file
ytrain <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/y_train.txt")     #fast reading the text file
features <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/features.txt")        #fast reading the text file
tsub <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/subject_train.txt") #fast reading the text file


features <- features[,-1]                                                       #removing the extra numeric column
cnames <- data.frame()                                                          #empty data frame

for(i in 1:561){
  w <- tolower(gsub("[[:punct:]]", "", features[i]))                            #removes all special characters
  cnames <- rbind(cnames,w)
}

xtrain <- t(cbind(cnames,data.frame(t(xtrain))))                                #back to normal by transposing again
colnames(xtrain) <- as.character(unlist(xtrain[1,]))                            #column name same as first row
xtrain <- xtrain[-1,]                                                           #deleting the first row

xtrain <- cbind(ytrain,xtrain)                                                  #adding the activity column
xtrain <- cbind(tsub,xtrain)                                                    #adding the subject column
colnames(xtrain)[1:2] <- c("subject","activity")                                #renaming

body1 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body2 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body3 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
body4 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body5 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body6 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
body7 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
body8 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
body9 <- fread("C:/Users/user/Desktop/SamSensorData/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

xtrain <- cbind(xtrain,body1)                                                   #combining data one by one
colnames(xtrain)[564:691] <- paste0(rep("bodyaccxentry",times=128),1:128)       #simultaneously renaming the colnames
xtrain <- cbind(xtrain,body2)
colnames(xtrain)[692:819] <- paste0(rep("bodyaccyentry",times=128),1:128)
xtrain <- cbind(xtrain,body3)
colnames(xtrain)[820:947] <- paste0(rep("bodyacczentry",times=128),1:128)
xtrain <- cbind(xtrain,body4)
colnames(xtrain)[948:1075] <- paste0(rep("bodygyroxentry",times=128),1:128)
xtrain <- cbind(xtrain,body5)
colnames(xtrain)[1076:1203] <- paste0(rep("bodygyroyentry",times=128),1:128)
xtrain <- cbind(xtrain,body6)
colnames(xtrain)[1204:1331] <- paste0(rep("bodygyrozentry",times=128),1:128)
xtrain <- cbind(xtrain,body7)
colnames(xtrain)[1332:1459] <- paste0(rep("totalaccxentry",times=128),1:128)
xtrain <- cbind(xtrain,body8)
colnames(xtrain)[1460:1587] <- paste0(rep("totalaccyentry",times=128),1:128)
xtrain <- cbind(xtrain,body9)
colnames(xtrain)[1588:1715] <- paste0(rep("totalacczentry",times=128),1:128)


rm("body1")                                                                     #removing unnecessary vectors
rm("body2")
rm("body3")
rm("body4")
rm("body5")
rm("body6")
rm("body7")
rm("body8")
rm("body9")
rm("cnames")
rm("features")
rm("tsub")
rm("ytrain")
rm("i")
rm("w")
print("retrieved train data. \n combining data...")

xtrain <- rbind(xtrain,xtest)                                                   #combining test and training data

xtrain$activity[xtrain$activity == 1] <- "walking"                              ###replacing numbers with their 
xtrain$activity[xtrain$activity == 2] <- "walkingupstairs"                        #respective activity names
xtrain$activity[xtrain$activity == 3] <- "walkingdownstairs"
xtrain$activity[xtrain$activity == 4] <- "sitting"
xtrain$activity[xtrain$activity == 5] <- "standing"
xtrain$activity[xtrain$activity == 6] <- "laying"

print("calculating mean...")

b <- c("walking","walkingupstairs","walkingdownstairs","sitting","standing","laying")     #a list of activities
final <- data.frame()
for(i in 1:30){
  for(j in b){
    r <- data.frame()
    r <- xtrain[xtrain$subject == i & xtrain$activity == j,]
    r <- r[,-(1:2)]
    t <- as.numeric(unlist(r))
    t <- data.frame(t)
    t <- lapply(r, function(x) {if(is.character(x)) as.numeric(as.character(x)) else x})
    t <- data.frame(t)
    c <- colMeans(t[sapply(t, is.numeric)])
    c <- data.frame(c)
    c <- t(c)
    c <- data.frame(c)
    final <- rbind(final,c)
    rm("r")
    rm("t")
    rm("c")
  }
}
pepe <- rep(c("walking","walkingupstairs","walkingdownstairs","sitting","standing","laying"),times = 30)
pepe <- data.frame(pepe)
popo <- rep(1:30,each = 6)
popo <- data.frame(popo)
final <- cbind(pepe,final)
final <- cbind(popo,final)
colnames(final)[1:2] <- c("subject","activity")
final[,1:5]

print("processed. \n creating text file...")

#write that down! write that down!
write.table(final,file = "c:/users/user/desktop/SamSensorData/sensormean.txt",row.name=FALSE)

print("text file created.")

