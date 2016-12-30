# PCA_for_OCR
This project was for my Numerical Computation class and has the goal of implementing Principal Component Analysis (PCA) towards Object Character Recognition (OCR) for converting images of letters into editable texts.

This includes source code, test images, our powerpoint presentation, and a written report explaining the project. My friends and contributors towards this project are Elham Alzaki and Nashawna Olton.

This implements MATLAB and source code from https://blog.cordiner.net/2010/12/02/eigenfaces-face-recognition-matlab/.

The two main files needed to test all three data sets are PCA_Recognition.m and PCA_One_Letter.m

PCA_One_Letter.m accesses the folders, Smaller_Training_Letters and Test_Images, which can be found at lines 1 and 33. The output of the test results can be found at small_text_message.txt. This is data set one's results.

PCA_Recognition.m can access the folders, 30_30_Letters and 30_30_Message which can be found on lines 4 and 29. This is to test the second data set.

To test the last data set PCA_Recognition.m needs to access 45_45_Letters and 45_45_Message on lines 5 and 30. This is to test the last data set. The second and third data results are then shown in large_text_message.txt. 

Note: Data set one displays supplemental figures and graphs, which are not included by data set two and three. More information is said in the paper.

*Feel free to use my work as a reference, but please refrain from copying code to serve as assignments in computer science related courses.*
