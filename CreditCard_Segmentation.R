
##########################################################
#credit card data 
##########################################################
creditcard_d <- read.csv("creditcard_d.csv") #imports data file (WHEN YOU DO ANALYSIS WITH DIFFERENT DATA FILE, CHANGE DATA FILE NAME INSIDE THE BRACKET ACCORDINGLY)
str(creditcard_d) #gives structure of the data/variables
summary(creditcard_d)
# Missing data
#p <- function(x){sum(is.na(x))/length(x)*100}
#apply(creditcard_d, 2, p)

is.na(creditcard_d) #finds missing valuefit
sum(is.na(creditcard_d)) # counts missing values
creditcard_d <- na.omit(creditcard_d) #remove the rows containing missing value(s).


data_C <- creditcard_d[,-1] #Removes first colum from the data
d <- dist(data_C, method = "euclidean") #Calculates distance between data points                                            #nC2=n!/(2!*(n-2)!)=8635*8636/2=37285930
#distance matrix
h <- hclust(d, method = "ward") #Gives hierarchical clusters

# dendrogram
plot(h) #Hierarchical cluster

#Cut tree into 3 clusters
#groups <- cutree(h, k=3)                                                                                                                               #write.csv(groups, "group.csv")
# draw dendrogram with red borders around the K1 clusters
rect.hclust(h, k=3, border = "red")

# K-Mean

# Determine number of clusters
apply(data_C,2, var) # Calculates the variance of each colum 
wss <- (nrow(data_C)-1)*sum(apply(data_C,2, var)) #Calculates distance within sum of squares when there is no clusters (means only 1 cluster is there)
wss
kmeans(data_C, centers = 2)$withinss
kmeans(data_C, centers = 3)$withinss
kmeans(data_C, centers = 4)$withinss

for (i in 1:15) wss[i] <- sum(kmeans(data_C, centers = i)$withinss)
wss
plot(1:15, wss, type = "b", xlab = "Number of clusters", ylab = "Within groups sum of squares") #Gives the plot & elbow to find number of cluster
#(we look for "elbow" in the scree plot)
# Take optimal number of clusters in k-means
k1=3 #According to Hierarchical clustering & elbow the number of cluster is 3

# K-means cluster analysis
fit <- kmeans(data_C, k1) # (for k1 cluster solution) K mean clusters

#get cluster means
aggregate(data_C, by=list(fit$cluster), FUN = mean)

# cluster assignment
creditcard_d1 <- data.frame(creditcard_d, fit$cluster) #assigns cluster
creditcard_d2 <- creditcard_d1[, -c(2:15)] #Removes variables between Customer_ID & Clusters

table(creditcard_d1$fit.cluster) #Measurement of clusters
table(creditcard_d1$fit.cluster)/8636 #Measurement in percentage


#Targeting
#predict the cluster:
str(creditcard_d1)
creditcard_d1$fit.cluster = as.factor(creditcard_d1$fit.cluster) #Converts fit.cluster into factor as it is a categorical variable
str(creditcard_d1)
# split data - train (60%) & test (40%):
set.seed(1234)
ind <- sample(2, nrow(creditcard_d1), replace = T, prob = c(0.6, 0.4)) #splits total data into 60% & 40%  (YOU CAN CHANGE TO 80% & 20% (0.8, 0.2))                                                                       
train <- creditcard_d1[ind==1,]    #First set of tarining data 60%     
test <- creditcard_d1[ind==2,]   # Second set of testing data 40%

install.packages("nnet")
library(nnet)
#If you want to fix the reference level:
#train$fit.cluster <- relevel(train$fit.cluster, ref = "1" or "2" or "3")                                                                           
model=multinom(fit.cluster ~ BALANCE+CREDIT_LIMIT+TENURE, train) #Gives predictive model that which customer will fall in which cluster (CHANGE VARIABLES ACCORDING TO YOUR DATA FILE) )
summary(model)  # model evaluation                                                                                                                                  
                                                                                                                                        
#Calculate P value of variables                                                                                                                                                      # 2-tailed z-test                                                                                                                    
z <- summary(model)$coefficients/summary(model)$standard.errors
z  # If mod z is greater than 1.96 then p value is < or = 0.05
p <- (1 - pnorm(abs(z), mean = 0, sd = 1))*2
p

#predict
pred <- predict(model,test) #Predicts test data with the model developed on training data
# also check: pred <- predict(model,train) and
head(pred)  #Gives some predicted value
head(test$fit.cluster) #checks the accuracy of those predicted values
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
#confusion matrix or missclassification error:
tab <- table(predicted = pred, Actual = test$fit.cluster)
tab
sum(diag(tab))/sum(tab)

#predict from new data
BALANCE=c(2495, 30000, 70000)#Input data of "BALANCE" of three customers to predict with the predictive model for cluster assignment... (TYPE VARIABLE NAME EXACTLY ACCORDING TO YOUR DATA FILE)
CREDIT_LIMIT=c(3500, 8000, 70000)#Input data of "CREDIT_LIMIT" of three customers to predict with the predictive model for cluster assignment...(TYPE VARIABLE NAME EXACTLY ACCORDING TO YOUR DATA FILE)
TENURE=c(12, 12, 12) #Input data of "TENURE" of three customers to predict with the predictive model for cluster assignment...(TYPE VARIABLE NAME EXACTLY ACCORDING TO YOUR DATA FILE)

new=data.frame(BALANCE=BALANCE, CREDIT_LIMIT=CREDIT_LIMIT, TENURE= TENURE) #to predict..(TYPE VARIABLE NAME EXACTLY ACCORDING TO YOUR DATA FILE)
# check if any of the variable in this new (new data frame) is factor
#new$BALANCE or CREDIT_LIMIT or TENURE=<- as.factor(new$BALANCE or CREDIT_LIMIT or TENURE)

str(new) #indicates structure
new$cluster = predict(model, new) #Predicts with the developed predictive model that which customer will fall in which cluster or segment

new #Gives new table with predicted value
write.csv(new, "new.csv")

##########################################################################################################################################

new_prd <- read.csv("new_prd.csv")
new_prd$cluster = predict(model, new_prd)
write.csv(new_prd, "new_prdctd.csv")






