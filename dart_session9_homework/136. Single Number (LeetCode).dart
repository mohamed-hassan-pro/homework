/*
https://leetcode.com/problems/valid-anagram/description/
*/
class Solution {
  int singleNumber(List<int> nums) {
    int result = 0;
    
    for (int n in nums) {
      result ^= n;
    }
    
    return result;
  }
}
