shinyUI(fluidPage(
        pageWithSidebar(
                # Application title
                titlePanel("Body Mass Index (BMI)"),
                sidebarPanel(
                        h4("Fill out your own data and find out what you BMI is:"),
                        radioButtons("gender", "Gender:",
                                     list("Male" = "Male",
                                          "Female" = "Female")),
                        numericInput('height', 'Height in cm', 180, min = 140, max = 210, step = 1),
                        numericInput('weight', 'Weight in kg', 75, min = 40, max = 150, step = 1),
                        submitButton('Submit')
                ),
                mainPanel(
                        h3('You entered:'),
                        htmlOutput("text"),
                        h3('Your BMI is:'),
                        verbatimTextOutput("prediction"),
                        h2(htmlOutput("advice"))
                )
        )
)
)
        