`gen.sformlist` <-
function(evl,sforms,...){
   inform<-names(evl$eventlist)
   sformlist<-list()
   if(any(grepl("[[:punct:]]|[[:digit:]]",sforms))){sfin<-sforms[which(grepl("[[:punct:]]|[[:digit:]]",sforms))];cat(paste("Note: \n \t ", sfin, " S-form(s) contains special regex syntax. \n  \t Using slow search methods. \n",sep=""))}
   for(i in 1:length(inform)){
      evl1<-attr(evl$eventlist[[i]],"char")
      attr(evl1,"a.uid")<-evl$event.key
      if(!is.null(evl$null.events)){
      attr(evl1,"a.null")<-evl$null.events}
      sformlist[[i]]<-mapply(function(x) gen.sform(evl1,x,...),sforms)
   }
  outpm<-sfl2sl(sformlist)
  names(outpm)<-names(evl$eventlist)
  outpm
}
