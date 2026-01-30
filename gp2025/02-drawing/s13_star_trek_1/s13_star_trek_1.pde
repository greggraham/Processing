size(170, 220);

background(#4094FF); // blue

fill(#E9FA7E); // gold
strokeWeight(2);

// Delta
beginShape();
// top start
vertex(99, 20);
// lower left
bezierVertex(25, 94, 15, 220, 20, 200);
// bottom crest
bezierVertex(66, 142, 99, 138, 102, 140);
// lower right
bezierVertex(143, 150, 153, 213, 146, 160);
// top end
bezierVertex(126, 35, 100, 22, 100, 20);
endShape();

// Star
fill(0);
beginShape();
// top
vertex(98, 55);
vertex(102, 88);
// right
vertex(115, 90);
vertex(103, 100);
// lower right
vertex(105, 120);
vertex(94, 108);
// lower left
vertex(83, 120);
vertex(87, 100);
// left
vertex(73, 90);
vertex(88, 90);
endShape(CLOSE);
