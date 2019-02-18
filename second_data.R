data3=read.xlsx("table2.xlsx", sheetName = "Sheet1")
actual_data=data3[,2:6]
set.seed(3)

intrain2 = createDataPartition(y = actual_data$Observed_yield..mg.g.,p=.7,list = F)
training2 = data3[intrain2,]
testing2 = data3[-intrain2,]

model3 = train(Observed_yield..mg.g. ~.,data = training2, method = "brnn")
prediction_1 = predict(model3, newdata = testing2) 
prediction_1

actual_data$Observed_yield..mg.g.
testing2$predict = prediction_1

RMSE_1 = sqrt(mean((testing2$predict-testing2$Observed_yield..mg.g.)**2))
RMSE_2 = sqrt(mean((testing2$Predicted_yield..mg.g.-testing2$Observed_yield..mg.g.)**2))
