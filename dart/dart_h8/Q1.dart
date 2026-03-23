/*
Q1
Create a class BankAccount with a private field _balance.
- Add a getter balance that returns the balance.
- Add a setter balance that prevents setting it to a negative value (print 'Invalid balance' if attempted).
- In main(), demonstrate creating an account, updating the balance, and trying to set a negative
balance.
*/

void main() {
  BankAccount account = BankAccount();
  
  account.balance = 100;
  print(account.balance);

  account.balance = 200;
  print(account.balance);

  account.balance = -100;
}

class BankAccount {
  num? _balance;

  set balance(num balance) {
    if (balance < 0) {
      print('Invalid balance');
    } else {
      this._balance = balance;
    }
  }

  num? get balance => this._balance;
}
