//: [Previous](@previous)

import Foundation

//pre sum
/*
 求数组中的子数组和为ka的个数
 */

func subArraySum(_ nums: [Int], _ k: Int) -> Int{
	
	let n = nums.count
	var preSumMap: [Int:Int] = [:]
	
	preSumMap[0] = 1
	
	var res: Int = 0
	var sum0_i: Int = 0
	for i in 0..<n {
		// presum i
		sum0_i += nums[i]
		
		let sum0_j = sum0_i - k
		if preSumMap.keys.contains(sum0_j){
			res += preSumMap[sum0_j, default: 0]
		}
		
		// count + 1
		preSumMap[sum0_i] = preSumMap[sum0_i, default: 0] + 1
	}
	
	return res
}


let nums = [1,1,1]
let k = subArraySum(nums, 2)
print(k)



//: [Next](@next)
