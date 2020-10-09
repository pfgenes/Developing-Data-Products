library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Professional Basketball Comparison"),
    
    # Sidebar with options selectors 
    sidebarLayout(
        sidebarPanel(
            helpText("This application compares professional basketball players from different leagues."),
            h3(helpText("Select:")),
            selectInput("cut1", label = h4("League1"), 
                        choices = list("All" = "*", "Arg" = "Arg", "Australian" = "Australian",
                                       "Austrian" = "Austrian", "BIBL" = "Balkan",
                                       "BPL"="Belarus","Belgium"="Belgium","Bosnian"="Bosnian",
                                       "NBB"="Brazilian","BBL"="British","Bulgarian"="Bulgarian",
                                       "Canadian"="Canadian-NBL",
                                       "Chinese"="Chinese-CBA","Croatian"="Croatian-A-1-Liga",
                                       "Czech"="Czech-NBL","Danish"="Danish-Basketligaen",
                                       "Estonian"="Estonian-Latvian-Basketball-League",
                                       "Eurocup"="Eurocup",
                                       "EuroLeague"="Euroleague","FIBA"="FIBA-Europe-Cup",
                                       "Finnish"="Finnish-Korisliiga","French"="French-Jeep-Elite",
                                       "Georgian"="Georgian-Super-Liga",
                                       "German"="German-BBL","Greek"="Greek-HEBA-A1",
                                       "Hungarian"="Hungarian-NBIA","Israeli"="Israeli-BSL",
                                       "Italian"="Italian-Lega-Basket-Serie-A",
                                       "Japanese"="Japanese-BLeague","Kosovo"="Kosovo-FBK",
                                       "Lebanese"="Lebanese-Division-A","Lithuanian"="Lithuanian-LKL",
                                       "Luxembourg"="Luxembourg-Total-League","Macedonian"="Macedonian-Superleague",
                                       "Mexican"="Mexican-LNBP","NBA"="NBA","Netherlands"="Netherlands-DBL",
                                       "New Zealand"="New-Zealand-NBL","Norwegian"="Norwegian-BLNO",
                                       "Polish"="Polish-TBL","Romanian"="Romanian-Divizia-A","Serbian"="Serbian-KLS",
                                       "Slovakian"="Slovakian-Extraliga","Slovenian"="Slovenian-SKL",
                                       "South Korean"="South-Korean-KBL","Spanish"="Spanish-ACB","Swedish"="Swedish-Basketligan",
                                       "Swiss"="Swiss-LNA","Turkish"="Turkish-BSL",
                                       "Ukranian"="Ukrainian-Superleague")),
            selectInput("cut2", label = h4("League2"), 
                        choices = list("All" = "*", "Arg" = "Arg", "Australian" = "Australian",
                                       "Austrian" = "Austrian", "BIBL" = "Balkan",
                                       "BPL"="Belarus","Belgium"="Belgium","Bosnian"="Bosnian",
                                       "NBB"="Brazilian","BBL"="British","Bulgarian"="Bulgarian",
                                       "Canadian"="Canadian-NBL",
                                       "Chinese"="Chinese-CBA","Croatian"="Croatian-A-1-Liga",
                                       "Czech"="Czech-NBL","Danish"="Danish-Basketligaen",
                                       "Estonian"="Estonian-Latvian-Basketball-League",
                                       "Eurocup"="Eurocup",
                                       "EuroLeague"="Euroleague","FIBA"="FIBA-Europe-Cup",
                                       "Finnish"="Finnish-Korisliiga","French"="French-Jeep-Elite",
                                       "Georgian"="Georgian-Super-Liga",
                                       "German"="German-BBL","Greek"="Greek-HEBA-A1",
                                       "Hungarian"="Hungarian-NBIA","Israeli"="Israeli-BSL",
                                       "Italian"="Italian-Lega-Basket-Serie-A",
                                       "Japanese"="Japanese-BLeague","Kosovo"="Kosovo-FBK",
                                       "Lebanese"="Lebanese-Division-A","Lithuanian"="Lithuanian-LKL",
                                       "Luxembourg"="Luxembourg-Total-League","Macedonian"="Macedonian-Superleague",
                                       "Mexican"="Mexican-LNBP","NBA"="NBA","Netherlands"="Netherlands-DBL",
                                       "New Zealand"="New-Zealand-NBL","Norwegian"="Norwegian-BLNO",
                                       "Polish"="Polish-TBL","Romanian"="Romanian-Divizia-A","Serbian"="Serbian-KLS",
                                       "Slovakian"="Slovakian-Extraliga","Slovenian"="Slovenian-SKL",
                                       "South Korean"="South-Korean-KBL","Spanish"="Spanish-ACB","Swedish"="Swedish-Basketligan",
                                       "Swiss"="Swiss-LNA","Turkish"="Turkish-BSL",
                                       "Ukranian"="Ukrainian-Superleague")),
            
            radioButtons("XAxis",
                         label = "Select X-axis:",
                         choices = list("Year" = "Season","FG%" = "FGPerc","3P%" = "ThreePPerc",
                                        "FT%" = "FTPerc"),
                         selected = "Season"),
            radioButtons("YAxis",
                         label = "Select Y-axis:",
                         choices = list("Year" = "Season","FG%" = "FGPerc","3P" = "ThreePPerc",
                                        "FT%" = "FTPerc"),
                         selected = "FGPerc")
        ),
        
        # Show a plot with diamonds and regression line
        mainPanel(
            plotOutput("ballPlot"),
            h4("League 1 Average:"),
            h3(textOutput("result1")),
            h4("League 2 Average:"),
            h3(textOutput("result2"))
        )
    )
))