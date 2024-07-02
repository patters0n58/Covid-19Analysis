# Covid-19Analysis



I used this page on Kaggle and found a CSV dataset that you can get here.

Let us take a look at the data:
1.1

We have data for about 1,000 cases of COVID-19. We can see the age of each infected person, the fender, whether they recovered or died, among many other things. For this tutorial, we will just look at a few of these columns. Let us make a folder with this CSV file in it and start RStudio.

In RStudio, to import the dataset, we will go to File->Import Dataset->From Text(base). Find your CSV file and click “Import.” You will see a line like this in the console of RStudio:
1.2

We will copy this line into our main R script, which I will save as script.R in the same folder as our CSV file.

For convenience, I will rename the data frame variable to “data.” I will also clear all existing variables, import a library called Hmisc, and use its describe function to better understand our data.
1.3

If you run this code, you will see a lot of information in the console. For instance, we have 1085 rows. If we look at the death section, we see that there are 14 distinct values. This may seem a little bit weird, but the death column either has a 0 (no death), 1 (no death), or simply the date of the patient’s death. This is difficult to work with because we want all 0s and 1s.

Let us fix this by adding a death_dummy column to our dataset, which only contains the values 0 and 1.
1.4

We also calculated the death rate of our dataset, which after running turns out to be 5.8%. For the first part of this tutorial, we will analyze the age of the people who have died and of those who did not.

AGE
The media claims that older people are more likely to die than younger people from COVID-19. Is this true? Let us check with our dataset. First, we will subset our dataset into patients who are alive and patients who have died and compare the mean ages. This code will do it for us:
1.5


Notice, the na.rm=TRUE means to skip rows that have NA (or no value) for a specific column (age in this case). After running this, we get that the mean of those who survived is 48 years, while the mean for those who have died is about 68.6 years old.

Okay, so the data does indeed show that those who die are older in our sample. But is this true universally for the population? How confident are we that this is true?

We can use the t.test command to gauge our confidence and to see if we can trust our means. In this case, we will use a 95% confidence interval.
1.6

This simple command is quite powerful. Notice, we gave it both the ages of the alive patients as well as the age of the patients who have died. Let’s analyze the output.
1.7

Looking at the confidence interval, we can say with 95% certainty, that the age difference between patients who have died and those who haven’t is from 16.7 to 24.3 years. Now, look at the p-value. It is almost 0. This means that there is ~0% chance that we obtained such extreme result randomly from this sample under the null hypothesis (which is that the ages of the two groups are equal). For this reason, we can reasonably reject the null hypothesis (under the conventional significance level of 0.05) and say that people who have died from COVID-19 are indeed older than those who did not. Now, let’s look at gender!

GENDER
This will be very similar. We want to see if the death rate is similar for men and women. Let us again split our data and perform the t-test:
1.8

We subset our original data into two sets. After calculating the means, we see that men in this dataset have a death rate of 8.5% as opposed to 3.7% in women. Well, this is unexpected. Again, can we trust this data? Here is the t.test output:
1.9,1.10

Our confidence interval of 95% shows that mean will have from 1.7% to 7.8% higher death rate than women. A p-value of 0.002 signifies that we can reject the null hypothesis that men and women have the same death rate, since 0.002 < 0.05.

There have been articles written that men indeed do have a higher coronavirus death rate. Here is one of them if you are interested.

Conclusion
As you can see, R helps us perform statistical analysis on important datasets quite easily. Thank you for reading!