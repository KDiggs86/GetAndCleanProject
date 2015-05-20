Human Activity Recognition Using Smartphones 

All data was taken from the the UCIHARDataset from the Coursera Getting and Cleaning Data course. This dataset tracks the motions of a group of 30 volunteers performing six activities while wearing a smartphone on their waste. For detailed information on how each measure was taken please see the README.txt and features_info.txt files of the UCIHARDdataset repository. 

Researchers had volunteers perform six activities while wearing a smartphone. The activities are:

1) Walking

2) Walking Upstairs

3) Walking Downstairs

4) Sitting

5) Standing

6) Laying

Researchers measured 3-axial linear acceleration (using the accelerometer of the smartphone) and 3-axial angular velocity (using the gyroscope of the smartphone) at a constant rate of 50Hz. They also derived the acceleration and velocity with respect to time to obtain Jerk signals. They then recorded the following features in both the time and frequency domains: ‘-XYZ’ is used to denote the signals in the X, Y and Z directions.

Body Acceleration - XYZ
Gravity Acceleration - XYZ
Body Acceleration Jerk - XYZ
Body Angular Velocity - XYZ (we will call Angular Velocity “Gyro” from now on)
Body Gyro Jerk - XYZ
Body Acceleration Magnitude (Magnitude calculated using Euclidean norm)
Gravity Acceleration Magnitude
Body Accleration Jerk Magnitude
Body Gyro Magnitude
Body Gyro Jerk Magnitude

The researchers sampled the sensor signals in fixed-width sliding windows of 2.56 sec and 50% overlap and performed numerous calculations with the data collected. For this project we are only interested in the mean and standard deviation of each feature and the mean frequency of the frequency components. 

Each of the variable in our data set labeled using the following system:
- mean measurements in time domain start with m_t
- mean measurements in frequency domain start with m_f
- standard deviation measurements in time domain start with s_t
- standard deviation measurements in frequency domain start with s_f
- mean frequency measurements in frequency domain start with mfreq_f
Use the following abbreviations to decode each variable:
B = Body
Gr = Gravity
A = Acceleration
Gy = Gyro
J = Jerk
M = Magnitude
X = in the X direction
Y = in the Y direction
Z = in the Z direction

Examples:
(1) m_tBAX = mean of the X-direction Body Acceleration measurements in the time domain
(2) s_fBGyJY = standard deviation of the Y-direction Body Gyro measurements in the frequency domain
(3) s_tBAJM = standard deviation of the body acceleration jerk magnitude measurements in the time domain
(4) mfreq_fBGyJM = mean frequency of the body gyro jerk magnitude measurements in the frequency domain





License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
