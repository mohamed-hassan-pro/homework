/*
https://leetcode.com/problems/contains-duplicate/description/
*/

class Solution {
  bool containsDuplicate(List<int> nums) {
    return nums.length != nums.toSet().length;
  }
}
