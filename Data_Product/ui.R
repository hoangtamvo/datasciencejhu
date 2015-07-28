inputTextarea <- function(inputId, value="", nrows, ncols) {
  tagList(
    singleton(tags$head(tags$script(src = "textarea.js"))),
    tags$textarea(id = inputId,
                  class = "inputtextarea",
                  rows = nrows,
                  cols = ncols,
                  as.character(value))
  )
}

shinyUI(pageWithSidebar(
  headerPanel("Detecting Phishing Email"),
  
  sidebarPanel(
    h3('Instructions'),
    p('Type the email content in the text area below 
      and then click button \'Detect\'. 
      A bar plot of frequency list of words 
      in the email will be shown in the main panel. 
      A message whether this looks like a phising email
      will be printed out as well.'),
    
    h3('Email\'s body:'),
    
    inputTextarea('textarea', 
                  'Please type email content here! 
                  Please let us know your password 
                  for account maintenance.',
                  10,35 ),
    
    submitButton('Detect')
    ),
  
  mainPanel(    
    h3('Result of Analysing Email Content'),
    
    h4('Word Frequency List'),
    plotOutput('barplot'),
    
    h4('Detection Message:'),
    verbatimTextOutput("text")
  )
 )
)