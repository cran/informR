######################################################################
#
# zzz.R
#
# Based on code written by Carter T. Butts <buttsc@uci.edu>.
#
# Last Modified 04/17/11
# Licensed under the GNU General Public License version 2 (June, 1991)
#
# Part of the R/informR package
#
# .First.lib is run when the package is loaded with library(informR)
#
######################################################################

.First.lib <- function(lib, pkg){
    if(R.version$major=="1"){
     ehelp <- help(package="informR")$info[[2]][[2]]
     cat(paste("'",ehelp[4],"'\n",
               "Version ",ehelp[2],
               " created on ",ehelp[3],".\n", sep=""))
    }else{
     ehelp <- help(package="informR")$info[[1]]
     cat(paste("\n\t",substring(ehelp[3],first=16),"\n",
               "Version ",substring(ehelp[4],first=16),
               " created on ",
                substring(ehelp[5],first=16),".\n", sep=""))
    }
    cat(paste("copyright (c) 2010, Christopher S. Marcum, University of California-Irvine\n",sep=""))
    cat('Type help(package="informR") to get started.\n')
}
