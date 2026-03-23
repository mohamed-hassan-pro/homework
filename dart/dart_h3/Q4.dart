/*
Question 12
Create a Dart program that safely reads a phone number from a map. If the phone number is null,
print a default message. Then update the phone number and print its length.
*/
void main() {
  Map<String, String?> phones = {'phone1': null, 'phone2': '+201234567890'};
  String? phoneNumber = phones['phone1'];

  if (phoneNumber == null) print('No phone number provided');

  phones['phone1'] = phones['phone2'];
  print('Phone number length: ${phones['phone1']?.length}');
}
