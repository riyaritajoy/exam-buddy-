shinyServer(
  function(input, output) {
    
    output$text1 <- renderText({
      paste("Total number of kilometers to travel", input$km)
    })
    
    output$text2 <- renderText({
      paste("Available diesel in the vehicle", input$diesel)
    })
    output$text3 <- renderText({
      preds <- predict(model,newdata=data.frame(km.travel=input$km,current.diesel=input$diesel)) 
      paste("Cost for remaining fuel is",preds)
      
    })
    #Import Library
    #install.packages('e1071')
    require(e1071) #Contains the SVM 
    Train <- read.csv(file="se.csv", header=TRUE, sep=",")
    #Test <- read.csv(file="mathewtest.csv", header=TRUE, sep=",")
    # there are various options associated with SVM training; like changing kernel, gamma and C value.
    # create model
    model <- svm(Prediction~km.travel+current.diesel,data=Train,kernel='linear',gamma=0.2,cost=10)
    
    #Predict Output
    #preds1 <- predict(model,Test) #This predict whole file in our case mathewtest.csv file
    #preds1
    
    #plot(model,Train)
    
    #summary(model)
    
    #cross validation 
    #tune.output<-tune(svm,Prediction~.,data=Train,kernel="linear",ranges = list(cost=c(.001,0.01,0.1,1,5,10,15,50,100)))
    #summary(tune.output)
    #bestmodel<-tune.output$best.model
    
  }
)