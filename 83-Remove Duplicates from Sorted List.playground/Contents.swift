import UIKit

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

 public class ListNode {
	 
     public var val: Int
     public var next: ListNode?
	 
     public init() {
		 self.val = 0; self.next = nil;
		 
	 }
	 
     public init(_ val: Int) {
		 self.val = val; self.next = nil;
	 }
	 
     public init(_ val: Int, _ next: ListNode?) {
		 self.val = val; self.next = next;
	 }
}

class Solution {
	
	func deleteDuplicates(_ head: ListNode?) -> ListNode? {
		if head == nil { return nil}
		
		var slow: ListNode? = head, fast: ListNode? = head
		
		while fast != nil {
			
			if  fast!.val != slow!.val{
				
				slow?.next = fast
				slow = slow?.next
			}
			fast = fast?.next
		}
		
		slow?.next = nil
		return head
	}
}

let node3 = ListNode(2)
let node2 = ListNode(1, node3)
let node1 = ListNode(1, node2)

print(node1.next?.next?.val ?? 0)

Solution().deleteDuplicates(node1)
