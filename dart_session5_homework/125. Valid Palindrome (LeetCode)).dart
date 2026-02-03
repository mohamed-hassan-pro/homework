class Solution {
  bool isPalindrome(String s) {
    String lowerCaseText = s.toLowerCase();
    String cleanText = "";

    for (int i = 0; i < lowerCaseText.length; i++) {
      String char = lowerCaseText[i];

      bool isLetter = char.compareTo('a') >= 0 && char.compareTo('z') <= 0;
      bool isNumber = char.compareTo('0') >= 0 && char.compareTo('9') <= 0;

      if (isLetter || isNumber) {
        cleanText = cleanText + char;
      }
    }

    String reversedText = "";
    for (int i = cleanText.length - 1; i >= 0; i--) {
      reversedText = reversedText + cleanText[i];
    }

    if (cleanText == reversedText) {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  Solution sol = Solution();
  print(sol.isPalindrome("race a car"));
  print(sol.isPalindrome("A man, a plan, a canal: Panama"));
}
