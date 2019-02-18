library(caret)
library(xlsx)
library(brnn)
library(bagEarth)

data=read.xlsx("carbohydratepolymers.xlsx",sheetName = "Sheet1",endRow = 24)
data=data[1:11]
data1=data[,2:10]
set.seed(3)

model = train( Observed.yield..mg.g. ~.,data = data1, method = "glm")
prediction = predict(model,newdata = data1)
prediction
data$Predicted.yield.with_glm = prediction

model1 = train( Observed.yield..mg.g. ~.,data = data1, method = "bagEarth")
prediction1 = predict(model1,newdata = data1)
prediction1
data$Predicted.yield.with_bagearth = prediction1

model2 = train( Observed.yield..mg.g. ~.,data = data1, method = "brnn")
prediction2 = predict(model2,newdata = data1)
prediction2
data$Predicted.yield.with_baynesian_neural_network = prediction2

actual = data[,10]
pyield = data[,11]
RMSE = sqrt(mean((prediction-actual)**2))
RMSE1 = sqrt(mean((prediction1-actual)**2))
RMSE2 = sqrt(mean((prediction2-actual)**2))
RMSE3 = sqrt(mean((pyield-actual)**2))

plot(prediction2,actual)
write.xlsx(data,"predicted_values.xlsx")

