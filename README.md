# Accelerometer Data Combing
This project was for my work at NASA Space Grant to clean the accelerometer data from certain micro meteor experiments using our Lunar Satellites.

We started with a live experiment on our LunaSats with varying distances but keeping the same weight and drop height which allowed for the same kinetic energy. The C++ arduino code containing the smoothing factor and smoothing factor math is in a file named "SmoothingFactor_Accelerometer.ino". This data was captured using the app Coolterm which translated real time data into a spreadsheet. Then, I created a script "AccelerometerDataComb.m" which combs the data and sorts it. It also is the main script which cleans the data for the other two scripts. 

initially, we struggled with cleaning the data as micrometeoroid impacts occur at extremely low frequencies. That is why I created the scripts "PlottingAccelerometerDistance.m" and "SmoothingFactorPlots.m" which aim to fix this issue. They apply a small smoothing factor to the noise which averages the data out and amplifies impacts. It works in the same way a fourier transform does and transforms the data into readable data. 
