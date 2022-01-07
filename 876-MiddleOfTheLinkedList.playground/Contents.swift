import UIKit

public class ListNode{
	var val: Int = 0
	var next: ListNode? = nil
	
	public init(_ val: Int, _ next: ListNode?){
		self.val = val
		self.next = next
	}
}


class Solution {
	
	func getMiddleOfTheLinkedList(_ head: ListNode?) -> ListNode?{
		var slow = head, fast = head
		
		while fast != nil && fast?.next != nil{
			fast = fast?.next?.next
			slow = slow?.next
		}
		return slow
	}
}

let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))

Solution().getMiddleOfTheLinkedList(head)

