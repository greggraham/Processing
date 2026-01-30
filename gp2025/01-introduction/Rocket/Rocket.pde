// Draw a rocket
// by Mr. Graham
size(200, 200);

// Nose cone
triangle(90, 40, 100, 10, 110, 40);

// Body
rect(90, 40, 20, 120);

// Windows
circle(100, 50, 10);
circle(100, 70, 10);
circle(100, 90, 10);

// Fins
quad(90, 120, 90, 160, 70, 160, 70, 150);
quad(110, 120, 110, 160, 130, 160, 130, 150);

// Nozzles
quad(92, 160, 90, 165, 99, 165, 97, 160);
quad(103, 160, 101, 165, 110, 165, 108, 160);
