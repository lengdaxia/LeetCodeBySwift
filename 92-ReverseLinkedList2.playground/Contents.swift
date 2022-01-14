import UIKit

/*
 Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

 Example 1:


 Input: head = [1,2,3,4,5], left = 2, right = 4
 Output: [1,4,3,2,5]
 Example 2:

 Input: head = [5], left = 1, right = 1
 Output: [5]
  

 Constraints:

 The number of nodes in the list is n.
 1 <= n <= 500
 -500 <= Node.val <= 500
 1 <= left <= right <= n
  

 Follow up: Could you do it in one pass?
 */

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) {
		 self.val = val; self.next = next;
	 }
}

class Solution {
   
	func reverse(_ head: ListNode?) -> ListNode?{
		if head?.next == nil { return head }
		let last = reverse(head?.next)
		head?.next?.next = head
		head?.next = nil
		return last
	}
	
	private var successor: ListNode? = nil
	
	func reverseN(_ head: ListNode?, _ n: Int) -> ListNode?{
		if n == 1{
			successor = head?.next
			return head
		}
		
		let last = reverseN(head?.next, n-1)
		head?.next?.next = head
		head?.next = successor
		return last
	}
	
	
	func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
		
		if left == 1 {
			return reverseN(head, right)
		}
		
		head?.next = reverseBetween(head?.next, left - 1, right - 1)
		return head
	}
}
