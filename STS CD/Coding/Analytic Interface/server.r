library(shiny)
library(shinydashboard)

shinyServer(function(input,output){
  
 
 #eruptions    
  
  # output$Histogram <- renderPlot({
  #   
  #   hist(faithful$eruptions, breaks = input$bins)
  # })
  # 
  
  output$welcome <- renderText({
       
       paste("WELCOME TO SMART TRANSIT SYSTEM")
     })
  
  
#------------------------------------------full hist-------------------------------------------------------------------------- 
  
 output$hist17d <- renderPlot({
 # hist(analysis$busnum,breaks=input$busro)
   
   forsim<-read.csv("tacsv123.csv",nrows=111)
   forsim<-tail(forsim,n=112)
   
   
   ggplot(data=forsim,aes(x=dates,y=count,color=segment,size=busnum)) + geom_point()
   
})
  
#-------------------------------to see Data---------------------------------------------------------------------------------- 
  
  output$input_file<-renderTable({
    file_to_read=input$File
    if(is.null(file_to_read)){
     return()
    }
    
    read.table(file_to_read$datapath,sep=input$sep,header=input$header)
  
    })
#------------------------------------------------------------------------------------------------------------------------------- 
  
  #output$segdata<-renderPlot({
   # segfilter<-subset(sts,sts$seg==input$inseg)
  #  hist(segfilter,breaks=input$inseg)
    
 # })
  
    
    
    
    
    # #START ARIMA
    # 
    # output$plot1<-renderPlot({
    #   # paste(input$selectInput)
    #   data = read.csv('http://ucanalytics.com/blogs/wp-content/uploads/2015/06/Tractor-Sales.csv')
    #   data = ts(data[,2],start = c(2003,1),frequency = 12)
    #   plot(data, xlab='Years', ylab = 'Tractor Sales')
    #   
    # })
    # 
    # output$plot2 <- renderPlot({
    #   plot(diff(data),ylab='Differenced Tractor Sales')
    # })
    # 
    # output$plot3 <- renderPlot({
    #   plot(log10(data),ylab='Log (Tractor Sales)')
    # })
    # 
    # output$plot4 <- renderPlot({
    #   plot(diff(log10(data)),ylab='Differenced Log (Tractor Sales)')
    # })
    # 
    # 
    # output$plot5 <- renderPlot({
    #   par(mfrow = c(1,2))
    #   acf(ts(diff(log10(data))),main='ACF Tractor Sales')
    # })
    # 
    # output$plot6 <- renderPlot({
    #   pacf(ts(diff(log10(data))),main='PACF Tractor Sales')
    # })
    # 
    # output$plot7 <- renderPlot({
    #   #best fit identification
    #   #install.packages("forecast")
    #   require(forecast)
    #   ARIMAfit = auto.arima(log10(data), approximation=FALSE,trace=FALSE)
    #   par(mfrow = c(1,1))
    #   pred = predict(ARIMAfit, n.ahead = 36)
    #   
    #   plot(data,type='l',xlim=c(2004,2018),ylim=c(1,1600),xlab = 'Year',ylab = 'Tractor Sales')
    # })
    # 
    # output$plot8 <- renderPlot({
    #   lines(10^(pred$pred),col='blue')
    # })
    # 
    # output$plot9 <- renderPlot({
    #   lines(10^(pred$pred+2*pred$se),col='orange')
    # })
    # 
    # output$plot10 <- renderPlot({
    #   lines(10^(pred$pred-2*pred$se),col='orange')
    # })
    # 
    # #Plot ACF and PACF for residuals of ARIMA model to ensure no more information is left for extraction
    # output$plot11 <- renderPlot({
    #   par(mfrow=c(1,2))
    #   acf(ts(ARIMAfit$residuals),main='ACF Residual')
    # })
    # 
    # 
    # output$plot12 <- renderPlot({
    #   pacf(ts(ARIMAfit$residuals),main='PACF Residual')
    # })
    # 
    # output$dis <- renderDataTable({})
    # #END ARIMA
  
  #---------------------------------------------------------------------------------------------------------------------------
    
    
#-------------------------------------------overall bus------------------------------------------------------------------------    
     output$plot1<-renderPlot({
       # paste(input$selectInput)
       data = read.csv('http://ucanalytics.com/blogs/wp-content/uploads/2015/06/Tractor-Sales.csv')
       data = ts(data[,2],start = c(2003,1),frequency = 12)
      # plot(data, xlab='Years', ylab = 'Tractor Sales')
      #   #best fit identification
       #install.packages("forecast")
       require(forecast)
       ARIMAfit = auto.arima(log10(data), approximation=FALSE,trace=FALSE)
       par(mfrow = c(1,1))
       pred = predict(ARIMAfit, n.ahead = 36)
       
       plot(data,type='l',xlim=c(2004,2018),ylim=c(1,1600),xlab = 'Year',ylab = 'Ticket')
   
      lines(10^(pred$pred),col='blue')
    
   
       lines(10^(pred$pred+2*pred$se),col='orange')
   
       lines(10^(pred$pred-2*pred$se),col='orange')
    
    
     })
    
#--------------------------------------------------------------------------------------------------------------------    
    
    # #FUTURE TEST
    # 
    # output$plot2<-renderPlot({
    #   # paste(input$selectInput)
    #   
    #   
    #  
    #   data = ts(data[,2],start = c(13,1),frequency = 4)
    #   plot(data, xlab='Days', ylab = 'Tickets Sold')
    #   
    #   
    #   #   #best fit identification
    #   #install.packages("forecast")
    #   require(forecast)
    #   ARIMAfit = auto.arima(log10(data), approximation=FALSE,trace=FALSE)
    #   par(mfrow = c(1,1))
    #   pred = predict(ARIMAfit, n.ahead = 36)
    #   lines(10^(pred$pred),col='blue')
    #   lines(10^(pred$pred+2*pred$se),col='orange')
    #   lines(10^(pred$pred-2*pred$se),col='orange')
    #   
    #   
    # })
    # 
    # 
    # 
    # 
    # 
    # output$plot3<-renderPlot({
    #   # paste(input$selectInput)
    #   
    #   
    #   
    #   data1 = ts(data1[,2],start = c(13,1),frequency = 4)
    #   plot(data1, xlab='Days', ylab = 'Tickets Sold')
    #   
    #   
    #   #   #best fit identification
    #   #install.packages("forecast")
    #   require(forecast)
    #   ARIMAfit = auto.arima(log10(data1), approximation=FALSE,trace=FALSE)
    #   par(mfrow = c(1,1))
    #   pred = predict(ARIMAfit, n.ahead = 36)
    #   lines(10^(pred$pred),col='blue')
    #   lines(10^(pred$pred+2*pred$se),col='orange')
    #   lines(10^(pred$pred-2*pred$se),col='orange')
    #   
    #   
    # })
    # 
    # 
    
    
 #------------------------------------------------------------------------------------------------------------ 
    output$plot2<-renderPlot({
      
    analysis<-read.csv("tacsv123.csv")
    colnames(analysis)<-c("busnum","dates","day","segment","count")
    #factor(analysis123$segment)
    analysis$segment<-factor(analysis$segment)
    
   # factor(analysis123$busnum)
   # analysis123$busnum<-factor(analysis123$busnum)
    
    data = analysis[which(analysis$busnum=='17D'),]
    data = data[,c(2,5)]
    data=tail(data,n=112)
    
    data = ts(data[,2],start = c(1,1),frequency = 4)
    
    require(forecast)
    ARIMAfit = auto.arima(log10(data), approximation=FALSE,trace=TRUE)
    par(mfrow = c(1,1))
    pred = predict(ARIMAfit, n.ahead = 36)
    
    plot(data,type='l',xlim=c(1,31),ylim=c(0,300),xlab = 'Days',ylab = 'Ticket Sales')
    lines(10^(pred$pred),col='blue')
    lines(10^(pred$pred+2*pred$se),col='red')
    lines(10^(pred$pred-2*pred$se),col='orange')
    })
    
#-------------------------------------------------------------------------------------------------------
    
    output$plot3<-renderPlot({
      
      analysis<-read.csv("tacsv123.csv")
      colnames(analysis)<-c("busnum","dates","day","segment","count")
      factor(analysis$segment)
      analysis$segment<-factor(analysis$segment)
      
      factor(analysis$busnum)
      analysis$busnum<-factor(analysis$busnum)
      
      data = analysis[which(analysis$busnum=='12G'),]
      data = data[,c(2,5)]
      
      data = ts(data[,2],start = c(1,1),frequency = 4)
      
      require(forecast)
      ARIMAfit = auto.arima(log10(data), approximation=FALSE,trace=FALSE)
      par(mfrow = c(1,1))
      pred = predict(ARIMAfit, n.ahead = 36)
      
      plot(data,type='l',xlim=c(1,31),ylim=c(100,800),xlab = 'Days',ylab = 'Ticket Sales')
      lines(10^(pred$pred),col='blue')
      lines(10^(pred$pred+2*pred$se),col='red')
      lines(10^(pred$pred-2*pred$se),col='orange')
    })
    
    
#----------------------------for count---------------------------------------------------------------------------------------
output$checking<-{(
 
   
  
  
  
  
  renderText({
    
    
    
    #prob1$Educ_recode<-as.numeric(prob1$Education==2)
  
    
    ds<-read.csv("tacsv123.csv",nrows=111)
    ds$day=factor(ds$day,levels=c('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
                  labels=c(1,2,3,4,5,6,7))
    #ds$segment=factor(ds$segment,levels=c('morn','noon','eve','night'),labels=c(1,2,3,4))
    
    ds$day<-as.numeric(as.character(ds$day))
    
    ds$segment=factor(ds$segment,levels=c('morn','noon','eve','night'),labels = c(1,2,3,4))
    ds$segment<-as.numeric(as.character(ds$segment))
    
    ds$busnum=factor(ds$busnum,levels=c('17D','12G'),labels = c(1,2))
    ds$busnum<-as.numeric(as.character(ds$busnum))
    
    
    pk= as.numeric(input$sec)
    pk1=as.numeric(input$dow)
    pk2=as.numeric(input$busno)
    
    ds=ds[which(ds$busnum==pk2),]
    ds=ds[which(ds$segment==pk),]
    ds=ds[,c(3,5)]
   
    
    require(caTools)
    require(randomForest)
    
    set.seed(1234)
    regressor=randomForest(x=ds[1],y=ds$count,ntree = 1000)
    
    ypred=predict(regressor,newdata = data.frame(day=pk1))
    
    paste( as.character(round(ypred/45)) )
    
    
    #paste(input$dow,input$sec)
    
    
    
    
    
    
    })
  
)}
  
  
  
#----------------------------------------------------------------------------------------------------------------------------  
  # 
  # data <- reactive({
  #   dow <- switch(input$dow,
  #                  "Monday" = 1,
  #                 "Tuesday"=2,"Wednesday"=3,"Thursday"=4,"Friday"=5,"Saturday"=6,"Sunday"=7)
  #   
  #   dataset=ds[which(ds$segment=='morn'),]
  #   dataset=dataset[,c(3,5)]
  #   
  #   
  #   
  #   require(caTools)
  #   require(randomForest)
  #   set.seed(1234)
  #   regressor=randomForest(x=dataset[1],y=dataset$count,ntree = 1000)
  #   ypred=predict(regressor,newdata = data.frame(day=input$dow))
  # })
  # 
  # 
  # output$summary<-renderPrint({
  #   
  #   summary(ypred)
  #   
  # })
  # 
  # 
  # # runregression<-reactive({
  # #   
  # #   dataset=ds[which(ds$segment=='morn'),]
  # #   dataset=dataset[,c(3,5)]
  # #   
  # #   
  # #   require(caTools)
  # #   require(randomForest)
  # #   set.seed(1234)
  # #   regressor=randomForest(x=dataset[1],y=dataset$count,ntree = 1000)
  # #   ypred=predict(regressor,newdata = data.frame(day=pk))
  # # })
  # # 
  # 
  # # output$dayOutput<-renderPrint({
  # #   
  # #   # dataset=ds[which(ds$segment=='morn'),]
  # #   # dataset=dataset[,c(3,5)]
  # #  
  # #    
  # #   
  # #  pk=as.numeric(input$dayofweek)
  # #   
  # #   # require(caTools)
  # #   # require(randomForest)
  # #   
  # #   # set.seed(1234)
  # #   # regressor=randomForest(x=dataset[1],y=dataset$count,ntree = 1000)
  # #    
  # #   # ypred=predict(regressor,newdata = data.frame(day=pk))
  # #   
  # #   
  # #   if(!is.null(input$dayofweek)){
  # #     
  # #     pk=as.numeric(input$dayofweek)
  # #     paste(ypred)
  # #   }
  # #   else{
  # #     print(data.frame(Warning="Enter Coefficients"))
  # #   }
  # #   
  # #   paste(as.character(round(ypred/45)))
  # #   
  # #   
  # #   
  # # })
  #   
    
})