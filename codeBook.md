subject_id : id of each subject, given in subject_test.txtfor test data and in subject_train.txt for training data. These data have been added as a column to the test and train measures


Activity_id and activity_label come from  y_test.txt for tests and  y_train.txt for training data. They are as many as measures, so they are added as columns to the mesures

Features.txt gives the titles of each 561 measurement columns, it is integrated at the head of columns.

In order to get tidy data, « strange » characters like parenthesis, comma and cypher have been removed from the headers.

Each Inertial signals files have been merged to the main files (x_test and x_train) and their mean calculated for each row. They have been named :

mean(mean_body_gyro_z)                        ,
mean(mean_total_acc_x)                       
mean(mean_total_acc_y)                        ,
mean(mean_total_acc_z)                       
mean(mean_body_acc_z)                     
mean(mean_body_gyro_x)                       
mean(mean_body_gyro_y)                        ,
mean(mean_body_acc_x)                        
mean(mean_body_acc_y)

Then, after concatenation of training and testing data, The first dataset is obtained.

Then it is cleaned by extracting only the means and standard deviations, which are the following. 
The names of data is standardized : 
	- every measure starting with 't' is a time,  every measure starting with 'f' is a frequency.
	- Acc means acceleration
	- the ending of data with X, Y or Z means the measures have been made on X, Y or Z axis

Then the last operation of tidying has been to group data by activity_type, activity_label and subject_id, and compute the mean of each measures, which gave the following :

mean(tBodyAccmeanX)                          
mean(tBodyAccmeanY)                           ,
mean(tBodyAccmeanZ)                          
mean(tGravityAccmeanX)                        ,
mean(tGravityAccmeanY)                       
mean(tGravityAccmeanZ),
mean(tBodyAccJerkmeanX)                      
mean(tBodyAccJerkmeanY)                       ,
mean(tBodyAccJerkmeanZ)                      
mean(tBodyGyroscopicmeanX),
mean(tBodyGyroscopicmeanY)                   
mean(tBodyGyroscopicmeanZ)                    ,
mean(tBodyGyroscopicJerkmeanX)                 ,
mean(tBodyGyroscopicJerkmeanY)                
mean(tBodyGyroscopicJerkmeanZ)               ,
mean(tBodyAccMagnitudemean)                   
mean(tGravityAccMagnitudemean)               
mean(tBodyAccJerkMagnitudemean)      ,
mean(tBodyGyroscopicMagnitudemean)        
mean(tBodyGyroscopicJerkMagnitudemean)        ,
mean(fBodyAccmeanX)                          
mean(fBodyAccmeanY)                           ,
mean(fBodyAccmeanZ)                          
mean(fBodyAccmeanFreqX)                       ,
mean(fBodyAccmeanFreqY)                      
mean(fBodyAccmeanFreqZ)                       ,
mean(fBodyAccJerkmeanX)                      
mean(fBodyAccJerkmeanY)                       ,
mean(fBodyAccJerkmeanZ)                      
mean(fBodyAccJerkmeanFreqX)                   ,
mean(fBodyAccJerkmeanFreqY)                  
mean(fBodyAccJerkmeanFreqZ)                   ,
mean(fBodyGyroscopicmeanX)                   
mean(fBodyGyroscopicmeanY)                    ,
mean(fBodyGyroscopicmeanZ)                   
mean(fBodyGyroscopicmeanFreqX)           ,
mean(fBodyGyroscopicmeanFreqY)               
mean(fBodyGyroscopicmeanFreqZ)                ,
mean(fBodyAccMagnitudemean)                  
mean(fBodyAccMagnitudemeanFreq)               ,
mean(fBodyAccJerkMagnitudemean)              
mean(fBodyAccJerkMagnitudemeanFreq),
mean(fBodyGyroscopicMagnitudemean)           
mean(fBodyGyroscopicMagnitudemeanFreq)        mean(fBodyGyroscopicJerkMagnitudemean)       
mean(fBodyGyroscopicJerkMagnitudemeanFreq)    ,
mean(angletBodyAccMeangravity)               
mean(angletBodyAccJerkMeangravityMean)          mean(angletBodyGyroscopicMeangravityMean)    
mean(angletBodyGyroscopicJerkMeangravityMean) ,
mean(angleXgravityMean)                      
mean(angleYgravityMean)                       ,
mean(angleZgravityMean)                      
mean(mean_body_gyro_z)                        ,
mean(mean_total_acc_x)                       
mean(mean_total_acc_y)                        ,
mean(mean_total_acc_z)                       
mean(mean_body_acc_z)                         ,
mean(mean_body_gyro_x)                       
mean(mean_body_gyro_y)                        ,
mean(mean_body_acc_x)                        
mean(mean_body_acc_y)                         ,
mean(tBodyAccstdX)                           
mean(tBodyAccstdY)                            ,
mean(tBodyAccstdZ)                           
mean(tGravityAccstdX)                         ,
mean(tGravityAccstdY)                        
mean(tGravityAccstdZ)                         ,
mean(tBodyAccJerkstdX)                       
mean(tBodyAccJerkstdY)                        ,
mean(tBodyAccJerkstdZ)                       
mean(tBodyGyroscopicstdX)                     ,
mean(tBodyGyroscopicstdY)                    
mean(tBodyGyroscopicstdZ)                     ,
mean(tBodyGyroscopicJerkstdX)                
mean(tBodyGyroscopicJerkstdY)                 ,
mean(tBodyGyroscopicJerkstdZ)                
mean(tBodyAccMagnitudestd)                    ,
mean(tGravityAccMagnitudestd)                
mean(tBodyAccJerkMagnitudestd)                
mean(tBodyGyroscopicMagnitudestd)            
mean(tBodyGyroscopicJerkMagnitudestd)         ,
mean(fBodyAccstdX)                           
mean(fBodyAccstdY)                            ,
mean(fBodyAccstdZ)                           
mean(fBodyAccJerkstdX)                        ,
mean(fBodyAccJerkstdY)                       
mean(fBodyAccJerkstdZ)                        ,
mean(fBodyGyroscopicstdX)                    
mean(fBodyGyroscopicstdY)                     ,
mean(fBodyGyroscopicstdZ)                    
mean(fBodyAccMagnitudestd)                    ,
mean(fBodyAccJerkMagnitudestd)               
mean(fBodyGyroscopicMagnitudestd)             
mean(fBodyGyroscopicJerkMagnitudestd)
