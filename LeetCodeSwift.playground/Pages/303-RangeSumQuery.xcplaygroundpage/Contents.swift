//: [Previous](@previous)

import Foundation


class NumArray {
	
	private var preSum: [Int]

	init(_ nums: [Int]) {
		let count = nums.count + 1
		preSum = Array(repeating: 0, count: count)
		for i in 1..<count{
			preSum[i] = preSum[i-1] + nums[i-1]
		}
	}
	
	func sumRange(_ left: Int, _ right: Int) -> Int {
		return preSum[right+1] - preSum[left]
	}
}

let nums = [1,2,3,4,5,6,7]
let obj = NumArray(nums)
let ret_1: Int = obj.sumRange(2, 5)
print(ret_1)

//: [Next](@next)
