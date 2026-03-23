/*
Q12
Create a program with a username that is empty. If the username is empty, print (guest). Otherwise,
print the username.
*/
void main() {
  String username = '';

  if (username.isEmpty) {
    print('guest');
  } else {
    print(username);
  }
}
