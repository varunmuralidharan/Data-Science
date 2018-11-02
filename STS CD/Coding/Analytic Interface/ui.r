library(shiny)
#install.packages("shinydashboard")
library(shinydashboard)


setwd("E://Final Project and R shiny")

analysis<-read.csv("tacsv123.csv",nrows=111)
forsim<-read.csv("tacsv123.csv",nrows=111)

colnames(analysis)<-c("busnum","dates","day","segment","count")
factor(analysis$segment)
analysis$segment<-factor(analysis$segment)
factor(analysis$busnum)
analysis$busnum<-factor(analysis$busnum)


# data <- analysis[which(analysis$busnum=='17'),]
# data<- bus1[,c(2,4)]
# 
# data1 <- analysis[which(analysis$busnum=='12'),]
# data1<- bus1[,c(2,4)]

ds<-read.csv("tacsv123.csv",nrows=111)
ds$day=factor(ds$day,levels=c('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
              labels=c(1,2,3,4,5,6,7))
#ds$segment=factor(ds$segment,levels=c('morn','noon','eve','night'),labels=c(1,2,3,4))

ds$day<-as.numeric(as.character(ds$day))

ds$segment=factor(ds$segment,levels=c('morn','noon','eve','night'),labels = c(1,2,3,4))
ds$segment<-as.numeric(as.character(ds$segment))



library(ggplot2)



shinyUI(dashboardPage(
  
  dashboardHeader(title="SMART TRANSIT SYSTEM"),
  
  
  dashboardSidebar(
    
    sidebarMenu(
    menuItem("Dashboard",tabName = "dashboard",icon=icon("dashboard")),
      menuSubItem("Dashboard working",tabName = "work"),
    menuItem("Datasheet",tabName = "datafile"),
    
    
    
     menuItem("Overall Trend",tabName = "arima"),
     menuItem("Ticket trend of 17",tabName = "arima17"),
     menuItem("Ticket trend of 12",tabName = "arima12"),
     menuItem("Optimization",tabName = "tabfr17")
    
    
    #menuItem("segment for 17", tabName = "segday17")
    
    
    
    )),
  
#------------------------------------------Welcome Page---------------------------------------------------------------------  
  
  dashboardBody(
      tabItems(
        
        # tabItem(tabName = "dashboard", fluidRow(
        #   
        #    tabBox(
        #    tabPanel(title="Histogram",status = "primary",solidHeader = T, background = "aqua",
        #       plotOutput("Histogram")),
        #    tabPanel(title="control for Dashboard", status = "warning",solidHeader = T, background = "red",
        #        "use these controls to maintain your dashboard",br(),
        #        "Donot use lot of controls as it confuses the user",
        #        sliderInput("bins","number of breaks",1,100,50),
        #        textInput("textInput","Search Opportunities",value = "1234"))
        #    )
        #   )),
        
        tabItem(tabName = "dashboard",fluidRow(
          
          tabPanel("WELCOME",
                   textOutput("welcome"),
                   
          tags$img(src="blue_logo.png"))
          
          
          
        )),
        
 #-----------------------------------------------total requests----------------------------------------------------------------------------       
        tabItem(tabName = "work",fluidRow(
          tabBox(
            tabPanel(title="plot of requests", status = "primary",solidHeader = T,
            #radioButtons("busro","busroute",choices = c(17,12)),
            plotOutput("hist17d"))
            
            
            )
            
          )),
#---------------------------------------------Data seeing--------------------------------------------------------------------------------        
        tabItem(tabName = "datafile",fluidRow(
          tabBox(
            tabPanel(title="Dataset",status = "primary",solidHeader = T, background = "aqua",
                     fileInput("File","Upload the file"),
                     radioButtons("sep","seperator",choices = c(Comma=',',Period='.',Tilde='~',Minus='-')),
                     checkboxInput("header","Header included???"),
                     #fileInput('file', 'Choose CSV File',
                     #         accept=c('text/csv','text/comma-separated-values,text/plain','.csv')),
                     tableOutput("input_file"))
            
          )
          
        )),
        
        
       # #ARIMA tab
        # 
        # tabItem(tabName="arima", fluidRow(
        #   
        #   tabBox(
        #     
        #     tabsetPanel(
       
        #       tabPanel("Summary", dataTableOutput("dis")),
        #       tabPanel("Plot",
        #                # fluidRow(...)
        #                plotOutput("plot1"),
        #                plotOutput("plot2"),
        #                plotOutput("plot3"),
        #                plotOutput("plot4"),
        #                plotOutput("plot5"),
        #                plotOutput("plot6"),
        #                plotOutput("plot7"),
        #                plotOutput("plot8"),
        #                plotOutput("plot9"),
        #                plotOutput("plot10"),
        #                plotOutput("plot11"),
        #                plotOutput("plot12")
        #       )
        #     )
        #     
        #   )
        #   
        #   
        #   
        #   
        # ))
        #END arima tab
       
       
#-----------------------------------------For count functionality-----------------------------------------------------------------------------------       
       tabItem(tabName="tabfr17",fluidPage(
         
         # radioButtons("dow","for Day",
         #              c("Mon"="Monday","Tue"="Tuesday","Wed"="Wednesday","Thur"="Thursday","Fri"="Friday","Sat"="Saturday","Sun"="Sunday"))
                             
         radioButtons("dow","for Day of week",
                                   c("Mon"=1,"Tue"=2,"Wed"=3,"Thur"=4,"Fri"=5,"Sat"=6,"Sun"=7)),
         br(),
        
          radioButtons("busno","busnumber",
                      c("17D"=1,"12G"=2)),
         
         br(),
         
         radioButtons("sec","for segment of week",
                      c("morn"=1,"noon"=2,"eve"=3,"night"=4)),
         
                     submitButton("CHECK"),verbatimTextOutput("checking")
         
       )),
        
        
  #------------------------------------------------bus usage trend-----------------------------------------------------------------------
   tabItem(tabName="arima", fluidRow(
     
     tabBox(
       
       tabsetPanel(
  
         
         tabPanel("Plot",
                  # fluidRow(...)
                  plotOutput("plot1")
                  
         )
       )
     
     )
     
     
   )),
  
#------------------------------------------17 future----------------------------------------------------------------------
#FOR future
  
  tabItem(tabName="arima17", fluidRow(

    tabBox(

      tabsetPanel(


        tabPanel("Plot",
                 # fluidRow(...)
                 plotOutput("plot2")

        )
      )

    )


  )),

#--------------------------------------------12 future-----------------------------------------------------------------------  

  tabItem(tabName="arima12", fluidRow(

    tabBox(

      tabsetPanel(


        tabPanel("Plot",
                 # fluidRow(...)
                 plotOutput("plot3")

        )
      )

    )


  ))


# tabItem(tabName="segday17", fluidRow(
#   
#   tabBox(
#     
#     tabsetPanel(
#       
#       radioButtons("dow","for Day",
#                    c("Mon"="Monday","Tue"="Tuesday","Wed"="Wednesday","Thur"="Thursday","Fri"="Friday","Sat"="Saturday","Sun"="Sunday"))
#       
#     ),
#     
#    
#      tabsetPanel(types="tabs",
#                  tabPanel("formorn",verbatimTextOutput("summary"))
# 
#        # tabPanel("formon",
#        #          # fluidRow(...)
#        #          verbatimTextOutput("summary")
#       
#        )
# 
#        )
#   
#     
#   
# 
#   
# ))

       
     
  
#-------------------------------------------------------------------------------------------------------------------
       
      
        )
       
        )
        
    
      
#-----------------------------------------------------------------------------------------------------------------   
  
  
  ))

  