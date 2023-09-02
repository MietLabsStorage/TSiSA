dots_X = [0 1 2 -1];
dots_Y = [0 1 8 -1];
[linear, parabol, cubic, custom] = task4_approximate(dots_X, dots_Y);

x = -1:1:6;
linear_y = linear(x);
parabol_y = parabol(x);
cubic_y = cubic(x);
custom_y = custom(x);

hold on;
plot(dots_X, dots_Y, 'ro')
plot(x, linear_y)
plot(x, parabol_y)
plot(x, cubic_y)
plot(x, custom_y)
legend("dots", "linear", "parabol", "cubic")
title("Aproximate by 4 dots")
xlabel("x")
ylabel("y")