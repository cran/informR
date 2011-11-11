######################################################################
#
# zzz.R
#
# Last Modified 12/21/11
# Licensed under the GNU General Public License version 2 (June, 1991)
#
# Part of the R/informR package
#
# .onLoad is run when the package is loaded with library(informR)
#
######################################################################

.First.lib <- function(lib, pkg){
    print(packageDescription('informR'))
    cat(paste("copyright (c) 2010, Christopher S. Marcum, RAND Corporation\n",sep=""))
    cat('Type help(package="informR") to get started.\n')
}
