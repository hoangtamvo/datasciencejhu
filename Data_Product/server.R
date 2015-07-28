source('data_processing.R')

shinyServer(
  
  function(input, output, session) {
    text.input <- reactive(input$textarea)
    freq.list <-  reactive(computeFrequencyList (text.input())) 
    
    output$barplot <- renderPlot({
      barplot(freq.list())
    })
    
    output$text <- renderPrint({
      detectPhishing(freq.list())}
    )
  }
)