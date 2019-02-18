data2=data[,2:11]
set.seed(10)
intrain = createDataPartition(y = data2$Observed.yield..mg.g.,p=.7,list = F)
training = data1[intrain,]
testing = data1[-intrain,]

model_new = train(Observed.yield..mg.g. ~.,data = training, method = "brnn")
prediction_new = predict(model_new, newdata = testing) 
prediction_new

plot(testing$Observed.yield..mg.g.,prediction_new)

p = data2[-intrain,]
p$predict = prediction_new

RMSE_new = sqrt(mean((p$predict-p$Observed.yield..mg.g.)**2))
RMSE_new1 = sqrt(mean((p$Predicted.yield..mg.g.-p$Observed.yield..mg.g.)**2))

