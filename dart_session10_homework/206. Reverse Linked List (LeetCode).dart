/*
https://leetcode.com/problems/reverse-linked-list/description/
*/
class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? prev = null;
    ListNode? current = head;

    while (current != null) {
      ListNode? nextTemp = current.next; // نحفظ التالي
      current.next = prev; // نعكس الاتجاه
      prev = current; // نحرك prev
      current = nextTemp; // نكمل على الباقي
    }

    return prev;
  }
}
