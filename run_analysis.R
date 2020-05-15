library('dplyr')


# Read in all the data files
test_data <- read.table("test/X_test.txt")
train_data <- read.table("train/X_train.txt")

test_labels <- read.table("test/Y_test.txt")
train_labels <- read.table("train/Y_train.txt")

train_subjects <- read.table("train/subject_train.txt")
test_subjects <- read.table("test/subject_test.txt")


# Add the subjects and activities to the dataset
test_data$subject <- test_subjects[,1]
test_data$activity <- test_labels[,1]

train_data$subject <- train_subjects[,1]
train_data$activity <- train_labels[,1]

# Add everything together for one big dataset
total_data <- rbind(train_data, test_data)

len <- length(total_data)

# Load in the feature names
features <- read.table("features.txt")

# Extract the relevant attributes
atts <- grep('-mean()|-std()', features[,2])

nams <- as.character(features[atts, 2])
nams <- c(nams, "subject", "activity")

atts <- c(atts, len-1, len)
total_data <- total_data[, atts]

names(total_data) <- nams

# Add descriptive names to the activities
total_data <- total_data %>% mutate(activity=recode(activity,
                                      '1' = "Walking",
                                      '2' = "Walking upstairs",
                                      '3' = "Walking downstairs",
                                      '4' = "sitting",
                                      '5' = "Standing",
                                      '6' = "Laying"))



# To make the second tidy dataset per subject per activity, we can
# use an aggregate function.
tidySet <- aggregate(. ~subject + activity, total_data, mean)

# Time to write the output
write.table(tidySet, "tidyData.txt", row.name=False)











