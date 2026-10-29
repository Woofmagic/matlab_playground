% Date created: 2021029
% Last updated: 2021029
% Notes:
%   1. 2021029: CHecking out how to customize plot features
%   and some of the MATLAB calls for various plotting functions.

NAME_OF_FIGURE = "Cool Data";
FIGURE_BACKGROUND_COLOR = "white";

% assign the output of figure to the figure object:
figure_object = figure(Name = NAME_OF_FIGURE);

figure_object.Visible = 'off';
figure_object.Position = [100, 100, 1500, 900];
figure_object.Color = FIGURE_BACKGROUND_COLOR;

[figure_title_object, figure_subtitle_object] = title( ...
    "Cool Plot!", ...
    "Rendered on 2026/10/29");

figure_title_object.FontSize = 18.0;
figure_title_object.FontWeight = 'normal';
figure_title_object.FontName = 'Times';
figure_title_object.Interpreter = "tex";
figure_title_object.Color = "black";

% following: https://www.mathworks.com/help/matlab/ref/matlab.graphics.axis.axes-properties.html
% I guess there's no other way to customize the axes than by using this
% call... Seems jank to me.
axes_object = gca;

axes_object.TickLength = [0.02, 0.02];
axes_object.LineWidth = 1.5;

% I decided I like this customization better:
x_label_object = xlabel('X-Axis Label');
x_label_object.Color = "black";
x_label_object.FontSize = 16;

y_label_object = ylabel('Y-Axis Label');
y_label_object.Color = "black";
y_label_object.FontSize = 16;

% turn the bounding box on
% following this: https://www.mathworks.com/help/matlab/ref/box.html
box(axes_object, ...
    matlab.lang.OnOffSwitchState.on);

% customize the grid:
% mostly following this:
% https://www.mathworks.com/help/matlab/ref/grid.html#mw_6ab96a67-1b12-4fc0-ab74-83a1ca935dca
grid(axes_object, ...
    matlab.lang.OnOffSwitchState.on);