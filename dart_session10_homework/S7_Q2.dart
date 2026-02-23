/*
2. Food Delivery App – Orders & Menu
Imagine you are building a food delivery app.
- The app has a menu of food items (each with a name, price, and category like "Pizza" or "Drinks").
- A user can add multiple items to an order.
- The app should calculate the total price of the order
*/
class FoodItem {
  String name;
  double price;
  String category;

  FoodItem(this.name, this.price, this.category);
}

class Order {
  List<FoodItem> items = [];

  void addItem(FoodItem item) {
    items.add(item);
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }
}

void main() {
  Order order = Order();
  order.addItem(FoodItem("Pizza", 12.99, "Main Course"));
  order.addItem(FoodItem("Salad", 7.50, "Side Dish"));
  order.addItem(FoodItem("Coke", 2.50, "Drinks"));

  print("Total Price: \$${order.getTotalPrice().toStringAsFixed(2)}");
}