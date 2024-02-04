#1000A dataset
KA <- citybike.test10000A
citytrain <- citybike.train
KB <- citybike.test10000B

plot(citytrain$bikeid, citytrain$tripduration)
summary(citytrain$tripduration)
summary(citytrain$bikeid)
bike.lm.model <- lm(tripduration~bikeid, data=citytrain)
summary(bike.lm.model)

#test for KA
Predict_forA <- predict(bike.lm.model, KA)
regr.error(bike.lm.model, citybike.test10000A$tripduration)

#test for  KB
Predict_forB <- predict(bike.lm.model, KB)
linmod_B <- lm(tripduration~bikeid+start.station.id, data=citytrain)
mypred <- predict(linmod_B)
write.csv(mypred, file = "/Users/smila/newfile.csv")
