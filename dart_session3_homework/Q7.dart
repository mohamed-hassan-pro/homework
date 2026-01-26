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


void main2() {
  // 1. الداتا: خريطة تربط المسار باسم الصفحة
  // String? تعني أن اسم الصفحة قد يكون غير موجود (Null)
  Map<String, String?> routes = {
    '/': 'Home Page',
    '/products': 'Products Page',
    '/profile': null, // صفحة موجودة كمسار لكن ليس لها عنوان حالياً
  };

  // 2. المحاكاة: لنفترض أن المستخدم طلب مسار البروفايل
  String path = '/profile';

  // 3. المنطق: الـ Router
  switch (path) {
    case '/':
    case '/products':
    case '/profile':
      // هنا تكمن الروعة: نبحث في الماب، لو القيمة null نضع قيمة بديلة
      // لاحظ استخدام الـ ! هنا لأننا تأكدنا في الـ case أن المسار موجود في الـ switch
      // ولكن القيمة نفسها قد تكون null لذلك نستخدم ??
      String pageName = routes[path] ?? 'Untitled Page';
      print('Navigating to: $pageName');
      break;

    default:
      print('404 - Page Not Found');
  }
}