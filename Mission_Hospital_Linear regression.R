
 setwd("C:/Users/Surya/Desktop/MLB_Casestudy")

Mission_Hospital<-read.csv("Mission Hospital.csv",stringsAsFactors = TRUE)
Mission_Hospital
str(Mission_Hospital)
summary(Mission_Hospital)
View(Mission_Hospital)

Mission_Hospital<-na.omit(Mission_Hospital)

cr<- cor(Mission_Hospital[c("AGE","BODY.WEIGHT","TOTAL.COST.TO.HOSPITAL")])
cr
corrplot(cr,type="full")

cr<- cor(Mission_Hospital[c("AGE","BODY.WEIGHT","BP..HIGH","BP.LOW","TOTAL.COST.TO.HOSPITAL")])
cr
corrplot(cr,type="full")

#CR2
cr<- cor(Mission_Hospital[c("AGE","BODY.HEIGHT","BODY.WEIGHT","TOTAL.COST.TO.HOSPITAL")])
cr
corrplot(cr,type="full")
###CR3
cr<- cor(Mission_Hospital[c("AGE","BODY.HEIGHT","BODY.WEIGHT","RR","TOTAL.COST.TO.HOSPITAL")])
cr
corrplot(cr,type="full")
#rr have less correlation with total cost to hospital
cr<- cor(Mission_Hospital[c("AGE","BODY.HEIGHT","BODY.WEIGHT","BP..HIGH","BP.LOW","TOTAL.LENGTH.OF.STAY","LENGTH.OF.STAY...ICU","TOTAL.COST.TO.HOSPITAL")])
cr
corrplot(cr,type="full")

library(skedastic)

###MODEL1
model1 <- lm(TOTAL.COST.TO.HOSPITAL~ AGE+BODY.HEIGHT,data=Mission_Hospital)
summary(model1)
library(car)
vif(model1)
plot(model1$fitted.values,model1$residuals)
lmtest::bptest(model1)
skedastic::white(model1)

###model2
model2 <- lm(TOTAL.COST.TO.HOSPITAL~ AGE+BODY.HEIGHT+BODY.WEIGHT,data=Mission_Hospital)
summary(model2)
vif(model2)
plot(model2$fitted.values,model2$residuals)
lmtest::bptest(model2)
skedastic::white(model2)


###model3
model3 <- lm(TOTAL.COST.TO.HOSPITAL~ AGE+BODY.HEIGHT+BODY.WEIGHT+BP..HIGH,data=Mission_Hospital)
summary(model3)
plot(model3$fitted.values,model3$residuals)  ###
lmtest::bptest(model3)#pvalue =0.005<0.5 hence heteroscedasity
plot(model3$fitted.values,model3$residuals)

skedastic::white(model1)

###model4
model4<- lm(TOTAL.COST.TO.HOSPITAL~ AGE+BODY.HEIGHT+BODY.WEIGHT+BP..HIGH+BP.LOW,data=Mission_Hospital)
summary(model4)
plot(model4$fitted.values,model4$residuals)
lmtest::bptest(model4)
skedastic::white(model4)

###model5
model5<- lm(TOTAL.COST.TO.HOSPITAL~ AGE+BODY.HEIGHT+BODY.WEIGHT+BP..HIGH+BP.LOW+TOTAL.LENGTH.OF.STAY,data=Mission_Hospital)
summary(model5)
plot(model5$fitted.values,model5$residuals)
lmtest::bptest(model5)
skedastic::white(model5)
###model6
model6<- lm(TOTAL.COST.TO.HOSPITAL~ AGE+BODY.HEIGHT+BODY.WEIGHT+BP..HIGH+BP.LOW+TOTAL.LENGTH.OF.STAY+LENGTH.OF.STAY...ICU,data=Mission_Hospital)
summary(model6)
plot(model6$fitted.values,model6$residuals)
lmtest::bptest(model6)
skedastic::white(model6)






