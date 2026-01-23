/*
Question 15
Write a Dart program that simulates a simple router using a switch statement on a string path ('/',
'/products', '/profile', or other). Handle each case with appropriate output, including maps and null
safety where needed
*/
void main() {
  List<Map<String, String>> paths = [
    {'path': '/'},
    {'path': '/products'},
    {'path': '/profile'},
    {'path': '/models'},
  ];
  
  switch (paths[0]['path']) {
    case '/':
      print('Home Page');
      break;
    case '/products':
      print('Products Page');
      break;
    case '/profile':
      print('Profile Page');
      break;
    case '/models':
      print('Models Page');
      break;
    default:
      print('Not Found');
      break;
  }
}
