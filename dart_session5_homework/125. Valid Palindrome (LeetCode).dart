class Solution {
  bool isPalindrome(String s) {
    s = s.toLowerCase();
    String cleanS = s.replaceAll(RegExp(r'[^a-z0-9]'), '');
    bool isPalindrome = true;
    for (int i = 0; i < cleanS.length; i++) {
      if (cleanS[i] != cleanS[cleanS.length - 1 - i]) {
        isPalindrome = false;
      }
    }
    return isPalindrome;
  }
}
