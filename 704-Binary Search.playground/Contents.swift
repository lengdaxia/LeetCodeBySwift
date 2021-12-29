import UIKit

class Solution {
	
	static func binarySearch(_ nums: [Int], _ target: Int) -> Int{
		var left: Int = 0
		var right = nums.count - 1
		
		while(left <= right) {
			let mid = Int(left + (right - left) / 2)
			let midValue = nums[mid]
			
			if midValue == target{
				return mid
			}else if midValue < target{
				left = mid + 1
			}else if midValue > target {
				right = mid - 1
			}
		}
		
		return -1
	}
	
	
	// nums = [1,2,2,2,3], target = 2， return 1
	static func leftBound(_ nums: [Int], _ target: Int) -> Int{
		var left: Int = 0, right: Int = nums.count - 1
			   while left <= right{
				
				   let mid = left + (right - left)/2
				   let midValue = nums[mid]
				   
				   if target <= midValue {
					   right = mid - 1
				   } else if target > midValue {
					   left = mid + 1
				   }
			   }
			   
			   if left >= nums.count || nums[left] != target{
				   return -1
			   }
			return left
	}
	
	
	// nums = [1,2,2,2,3], target = 2， return 3
	static func rightBound(_ nums: [Int], _ target: Int) -> Int{
		var left: Int = 0, right: Int = nums.count - 1
			while left <= right{
				let mid = left + (right - left)/2
				let midValue = nums[mid]
				
				if target >= midValue{
					left = mid + 1
				} else {
					right = mid - 1
				}
			}
		if right < 0 || nums[right] != target {
			return -1
		}
				
		return right
	}
}


let nums = [-1,0,3,5,9,12], target = 9
//let nums = [-1,0,3,5,9,12], target = 2
Solution.binarySearch(nums, target)

