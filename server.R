#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

# select columns to be used in the analysis
diam <- diamonds[,c(1:4,7)]
bball <- read.csv("players_stats_by_season_full_details.csv")
bball$FTPerc <- as.numeric(as.character(bball$FTPerc))
bball$ThreePPerc <- as.numeric(as.character(bball$ThreePPerc))
bball$FGPerc <- as.numeric(as.character(bball$FGPerc))
bball<-bball %>%na.omit
# Define server logic required to draw a plot
shinyServer(function(input, output) {
    output$ballPlot <- renderPlot({

        bball2 <-bball[bball$League ==input$cut1 | bball$League ==input$cut2,]


        plot <- ggplot(data=bball2, aes_string(x=input$XAxis, 
                                        y =input$YAxis))+
            geom_point(aes(color = League), alpha = 0.2)+
            geom_smooth(method = "lm")

        plot
        
    })
    
    output$result1 <- renderPrint({
        bball3 <-bball[bball$League ==input$cut1 ,]
        if (input$XAxis == "Season"){
            res1 <- mean(bball3$Season)
        }
        
        else if (input$XAxis == "FGPerc"){
            res1 <- mean(bball3$FGPerc)
        }
        else if (input$XAxis == "ThreePPerc"){
            res1 <- mean(bball3$ThreePPerc)
        }
        else if (input$XAxis == "FTPerc"){
            res1<- mean(bball3$FTPerc)
        }
        res1
        

    })
    output$result2 <- renderText({
        bball4 <-bball[bball$League ==input$cut2 ,]
        if (input$YAxis == "Season"){
            res2 <- mean(bball4$Season)
            }
        
        else if (input$YAxis == "FGPerc"){
            res2 <- mean(bball4$FGPerc)
        }
        else if (input$YAxis == "ThreePPerc"){
            res2 <- mean(bball4$ThreePPerc)
        }
        else if (input$YAxis == "FTPerc"){
            res2 <- mean(bball4$FTPerc)
        }
        res2
        
    })
    
})