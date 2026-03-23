/*
Question 18
Write a Dart program that reads environment variables from a map. If a value is null, replace it with
a default. Print values in uppercase, and display 'Prod ready' or 'Non-prod' depending on
conditions
*/
void main() {
  Map<String, String?> envVars = {'ENV': null, 'VERSION': null};
  String env = envVars['ENV'] ?? 'prod';
  String version = envVars['VERSION'] ?? '1.0.0';
  if (env.toUpperCase() == 'PROD' && version == '1.0.0') {
    print('Prod ready');
  } else {
    print('Non-prod');
  }
}
