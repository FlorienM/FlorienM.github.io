BMI <- function(gender, height, weight) 
        round(weight/(height/100)^2,1)

shinyServer(
        function(input, output) {
                output$prediction <- renderPrint({BMI(input$gender, input$height, input$weight)})
                output$text <- renderUI({
                        str1 <- paste(input$gender,", height: ", input$height, "cm. and weight: ", input$weight, "kg.")
                        HTML(str1)
                })
                output$advice <- renderUI({
                        if ((input$gender =="Female" && BMI(input$gender, input$height, input$weight) <20)||(input$gender =="Male" && BMI(input$gender, input$height, input$weight) <18)) {
                        str2<-"Your BMI is under average, keep an eye on it and try to slowly increase your BMI. You an do it!"      
                }else if ((input$gender =="Female" && BMI(input$gender, input$height, input$weight) >25)||(input$gender =="Male" && BMI(input$gender, input$height, input$weight) >23.5)) {
                        str2<-"Your BMI is above average, try to lower your BMI, you can do it!"
                }else{
                        str2<-"Awesome! Your BMI is on average."
                }
                        HTML(str2)
                })
        })