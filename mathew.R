#Import Library
#install.packages('e1071')
require(e1071) #Contains the SVM 
Train <- read.csv(file="WT(mp).csv", header=TRUE, sep=",")
Test <- read.csv(file="mathewtest.csv", header=TRUE, sep=",")
# there are various options associated with SVM training; like changing kernel, gamma and C value.
# create model
model <- svm(Prediction~Pages.written+Hours.studied,data=Train,kernel='linear',gamma=0.2,cost=10)

#Predict Output
preds1 <- predict(model,Test) #This predict whole file in our case mathewtest.csv file
preds1
preds <- predict(model,newdata=data.frame(Pages.written=23,Hours.studied=17)) #By this u can predict for some values by replacing the value of Pages.written and Hours.studied  
preds
plot(model,Train)

summary(model)

#cross validation 
tune.output<-tune(svm,Prediction~.,data=Train,kernel="linear",ranges = list(cost=c(.001,0.01,0.1,1,5,10,15,50,100)))
summary(tune.output)
bestmodel<-tune.output$best.model