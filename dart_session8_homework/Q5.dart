/*
Q5
Create a class Book with private fields _title and _pages.
- Add setters: reject empty titles and pages ≤ 0.
- Add a getter title and a computed getter readingTime that assumes 2 minutes per page.
- In main(), create a book, print its title and estimated reading time.
*/
void main() {
  Book book = Book();

  book.title = 'Clean Code';
  book.pages = 250;

  print('Book Title: ${book.name}');
  print('Reading Time: ${book.readingTime} minutes');
}

class Book {
  String? _title;
  int? _pages;

  set title(String title) {
    if (title.isNotEmpty) {
      this._title = title;
    } else {
      print('Invalid Title');
    }
  }

  set pages(int pages) {
    if (pages > 0) {
      this._pages = pages;
    } else {
      print('Invalid Name');
    }
  }

  String? get name => this._title;
  num? get price => this._pages;

  num? get readingTime => this._pages! * 2;
}
