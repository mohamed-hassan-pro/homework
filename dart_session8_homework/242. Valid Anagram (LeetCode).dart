/*
https://leetcode.com/problems/valid-anagram/description/
*/
class Solution {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) return false;

    Map<String, int> frequencyS = {};
    Map<String, int> frequencyT = {};

    for (String ch in s.split('')) {
      frequencyS[ch] = (frequencyS[ch] ?? 0) + 1;
    }

    for (String ch in t.split('')) {
      frequencyT[ch] = (frequencyT[ch] ?? 0) + 1;
    }

    for (String key in frequencyS.keys) {
      if (frequencyS[key] != frequencyT[key]) {
        return false;
      }
    }

    return true;
  }
}
