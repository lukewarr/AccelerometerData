clc; close all; clear;

string = ["11","06", "03","04","05","08","09","10"];  %%Test cases  going from 2.5 - 30 ft
DistanceAway = [0,2.5,5,10,12,18,25,30];

for j = 1:3
for i = 1:numel(DistanceAway)

stringComp = 'Test' + string(i);                                            %String compiler for Test call
Test{i} = readtable("AccelerometerTestData.xlsx",'Sheet', stringComp);      %Test call with string compiler
max_x(i) = max(Test{i}{:,j});

end

% Plot all points at once after the loop
figure(j)
plot(DistanceAway, max_x, '-o', 'LineWidth', 2)  % Use '-o' to plot points with lines
hold on

% Add the labels with offsets and adjusted alignment for better visibility
for i = 1:numel(DistanceAway)
    x_offset = 0.3;  % Horizontal offset
    y_offset = 0.1;  % Vertical offset
    
    % Apply different offsets based on the index to avoid overlap
    if i == 2  % Special case for the first point to avoid y-axis overlap
        text(DistanceAway(i) + x_offset, max_x(i) - y_offset, [num2str(DistanceAway(i)) ' Feet Away'], ...
            'FontSize', 10, 'FontWeight', 'bold', ...
            'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');  % Move label away from y-axis
    elseif i == 1
            text(DistanceAway(i) + x_offset, max_x(i) - y_offset, 'No drop', ...
            'FontSize', 10, 'FontWeight', 'bold', ...
            'VerticalAlignment', 'top', 'HorizontalAlignment', 'right');  % Move label away from y-axis
    elseif mod(i, 2) == 0  % Even indices
        text(DistanceAway(i) + x_offset, max_x(i) + y_offset, [num2str(DistanceAway(i)) ' Feet Away'], ...
            'FontSize', 10, 'FontWeight', 'bold', ...
            'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
    elseif i == 3  % Odd indices
        text(DistanceAway(i) - x_offset, max_x(i) - y_offset, [num2str(DistanceAway(i)) ' Feet Away'], ...
            'FontSize', 10, 'FontWeight', 'bold', ...
            'VerticalAlignment', 'top', 'HorizontalAlignment', 'right');
    else
         text(DistanceAway(i) - x_offset, max_x(i) - y_offset, [num2str(DistanceAway(i)) ' Feet Away'], ...
            'FontSize', 10, 'FontWeight', 'bold', ...
            'VerticalAlignment', 'top', 'HorizontalAlignment', 'right');
    end

title("Max impulse felt (X Axis)")
xlabel("Distance Away (ft)")
ylabel("Peak Amplitude (g's)")
grid on
hold off  
end
end 
