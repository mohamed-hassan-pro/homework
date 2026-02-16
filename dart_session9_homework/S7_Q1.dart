/*
Q1
Design an OOP model for planning trip fuel across multiple vehicle types.
Requirements:
- Provide a general vehicle type with encapsulated core data (private fields) and validated constructors
(invalid → print an error; keep previous values).
- Create at least two specialized vehicle types that inherit from the general type and introduce one
private field each affecting fuel usage, with validation.
- Define a fuel computation method in the general type; specialized types must override it with their own
rule.
- In a mixed collection of vehicles, given a list of trip distances, compute total fuel per vehicle and print
which vehicles cannot complete the route under their own constraints (you define the constraint per
type).
*/
class Vehicle {
  double _fuelRate = 10.0;
  double _tankCap = 50.0;

  Vehicle(double rate, double cap) {
    fuelRate = rate;
    tankCap = cap;
  }

  set fuelRate(double val) {
    if (val > 0) _fuelRate = val;
    else print("Error: Rate must be > 0");
  }

  set tankCap(double val) {
    if (val > 0) _tankCap = val;
    else print("Error: Capacity must be > 0");
  }

  double calcFuel(double dist) {
    return dist / _fuelRate;
  }

  bool canFinish(double dist) => calcFuel(dist) <= _tankCap;
}

class SportCar extends Vehicle {
  bool _turboMode = false;

  SportCar(double rate, double cap, bool turbo) : super(rate, cap) {
    _turboMode = turbo;
  }

  @override
  double calcFuel(double dist) {
    double base = super.calcFuel(dist);
    return _turboMode ? base * 1.2 : base;
  }
}

class HeavyTruck extends Vehicle {
  double _load = 0; // in tons

  HeavyTruck(double rate, double cap, double load) : super(rate, cap) {
    this.load = load;
  }

  set load(double val) {
    if (val >= 0) _load = val;
    else print("Error: Load can't be negative");
  }

  @override
  double calcFuel(double dist) {
    double base = super.calcFuel(dist);
    return base + (base * 0.05 * _load);
  }
}

void main() {
  List<double> trips = [100.0, 50.0, 200.0];
  double totalDist = trips.reduce((a, b) => a + b);

  List<Vehicle> fleet = [
    Vehicle(12, 40),
    SportCar(8, 50, true),
    HeavyTruck(5, 100, 10)
  ];

  for (var v in fleet) {
    double totalFuel = v.calcFuel(totalDist);
    bool safe = v.canFinish(totalDist);
    
    print("${v.runtimeType}: Fuel Needed: ${totalFuel.toStringAsFixed(1)}L");
    if (!safe) {
      print(" -> Cannot complete route (Low Tank)");
    }
  }
}