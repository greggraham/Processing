// Basic Arithmetic (see example 4-4)

size(480, 120);

// Variables for coordinates and height
int x;
x = 25;
int y = 25;
int h = 20;

// First rectangle at x, y
rect(x, y, 300, h);

// Second rectangle down and to the right
x = x + 100;
rect(x, y + h, 300, h);

// Third rectangle down and to the left
x = x - 250;
rect(x, y + h*2, 300, h);
