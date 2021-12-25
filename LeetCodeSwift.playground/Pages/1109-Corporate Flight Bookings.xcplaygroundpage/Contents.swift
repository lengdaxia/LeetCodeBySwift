//: [Previous](@previous)

import Foundation
/*
 There are n flights that are labeled from 1 to n.

 You are given an array of flight bookings bookings, where bookings[i] = [firsti, lasti, seatsi] represents a booking for flights firsti through lasti (inclusive) with seatsi seats reserved for each flight in the range.

 Return an array answer of length n, where answer[i] is the total number of seats reserved for flight i.

 Example 1:

 Input: bookings = [[1,2,10],[2,3,20],[2,5,25]], n = 5
 Output: [10,55,45,25,25]
 Explanation:
 Flight labels:        1   2   3   4   5
 Booking 1 reserved:  10  10
 Booking 2 reserved:      20  20
 Booking 3 reserved:      25  25  25  25
 Total seats:         10  55  45  25  25
 Hence, answer = [10,55,45,25,25]
 Example 2:

 Input: bookings = [[1,2,10],[2,2,15]], n = 2
 Output: [10,25]
 Explanation:
 Flight labels:        1   2
 Booking 1 reserved:  10  10
 Booking 2 reserved:      15
 Total seats:         10  25
 Hence, answer = [10,25]

  

 Constraints:

 1 <= n <= 2 * 104
 1 <= bookings.length <= 2 * 104
 bookings[i].length == 3
 1 <= firsti <= lasti <= n
 1 <= seatsi <= 104
 Accepted
 33K
 Submissions
 58.3K
 Seen this question in a real interview before?
 */


struct Difference{
	var diff: [Int] = []
	
	init(_ nums: [Int]) {
		assert(nums.count > 0, "nums count bigger more than 0")
		
		diff = Array(repeating: 0, count: nums.count)
		diff[0] = nums[0]
		for i in 1..<nums.count {
			diff[i] = nums[i] - nums[i-1]
		}
	}
	
	public mutating func increment(_ i: Int, _ j: Int, _ val: Int){
		diff[i] += val
		if j+1 < diff.count{
			diff[j+1] - val
		}
	}
	
	public func originalArray() -> [Int]{
		
		var res: [Int] = Array(repeating: 0, count: diff.count)
		res[0] = diff[0]
		
		for i in 1..<diff.count {
			res[i] = res[i-1] + diff[i]
		}
		return res
	}
	
}

class Solution {
	
	func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
		
		let nums: [Int] = Array(repeating: 0, count: n)
		var diff = Difference(nums)
		
		for booking in bookings {
			
			let i: Int = booking[0] - 1
			let j: Int = booking[1] - 1
			let val: Int = booking[2]
			diff.increment(i, j, val)
		}
		
		return diff.originalArray()
	}
}


let bookings = [[1,2,10],[2,3,20],[2,5,25]]
let n = 5

let s = Solution()
let ret = s.corpFlightBookings(bookings, n)
print(ret)

//: [Next](@next)
