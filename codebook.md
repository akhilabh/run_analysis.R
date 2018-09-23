**Code Book**

In this i am going to describe the data used in this project. I will also talk about the tidy data set.


**1. Which data did i use**

In my data set, or in the results of my data set, 30 volunteers performed six activities while holding a smartphone. the phone captured this data about all of their movements.


**2. Which files did I use**

*features.txt:* gives me the name of all of the features

*activity_labels.txt:*  gives the names and IDs for all of the phone's activities. 

*X_train.txt:* gives the features for 21 of the volunteers

*subject_train.txt:* this gives the ID of the volunteer as it relates to the observations.

*y_train.txt:*  this gives the ID of the activity related to each of the observations.

*X_test.txt:* this gives me the feature results for the remaining 9 volunteers.

*subject_test.txt:* this gives the ID of the volunteer related to the observations.

*y_test.txt:* this gives me the ID of the activity related to each of the observations that we saw in the  X_test.txt file .


**3. What did I do with these files**

I read all of the files into a data frame, and then added column names. then I combined the necessary files (training and test) into one large data set.
I edited the columns that were not means andstds, and then changed the activity column so it had labels for all of theactivities. I madea tidy data set which had the mean of each feature for the activity. after that I outputed it to a .csv file.
