# CH-01----

library(mlr3)
task <- tsk("penguins")
split <- partition(task)
learner <- lrn("classif.rpart")

learner$train(task, row_ids = split$train)
learner$model

prediction <- learner$predict(task, row_ids = split$test)
prediction

prediction$score(msr("classif.acc"))
