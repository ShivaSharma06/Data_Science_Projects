install.packages("data.table")
library(data.table) # for converting data into time series format
install.packages("ggplot2")
library(ggplot2)  # to plot various plots
install.packages("fpp2")
library(fpp2)    # for examining seasonality graphically
install.packages("forecast")
library(forecast) # for various functions related to time series
install.packages("stats")
library(stats)                                                                                                                                         
install.packages("tseries")
library(tseries)                                                                                                                                         

AirPassengers <- read.csv("AirPassengers.csv")#Imports data

plot(AirPassengers)


# So first convert the data into time series:

AirpassengersTS <- ts(AirPassengers[,2], start = c(1949, 1),frequency = 12) #converts data into time series format. In this case the time period is 12 months
AirpassengersTS

# Now plot shows the pattern
plot(AirpassengersTS)

# Above plot observations:
#1) Data values are stored in correct time order and no data is missing.
#2) The sales are increasing in numbers, implying presence of trend component
#3) Intra-year stable fluctuations are indicative of seasonal component. As trend increases, fluctuations are also increasing. This is indicative of
# multiplicative seasonality.

# Seasonal plot year-wise 
ggseasonplot(AirpassengersTS, year.labels = TRUE, year.labels.left = TRUE) + ylab("degree") + ggtitle("Seasonal plot: Airpassenger Data")

# Two things are evident: As the year go by sales increases. Second, there is common/similar seasonality pattern but it is NOT identical.
# This means there is trend, seasonality and something else which is given to particular year and particular season
# Also bump increases with years. Hence it is multiplicative in nature.that is seasonality is multiplicative in nature and increases as the sales increases

# Decompose
#TSDecompose = decompose(tsalesTS, type = "multiplicative")
#plot(TSDecompose)

ATSDecompose = decompose(AirpassengersTS, type = "multiplicative") #Decomposes the data into 3 components. Here seasonality is "multiplicative". If it is additive, write "additive" in Type

ATSDecompose       #Yt = Seasonality t * Trend t * Random OR Irregularity OR Error...if additive then, #Yt = Seasonality t + Trend t 
plot(ATSDecompose) #seasonality shape is identical year to year because irregular part is taken out. So seasonality is repeating.
# So forecast based on the trend and multiply with the seasonality factor/seasonal correction of that particular month. 
#We do not forecast seasonality. Ignore random / irregular/ unpredictable part.

# Split data into training & testing:
#ts_train = window(tsalesTS, start = c(1992, 1), end = c(2018, 12), freq = 12)
#ts_test = window(tsalesTS, start = c(2019, 1), freq = 12)

ats_train = window(AirpassengersTS, start = c(1949, 1), end = c(1958, 12), freq = 12) #splits the data into training data till 1958 Dec.
ats_test = window(AirpassengersTS, start = c(1959, 1), freq = 12) #gives second split of testing dataset from 1959 Jan to 1960 Dec.  

#Forecasting Method:
#a) Random walk with drift
?stl                                                                                                                                                   
ATSDecompose_train_log <- stl(log10(ats_train), s.window = 'p') #we are going to predict log sales NOT sales...'p' is periodic
ATSDecompose_train_log                                                      #On the log scale, it created seasonal, trend & remainder (irregular part). Same month of each year seasonal component is same. Trend is increasing and remainder remains unpredctable. We saw this plot before 
ats_train_stl <- forecast(ATSDecompose_train_log, method = "rwdrift", h=24) #forecasting is NOT done on TS but on decomposition part. It ignores the remainder part
ats_train_stl                                                               #lower & hiher 80% point...lower & hiher 95% point: means I am 95% confident that on logrithm or log scale my forecast will be between 2.503067 to 2.564026 in Jan 1959
plot(ats_train_stl)                                                         # This forecast (shaded part) is on log scale. It continued on the trend and multiplied by the seasonality of the month.
                                                              # grey part is standard error. Dark grey indicates 95% confidence interval/level and light grey 99%...The future will be in those grey area.

#Accuracy measures using random walk drift (RWD) method:

vec2 <- 10^(cbind(log10(ats_test), as.data.frame(ats_train_stl)[,1]))#this line forecasts from 1959 Jan to 1960 Dec. And it compare the forecasted value with the actual testing data set after converting from log value to number
#OR vec2 <- 10^(cbind(log10(ats_test), as.data.frame(forecast(ATSDecompose_train_log, method = "rwdrift", h=24))[,1]))  #a^loga^x = x

vec2
10^2.533547  #1959 Jan
10^2.640171  #1959 Jun
10^2.576063 #1959 Dec
10^2.521422  #1959 Nov

ts.plot(vec2, col = c("blue", "red"), main = "sales actual vs forecast") # Blue line denotes actual value & red denotes forecasted values.
                                                                 #Forecasted values are somewhat lower than the actual observations
RMSE2 <- round(sqrt(sum(vec2[,1] - vec2[,2])^2)/length(vec2[,1]), 4)  # root mean sqare error upto 4 digits between actual and forcasted
MAPE2 <- round(mean(abs(vec2[,1] - vec2[,2])/vec2[,1]), 4)   # Mean absolute percentage error
RMSE2                                                                                                                                                   
MAPE2                               # ON an average we are 6.95 % or 7% away from the truth and in this case this much is being underpredicted as evident from red line of the plot

#b) Exponential smoothing forecasts:
?hw                          #Holt-winter's method
ats_train_hw <- hw(ats_train, h=24, seasonal = "multiplicative")#forecasts with HW method
ats_train_hw       # ses (simple exponential soothing method): we dont use ses. holt method.....

holt(ats_train, h = 24)                                         # we do holt's method when there is trend But NO seasonality.

# Accuracy value using Holt-winter method:
vec <- cbind(ats_test, as.data.frame(ats_train_hw)[,1])                                                                                              
ts.plot(vec, col = c("blue", "red"), main = "sales actual vs forecasted")

RMSE <- round(sqrt(sum(vec[,1] - vec[,2])^2)/length(vec2[,1]), 4)  # root mean sqare error upto 4 digits
MAPE <- round(mean(abs(vec[,1] - vec[,2])/vec2[,1]), 4)   # Mean absolute percentage error
RMSE                                                                                                                                              
MAPE                        # ON an average we are 7.31 % away from the truth and in this case this much is being underpredicted as evident from red line of the plot

