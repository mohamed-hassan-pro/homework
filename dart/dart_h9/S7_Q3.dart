/*
Q3
Given an array of integers nums sorted in ascending order, and an integer target, write a function to
search target in nums.
- If target exists, return its index. Otherwise, return -1.
- The algorithm must run in O(log n) time complexity.
Examples:
- Input: nums = [-1,0,3,5,9,12], target = 9 → Output: 4
Explanation: 9 exists in nums and its index is 4.
- Input: nums = [-1,0,3,5,9,12], target = 2 → Output: -1
Explanation: 2 does not exist in nums, so return -1.
*/
int search(List<int> nums, int target) {
  int low = 0;
  int high = nums.length - 1;

  while (low <= high) {
    int mid = low + (high - low) ~/ 2; 

    if (nums[mid] == target) {
      return mid;
    } else if (nums[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return -1;
}

void main() {
  List<int> data = [-1, 0, 3, 5, 9, 12];
  
  print("Index of 9: ${search(data, 9)}");
  print("Index of 2: ${search(data, 2)}");
}