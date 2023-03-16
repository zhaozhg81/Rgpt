# Rgpt


This package provides the API for R talking to chatgpt. To use this package, it is required to obtain a OPENAI_API_KEY. To get this, you should obtain an account of Open API. On the account page, go to 
Personal -> View API Keys -> Create new secret key. 

Copy the key. 
Edit the file .Renviron, and set 

OPENAI_API_KEY= ***

To install the package, please follow:
	
install.packages("devtools")

library(devtools)

install_github("zhaozhg81/Rgpt")


Example:
library(Rgpt)

## Any inquiry to be sent to chatgpt

Rgpt("Using R, wirte a sample code for linear model.")

## Create table in LaTeX format based on the output from R
x=matrix(rnorm(12), nrow=3,ncol=4) 

gptLatexTable( 3, 4, t( round(x, digits=3) ) )


## Diagnose the error from the code

library(tidyverse)

x=matrix( rnorm(20), nrow=4, ncol=5)

y=matrix( rnorm(20), nrow=4, ncol=5)

x%*%y

 Error in x %*% y : non-conformable arguments

## Create a raw strong using the function r" ----(***       )----" from the library tidyverse

Err = r"----( 

> x=matrix( rnorm(20), nrow=4, ncol=5)

> y=matrix( rnorm(20), nrow=4, ncol=5)

> x%*%y

Error in x %*% y : non-conformable arguments

)----"

gptCheckError(Err)

