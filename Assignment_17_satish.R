input<- Example_WearableComputing_weight_lifting_exercises_biceps_curl_variations1
View(input)
input1<- as.numeric(input$new_window)
model<- glm(input1~raw_timestamp_part_1+raw_timestamp_part_2+cvtd_timestamp+num_window+roll_belt+pitch_belt+yaw_belt+total_accel_belt,data = input)
model
summary(model)
predict<- predict(model, type = "response")
head(predict, 5)
input$predict<- predict
input$predictROUND<- round(predict, digits = 0)
table(input$new_window, predict>= 0.5)
dim(input)
