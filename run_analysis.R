library(dplyr)
xtrain<- read.table("X_train.txt")
#read activities practiced in xtrain
ytrain<- read.table("y_train.txt")
activity_labels<- read.table("activity_labels.txt")
yltrain<-merge(ytrain, activity_labels, by.x="V1", by.y="V1")
feat<-read.table("features.txt")
#assign the labels of measures to xtrain columns
colnames(xtrain)<-feat$V2
#read the column of subject identifiers for xtrain
subtrain<-read.table("subject_train.txt")
xtrain$subject_id <- subtrain$V1
xtrain$activity_id <- yltrain$V1
xtrain$activity_label <- yltrain$V2
#Delete strange characters in column names
names(xtrain) <-gsub("-", "", names(xtrain))
names(xtrain) <-gsub("\\,", "", names(xtrain))
names(xtrain) <-gsub("\\(", "", names(xtrain))
names(xtrain) <-gsub("\\)", "", names(xtrain))
#
##read and merge the Inertial Signals files with the main file
#1
bgztr<-read.table("body_gyro_z_train.txt")
bgztr$index <-seq(from=1, to=7352)
##compute Mean of Inertial Signals
bgztr$mean_bgzt<- rowMeans(bgztr)
xtrain$index <-seq(from=1, to=7352)
mxtrain<-merge(xtrain,bgztr, by.x="index", by.y="index")
#2
taxtr<-read.table("total_acc_x_train.txt")
#
taxtr$index <-seq(from=1, to=7352)
##compute Mean of Inertial Signals
taxtr$mean_taxt<- rowMeans(taxtr)
mxtrain<-merge(mxtrain,taxtr, by.x="index", by.y="index")
#3
taytr<-read.table("total_acc_y_train.txt")
#
taytr$index <-seq(from=1, to=7352)
##compute Mean of Inertial Signals
taytr$mean_tayt<- rowMeans(taytr)
mxtrain<-merge(mxtrain,taytr, by.x="index", by.y="index")
#4
taztr<-read.table("total_acc_z_train.txt")
#
taztr$index <-seq(from=1, to=7352)
##compute Mean of Inertial Signals
taztr$mean_tazt<- rowMeans(taztr)
mxtrain<-merge(mxtrain,taztr, by.x="index", by.y="index")
#5
baztr<-read.table("body_acc_z_train.txt")
#
baztr$index <-seq(from=1, to=7352)
baztr$mean_bazt<- rowMeans(baztr)
mxtrain<-merge(mxtrain,baztr, by.x="index", by.y="index")
#6
bgxtr<-read.table("body_gyro_x_train.txt")
#
bgxtr$index <-seq(from=1, to=7352)
bgxtr$mean_bgxt<- rowMeans(bgxtr)
mxtrain<-merge(mxtrain,bgxtr, by.x="index", by.y="index")
#7
bgytr<-read.table("body_gyro_y_train.txt")
#
bgytr$index <-seq(from=1, to=7352)
bgytr$mean_bgyt<- rowMeans(bgytr)
mxtrain<-merge(mxtrain,bgytr, by.x="index", by.y="index")
#8
baxtr<-read.table("body_acc_x_train.txt")
#
baxtr$index <-seq(from=1, to=7352)
baxtr$mean_baxt<- rowMeans(baxtr)
mxtrain<-merge(mxtrain,baxtr, by.x="index", by.y="index")
#9
baytr<-read.table("body_acc_y_train.txt")
#
baytr$index <-seq(from=1, to=7352)
baytr$mean_bayt<- rowMeans(baytr)
mxtrain<-merge(mxtrain,baytr, by.x="index", by.y="index")
mxtrain$activity_type <- c("train")
############
#Processing of TEST DATA
# # # # # # #
xtest<- read.table("X_test.txt")
#read activities practiced in xtest
ytest<- read.table("y_test.txt")
yltest<-merge(ytest, activity_labels, by.x="V1", by.y="V1")
#assign the labels of measures to xtest columns
colnames(xtest)<-feat$V2
#read the column of subject identifiers for xtest
subtest<-read.table("subject_test.txt")
xtest$subject_id <- subtest$V1
xtest$activity_id <- yltest$V1
xtest$activity_label <- yltest$V2
#Delete strange characters in column names
names(xtest) <-gsub("-", "", names(xtest))
names(xtest) <-gsub("\\(", "", names(xtest))
names(xtest) <-gsub("\\)", "", names(xtest))
names(xtest) <-gsub("\\,", "", names(xtest))
#
###Read and merge the Inertial Signals
#1
bgzts<-read.table("body_gyro_z_test.txt")
#
bgzts$index <-seq(from=1, to=2947)
bgzts$mean_bgzt<- rowMeans(bgzts)
xtest$index <-seq(from=1, to=2947)
mxtest<-merge(xtest,bgzts, by.x="index", by.y="index")
#2
taxts<-read.table("total_acc_x_test.txt")
#
taxts$index <-seq(from=1, to=2947)
taxts$mean_taxt<- rowMeans(taxts)
mxtest<-merge(mxtest,taxts, by.x="index", by.y="index")
#3
tayts<-read.table("total_acc_y_test.txt")
tayts$index <-seq(from=1, to=2947)
tayts$mean_tayt<- rowMeans(tayts)
#n
mxtest<-merge(mxtest,tayts, by.x="index", by.y="index")
#4
tazts<-read.table("total_acc_z_test.txt")
#
tazts$index <-seq(from=1, to=2947)
tazts$mean_tazt<- rowMeans(tazts)
mxtest<-merge(mxtest,tazts, by.x="index", by.y="index")
#5
bazts<-read.table("body_acc_z_test.txt")
#
bazts$index <-seq(from=1, to=2947)
bazts$mean_bazt<- rowMeans(bazts)
#
mxtest<-merge(mxtest,bazts, by.x="index", by.y="index")
#6
bgxts<-read.table("body_gyro_x_test.txt")
#
bgxts$index <-seq(from=1, to=2947)
bgxts$mean_bgxt<- rowMeans(bgxts)
#
mxtest<-merge(mxtest,bgxts, by.x="index", by.y="index")
#7
bgyts<-read.table("body_gyro_y_test.txt")
#
bgyts$index <-seq(from=1, to=2947)
bgyts$mean_bgyt<- rowMeans(bgyts)
#
mxtest<-merge(mxtest,bgyts, by.x="index", by.y="index")
#8
baxts<-read.table("body_acc_x_test.txt")
#
baxts$index <-seq(from=1, to=2947)
baxts$mean_baxt<- rowMeans(baxts)
#
mxtest<-merge(mxtest,baxts, by.x="index", by.y="index")
#9
bayts<-read.table("body_acc_y_test.txt")
#
bayts$index <-seq(from=1, to=2947)
bayts$mean_bayt<- rowMeans(bayts)
mxtest<-merge(mxtest,bayts, by.x="index", by.y="index")
### Add a colume activity_type
mxtest$activity_type <- c("test")
concat<- rbind(mxtrain, mxtest)
#  
concat <- concat[ , !duplicated(colnames(concat))]
xtract<-select(concat, index, subject_id, activity_id, activity_label, activity_type, contains("mean", ignore.case=TRUE), contains("std"))
xtract <-rename(xtract, mean_body_gyro_z=mean_bgzt, mean_total_acc_x = mean_taxt, mean_total_acc_y = mean_tayt, mean_total_acc_z = mean_tazt, mean_body_acc_z = mean_bazt, mean_body_gyro_x= mean_bgxt, mean_body_gyro_y = mean_bgyt, mean_body_acc_x = mean_baxt, mean_body_acc_y = mean_bayt)
names(xtract) <-gsub("BodyBody", "Body", names(xtract))
names(xtract) <-gsub("Mag", "Magnitude", names(xtract))
names(xtract) <-gsub("Gyro", "Gyroscopic", names(xtract))
result<- group_by(xtract, activity_type, activity_label, subject_id)
last_result<- summarize(result,mean(tBodyAccmeanX)                          
                        ,mean(tBodyAccmeanY)                           ,mean(tBodyAccmeanZ)                          
                        ,mean(tGravityAccmeanX)                        ,mean(tGravityAccmeanY)                       
                        ,mean(tGravityAccmeanZ),mean(tBodyAccJerkmeanX)                      
                        ,mean(tBodyAccJerkmeanY)                       ,mean(tBodyAccJerkmeanZ)                      
                        ,mean(tBodyGyroscopicmeanX),mean(tBodyGyroscopicmeanY)                   
                        ,mean(tBodyGyroscopicmeanZ)                    ,mean(tBodyGyroscopicJerkmeanX)                 ,mean(tBodyGyroscopicJerkmeanY)                ,mean(tBodyGyroscopicJerkmeanZ)               ,mean(tBodyAccMagnitudemean)                   ,mean(tGravityAccMagnitudemean)               
                        ,mean(tBodyAccJerkMagnitudemean)      ,mean(tBodyGyroscopicMagnitudemean)        
                        ,mean(tBodyGyroscopicJerkMagnitudemean)        ,mean(fBodyAccmeanX)                          
                        ,mean(fBodyAccmeanY)                           ,mean(fBodyAccmeanZ)                          
                        ,mean(fBodyAccmeanFreqX)                       ,mean(fBodyAccmeanFreqY)                      
                        ,mean(fBodyAccmeanFreqZ)                       ,mean(fBodyAccJerkmeanX)                      
                        ,mean(fBodyAccJerkmeanY)                       ,mean(fBodyAccJerkmeanZ)                      
                        ,mean(fBodyAccJerkmeanFreqX)                   ,mean(fBodyAccJerkmeanFreqY)                  
                        ,mean(fBodyAccJerkmeanFreqZ)                   ,mean(fBodyGyroscopicmeanX)                   
                        ,mean(fBodyGyroscopicmeanY)                    ,mean(fBodyGyroscopicmeanZ)                   
                        ,mean(fBodyGyroscopicmeanFreqX)           ,mean(fBodyGyroscopicmeanFreqY)               
                        ,mean(fBodyGyroscopicmeanFreqZ)                ,mean(fBodyAccMagnitudemean)                  
                        ,mean(fBodyAccMagnitudemeanFreq)               ,mean(fBodyAccJerkMagnitudemean)              
                        ,mean(fBodyAccJerkMagnitudemeanFreq),mean(fBodyGyroscopicMagnitudemean)           
                        ,mean(fBodyGyroscopicMagnitudemeanFreq)        ,mean(fBodyGyroscopicJerkMagnitudemean)       
                        ,mean(fBodyGyroscopicJerkMagnitudemeanFreq)    ,mean(angletBodyAccMeangravity)               
                        ,mean(angletBodyAccJerkMeangravityMean)          ,mean(angletBodyGyroscopicMeangravityMean)    
                        ,mean(angletBodyGyroscopicJerkMeangravityMean) ,mean(angleXgravityMean)                      
                        ,mean(angleYgravityMean)                       ,mean(angleZgravityMean)                      
                        ,mean(mean_body_gyro_z)                        ,mean(mean_total_acc_x)                       
                        ,mean(mean_total_acc_y)                        ,mean(mean_total_acc_z)                       
                        ,mean(mean_body_acc_z)                         ,mean(mean_body_gyro_x)                       
                        ,mean(mean_body_gyro_y)                        ,mean(mean_body_acc_x)                        
                        ,mean(mean_body_acc_y)                         ,mean(tBodyAccstdX)                           
                        ,mean(tBodyAccstdY)                            ,mean(tBodyAccstdZ)                           
                        ,mean(tGravityAccstdX)                         ,mean(tGravityAccstdY)                        
                        ,mean(tGravityAccstdZ)                         ,mean(tBodyAccJerkstdX)                       
                        ,mean(tBodyAccJerkstdY)                        ,mean(tBodyAccJerkstdZ)                       
                        ,mean(tBodyGyroscopicstdX)                     ,mean(tBodyGyroscopicstdY)                    
                        ,mean(tBodyGyroscopicstdZ)                     ,mean(tBodyGyroscopicJerkstdX)                
                        ,mean(tBodyGyroscopicJerkstdY)                 ,mean(tBodyGyroscopicJerkstdZ)                
                        ,mean(tBodyAccMagnitudestd)                    ,mean(tGravityAccMagnitudestd)                
                        ,mean(tBodyAccJerkMagnitudestd)                ,mean(tBodyGyroscopicMagnitudestd)            
                        ,mean(tBodyGyroscopicJerkMagnitudestd)         ,mean(fBodyAccstdX)                           
                        ,mean(fBodyAccstdY)                            ,mean(fBodyAccstdZ)                           
                        ,mean(fBodyAccJerkstdX)                        ,mean(fBodyAccJerkstdY)                       
                        ,mean(fBodyAccJerkstdZ)                        ,mean(fBodyGyroscopicstdX)                    
                        ,mean(fBodyGyroscopicstdY)                     ,mean(fBodyGyroscopicstdZ)                    
                        ,mean(fBodyAccMagnitudestd)                    ,mean(fBodyAccJerkMagnitudestd)               
                        ,mean(fBodyGyroscopicMagnitudestd)             ,mean(fBodyGyroscopicJerkMagnitudestd)
)
write.table(last_result, file="result.txt", row.names = FALSE)
