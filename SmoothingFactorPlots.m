clc; clear; close all;

flat_test = readtable("SmoothingFactor_data.xlsx",'Sheet', "SmoothingFactor_1_data");
smoothing_test = readtable("SmoothingFactor_data.xlsx",'Sheet', "SmoothingFactor_0.1_data");
x = linspace(1,height(flat_test(:,1)),height(flat_test(:,1)));

figure()
subplot(3,2,1)
plot(x,flat_test{:,1})
title("X-axis Normal Flat")
ylim([0.4,0.6])

subplot(3,2,3)
plot(x,flat_test{:,2})
title("Y-axis Normal Flat")
ylim([-.2,-0.05])

subplot(3,2,5)
plot(x,flat_test{:,3})
title("Z-axis Normal Flat")
ylim([7.85,8.35])

subplot(3,2,2)
plot(x,smoothing_test{1:height(flat_test{:,1}),1})
title("X-axis Smooth Flat")
ylim([0.4,0.6])

subplot(3,2,4)
plot(x,smoothing_test{1:height(flat_test{:,1}),2})
title("Y-axis Smooth Flat")
ylim([-.2,-0.05])

subplot(3,2,6)
plot(x,smoothing_test{1:height(flat_test{:,1}),3})
title("Z-axis Smooth Flat")
ylim([7.85,8.35])