import UIKit

public class ListNode {
	public var val: Int
	public var next: ListNode?
	
	public init() {
		self.val = 0
		self.next = nil
	}
	
	public init(_ val: Int){
		self.val = val
		self.next = nil
	}
	
	public init(_ val: Int, _ next: ListNode?){
		self.val = val
		self.next = next
	}
}


class Solution{
	
	static func findNFromEnd(_ head: ListNode?, _ k: Int) -> ListNode?{
		var p1 = head
		
		for _ in 0..<k {
			p1 = p1?.next
		}
		
		var p2 = head
		
		while p1 != nil{
			p1 = p1?.next
			p2 = p2?.next
		}
		return p2
	}
	
	static func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode?{
		
		let dummy = ListNode(-1, head)
		
		let n1Node = findNFromEnd(dummy, n + 1)
		
		n1Node?.next = n1Node?.next?.next
		
		return dummy.next
	}
}

let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))

let k = 2

let ret = Solution.removeNthFromEnd(head, k)
