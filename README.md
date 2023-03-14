# Rgpt


This package provides the API for R talking to chatgpt. To use this package, it is required to obtain a OPENAI_API_KEY. To get this, you should obtain an account of Open API. On the account page, go to 
Personal -> View API Keys -> Create new secret key. 

Copy the key. 
Edit the file .Renviron, and set 

OPENAI_API_KEY= the key created.

To install the package, please follow:

	
install.packages("devtools")

library(devtools)
install_github("zhaozhg81/Rgpt")


Example:
library(Rgpt)

Rgpt("Using R, wirte a sample code for linear model.")

x=matrix(rnorm(12), nrow=3,ncol=4) 
LatexTable( 3, 4, t( round(x), digits=3) )
