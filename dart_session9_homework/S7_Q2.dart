/*
Q2
Model shapes to compute total paintable area and cost.
Requirements:
- Provide a general shape type (concrete class) with an area() method that can be overridden.
- Implement at least three concrete shape types with encapsulated dimensions and validated
constructors (invalid → print; keep previous).
- Use polymorphism with a mixed collection of shapes to compute total area (no type checks in client
code).
- Apply tiered pricing: first 50 units at 1.50, next 100 at 1.25, remainder at 1.00; print total area and total
cost to 2 decimals.
*/
class Shape {
  double area() => 0.0;
}

class Circle extends Shape {
  double _r = 1;

  Circle(double r) { radius = r; }

  set radius(double val) {
    if (val > 0) _r = val;
    else print("Invalid radius");
  }

  @override
  double area() => 3.14 * _r * _r;
}

class Rectangle extends Shape {
  double _w = 1, _h = 1;

  Rectangle(double w, double h) {
    width = w;
    height = h;
  }

  set width(double val) {
    if (val > 0) _w = val;
    else print("Invalid width");
  }
  
  set height(double val) {
    if (val > 0) _h = val;
    else print("Invalid height");
  }

  @override
  double area() => _w * _h;
}

class Square extends Shape {
  double _s = 1;

  Square(double s) { side = s; }

  set side(double val) {
    if (val > 0) _s = val;
    else print("Invalid side");
  }

  @override
  double area() => _s * _s;
}

void main() {
  List<Shape> shapes = [
    Circle(5),
    Rectangle(10, 5),
    Square(4),
    Rectangle(-5, 10)
  ];

  double totalArea = 0;
  for (var s in shapes) {
    totalArea += s.area();
  }

  double cost = 0;
  double rem = totalArea;

  double tier1 = (rem > 50) ? 50 : rem;
  cost += tier1 * 1.50;
  rem -= tier1;

  if (rem > 0) {
    double tier2 = (rem > 100) ? 100 : rem;
    cost += tier2 * 1.25;
    rem -= tier2;
  }

  if (rem > 0) {
    cost += rem * 1.00;
  }

  print("Total Area: ${totalArea.toStringAsFixed(2)}");
  print("Total Cost: \$${cost.toStringAsFixed(2)}");
}