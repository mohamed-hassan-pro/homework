/*
Exercise 8:
8. a) Create a Map book = {'title': 'Dart Guide', 'pages': 120, 'price': 19.99}.
b) Print book['title'], update price, and add a new key 'author'.
c) Print all keys, values, and check if 'pages' exists as a key.
*/
void main() {
  Map<String, dynamic> book = {
    'title': 'Dart Guide',
    'pages': 120,
    'price': 19.99,
  };
  print('Book title: ${book['title']}');

  book['price'] = 29.99;
  book['author'] = 'Moubdi3'; // Adding new key 'author'

  print('Book all keys: ${book.keys}');
  print('Book all values: ${book.values}');

  print('Does "pages" key exist? ${book.containsKey('pages')}');
}
