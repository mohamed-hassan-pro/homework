/*
https://leetcode.com/problems/contains-duplicate/description/
*/

class Solution {
  bool containsDuplicate(List<int> nums) {
    // return nums.length != nums.toSet().length;
    Set<int> seen = {};
    for (int num in nums) {
      if (seen.contains(num)) {
        return true;
      }
      seen.add(num);
    }
    return false;
    //حل ب ال Map
    
  }
}
