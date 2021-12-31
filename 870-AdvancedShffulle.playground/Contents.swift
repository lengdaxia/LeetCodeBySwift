import UIKit

/*
 You are given two integer arrays nums1 and nums2 both of the same length. The advantage of nums1 with respect to nums2 is the number of indices i for which nums1[i] > nums2[i].

 Return any permutation of nums1 that maximizes its advantage with respect to nums2.

  

 Example 1:

 Input: nums1 = [2,7,11,15], nums2 = [1,10,4,11]
 Output: [2,11,7,15]
 Example 2:

 Input: nums1 = [12,24,8,32], nums2 = [13,25,32,11]
 Output: [24,32,8,12]
  

 Constraints:

 1 <= nums1.length <= 105
 nums2.length == nums1.length
 0 <= nums1[i], nums2[i] <= 109
 */


class Solution {
	func advantageCount(_ A: [Int], _ B: [Int]) -> [Int]{
		// make A mutating
		var A = A
		// sort A in Ascend order
		A.sort()
		
		// return result array
		let n: Int = A.count
		var res: [Int] = Array.init(repeating: 0, count: n)
		
		//build priority queue, Array element = [value, index]
		var pq: [[Int]] = [[Int]]()
		// add element from B array in range 0~n
		for i in 0..<n {
			// add B array value and index simultaneously
			pq.append([B[i], i])
		}
		
		pq.sort { p1, p2 in
			// sort the pq in place by ascend value order
			p1[0] < p2[0]
		}
		
		// left index
		var lo: Int = 0
		
		// right index
		var hi: Int = n - 1
		
		// until the qp is empty
		while !pq.isEmpty {
			// begins with big value
			let cur: [Int] = pq.removeLast()
			// index
			let idx: Int = cur[1]
			// val
			let val: Int = cur[0]
			
			//Arr's biggest value compare with current bigest value from popping B Array's pq
			if A[hi] > val{
				// add the res if A[hi] can win
				res[idx] = A[hi]
				// right index -= 1
				hi -= 1
			} else {
				// add the lowest value to the res,
				res[idx] = A[lo]
				// left index += 1
				lo += 1
			}
		}
		return res
	}
	
	
	func advantageCount2(_ A: [Int], _ B: [Int]) -> [Int] {
		
		var res = Array(repeating: 0, count: A.count)
		let A = A.sorted()
		var i = 0, e = A.count - 1
		
		for (idx, n) in B.enumerated().sorted(by: { $0.1 >= $1.1 }) {
			if A[e] > n {
				res[idx] = A[e]
				e -= 1
			} else {
				res[idx] = A[i]
				i += 1
			}
		}
		return res
	}
}


//let nums1 = [2,7,11,15], nums2 = [1,10,4,11]
let nums1 = [12,24,8,32], nums2 = [13,25,32,11]
let ret = Solution().advantageCount(nums1, nums2)
print(ret)

