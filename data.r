data<-read.csv('./MinimisedData.csv', header = T, stringsAsFactors = FALSE)
head(data)

#Ommiting the NAN values from the dataset
data<-na.omit(data)
#Scaling the data so as to perform further steps
str(data)