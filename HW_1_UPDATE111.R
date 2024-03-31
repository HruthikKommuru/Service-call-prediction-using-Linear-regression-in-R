library(ggplot2)
subdata <- read.csv("/Users/HRUTHIK/Desktop/subscription+dummpy.csv", header = TRUE)
subdata

null <- lm(tot_call~1, data = subdata)
full <- lm(tot_call~tot_mem+avg_temp+deg_ht+pr_rain+pr_snow+age+FEB+MAR+APR+MAY+JUN+JUL+AUG+SEP+OCT+NOV+DEC, data = subdata)
stepreg <- step(null,scope = list(lower=null,upper=full),data=subdata, trace=0)
summary(stepreg)

#lm(formula = tot_call ~ deg_ht + age + avg_temp + tot_mem + pr_snow + MAR + DEC + FEB + SEP + AUG, data = subdata)
############ REVIEW OF LINEAR REGRESSION #######
#1.DATA#
#2.ESTIMATION
subreg <- lm(tot_call ~ deg_ht + age + avg_temp + tot_mem + pr_snow + MAR + DEC + FEB+SEP+AUG, data = subdata)
summary(subreg)
#3. ASSESMENT
#Multiple R-squared:  0.8982,Adjusted R-squared:  0.8875 ,Residual standard error: 1570 

#4A. Testing overall model
#F-TEST#
#Ho: all b's are 0
#Ha: atleast one b is not 0
#reject Ho if pvalue < 0.5
# we need pvalue for individual variables
#therefore we perform ANOVA, so it gets all pvalues of individual variables

anova(subreg)
#Therefore, we reject Ho and the model is linear model

#4A. Testing Incremental value
# Need to check rsuaqre, for every individual variable in model
#Ho: Bi = 0/all other variables in model
#Ha: Bi != 0/any one variable in the model
#Reject Ho, if pvaluee is less than your level of significance

####We used step wise regression for this step#####

##########5.A#######

#################
###############ASSUMPTIONS IN LINEAR REGRESSION ###########
#1.LINEARITY
#2.NORMALITY
#3.HOMOSCEDSTICITY
#4.INDEPENDENCE
#5.OUTLIERS

#OUTLIERS#
#A. COOKS DISTANCE
subreg$residuals
rstandard(subreg)
cook <- cooks.distance(subreg)
cook
plot(cook,ylab = "cooks distance")
points(48,cook[48],col = "red")
#HOMOSCEDASTICITY#
###??par(mfrom=c(1,3))
plot(subreg$fitted.values,subreg$residuals)
zres <- rstandard(subreg)
plot(subreg$fitted.values,zres)
###No pattern is found

#TEST FOR LINEARITY#
plot(subdata$deg_ht,zres)
plot(subdata$age,zres)
plot(subdata$avg_temp,zres)
plot(subdata$tot_mem,zres)
plot(subdata$pr_snow,zres)
#NO PATTERN FOUND

#TEST FOR NORMALITY#
hist(subreg$residuals)
qqnorm(subreg$residuals)
qqline(subreg$residuals)
##SHAPIRO-WILK TEST FOR NORMALITY#
shapiro.test(subreg$residuals)
#pv <0.5
# W is close to 1 which says the model is strong

#INDEPENDENCE#
# USING WATSON TEST
install.packages("lmtest")
library("lmtest")
dwtest(subreg,alternative = "two.sided")
# test for over fitting
# Load required libraries
library(caret)

# Set seed for reproducibility
set.seed(123)

# Split data into training and testing sets (80% training, 20% testing)
trainIndex <- createDataPartition(subdata$tot_call, p = 0.8, 
                                  list = FALSE, 
                                  times = 1)
data_train <- subdata[ trainIndex,]
data_test  <- subdata[-trainIndex,]

# Train the model on the training data
model <- lm(tot_call ~ deg_ht + age + avg_temp + tot_mem + pr_snow + MAR + DEC + FEB, 
            data = data_train)

# Make predictions on the training data
train_predictions <- predict(model, newdata = data_train)

# Make predictions on the testing data
test_predictions <- predict(model, newdata = data_test)

# Calculate mean squared error for training and testing predictions
train_mse <- mean((train_predictions - data_train$tot_call)^2)
test_mse <- mean((test_predictions - data_test$tot_call)^2)

# Output mean squared errors
# Output mean squared errors
print(paste("Training Mean Squared Error: ", train_mse))
print(paste("Testing Mean Squared Error: ", test_mse))

# Compare training and testing errors
if (test_mse < train_mse) {
  print("The model is overfitting the training data.")
} else {
  print("The model is performing well on both training and testing data.")
}
a<-extractAIC(subreg)
cat("AIC=",a[2])








