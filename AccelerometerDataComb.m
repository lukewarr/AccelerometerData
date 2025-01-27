clc; clear all;

string = ["03", "04","05","06","07","08","09","10","11","12","13","14",'15',"16","17","18","19","20","21"];                        %Test cases
duration = [12, 12, 11, 11, 13, 12, 14, 10, 9, 8, 8, 8, 8, 9, 9, 8, 9, 9, 9];                                %Duration of each test's data collection
DistanceAway = [5,10,12,2.5,2.5,18,25,30,0,25,25,25,25,25,25,50,50,75,75];

for i = 1:numel(duration)

stringComp = 'Test' + string(i);                                            %String compiler for Test call

Test{i} = readtable("AccelerometerTestData.xlsx",'Sheet', stringComp);      %Test call with string compiler
x{i} = linspace(1, duration(i), height(Test{i}));                           %X split into its duration

figure(i)
sgtitle(num2str(DistanceAway(i)) + " Feet Away")                                                         %Subplot title

fourierx{i} = ifft(Test{i}{:,1});                                           %Fast Fourier Transform for X direction data
fouriery{i} = ifft(Test{i}{:,2});                                           %Fast Fourier Transform for Y direction data
fourierz{i} = ifft(Test{i}{:,3});                                           %Fast Fourier Transform for Z direction data

Fs = [280, 280, 280, 280, 280, 280, 280, 280, 280, 75, 75, 35, 35, 19, 19, 280, 280, 280, 280];     %Sample rates
L = height(Test{i});                                                        %Test lengths
T = 1/Fs(i);                                                                   %Sample Period of test

P2x = abs(fourierx{i}/L);                                                   %Ermm
P1x = P2x(1:L/2+1);
P1x(2:end-1) = 2*P1x(2:end-1);

P2y = abs(fouriery{i}/L);
P1y = P2y(1:L/2+1);
P1y(2:end-1) = 2*P1y(2:end-1);

P2z = abs(fourierz{i}/L);
P1z = P2x(1:L/2+1);
P1z(2:end-1) = 2*P1z(2:end-1);

P1x(1,1) = mean(P1x);
P1y(1,1) = mean(P1y);
P1z(1,1) = mean(P1z);


%Subplots

subplot(3,2,1);
plot(x{i}, Test{i}{:,1});
title("X-axis",'FontSize',12)
ylabel("Acceleration (m/s^2)",'FontSize',10)
xlabel("Time (s)",'FontSize',10)

subplot(3,2,3);
plot(x{i}, Test{i}{:,2});
title("Y-axis",'FontSize',12)
ylabel("Acceleration (m/s^2)",'FontSize',10)
xlabel("Time (s)",'FontSize',10)

subplot(3,2,5);
plot(x{i}, Test{i}{:,3});
title("Z-axis", 'FontSize',12)
ylabel("Acceleration (m/s^2)",'FontSize', 10)
xlabel("Time (s)", 'FontSize',10)


subplot(3,2,2)
plot(Fs(i)/L*(0:L/2),abs(P1x),"LineWidth",1)
title("fft X axis", 'FontSize',12)
xlabel("f (Hz)",'FontSize',10)
ylabel("|fft(X)|", 'FontSize',10)

subplot(3,2,4)
plot(Fs(i)/L*(0:L/2),abs(P1y),"LineWidth",1)
title("fft Y axis", 'FontSize',12)
xlabel("f (Hz)",'FontSize',10)
ylabel("|fft(X)|",'FontSize',10)

subplot(3,2,6)
plot(Fs(i)/L*(0:L/2)/L,abs(P1z),"LineWidth",1)
title("fft Z axis",'FontSize',12)
xlabel("f (Hz)", 'FontSize',10)
ylabel("|fft(X)|", 'FontSize',10)


end


