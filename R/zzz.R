######################################################################
#
# zzz.R
#
# Last Modified 03/20/12
# Licensed under the GNU General Public License version 2 (June, 1991)
#
# Part of the R/informR package
#
# .onLoad is run when the package is loaded with library(informR)
#
######################################################################

.onLoad <- function(lib, pkg){
    abt<-packageDescription('informR')
packageStartupMessage(
    c("\n\t",abt$Title,"\n"),
    c("Version: ",abt$Version,"\n"),
    c("Compiled:",abt$Built,"\n\n"),
    c(paste("copyright (c) 2010, Christopher S. Marcum\n",sep="")),
    c('Type help(package="informR") to get started.\n'))
}



