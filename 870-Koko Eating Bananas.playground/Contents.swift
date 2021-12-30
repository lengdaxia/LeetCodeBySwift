import UIKit

/*
 Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours.

 Koko can decide her bananas-per-hour eating speed of k. Each hour, she chooses some pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.

 Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.

 Return the minimum integer k such that she can eat all the bananas within h hours.

  

 Example 1:

 Input: piles = [3,6,7,11], h = 8
 Output: 4
 Example 2:

 Input: piles = [30,11,23,4,20], h = 5
 Output: 30
 Example 3:

 Input: piles = [30,11,23,4,20], h = 6
 Output: 23
  

 Constraints:

 1 <= piles.length <= 104
 piles.length <= h <= 109
 1 <= piles[i] <= 109
 */


class Solution{
	
	static func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int{
		
		// min speed
		var left: Int = 1
		// max speed
		var right: Int = 1000000000 + 1
		
	
		
		while left < right {
			
			let mid = left + (right - left)/2
			
			// hours of eating all piles by speed of mid
			let midValue = getMiddleValue(piles, mid)
			
			
			// eat all piles before the guards come back, we cloud slow down to enjoy bananas
			// decresing the right bound of speed x
			if midValue <= h{
				// [left: mid]
				right = mid
			} else {
				// more than guards leaving time, need to speed up, add the left side bounds to mid
				//[mid+1 : right]
				left = mid + 1
			}
		}
		return left
	}
	
	// x : speed of eating bananas in an hour
	// return : totol hours of eating whole piles
	static private func getMiddleValue(_ piles: [Int], _ x: Int) -> Int{
		var hours: Int = 0
		
		for pile in piles {
			hours += pile / x
			
			if pile % x > 0{
				hours += 1
			}
		}
		return hours
	}
}

let piles = [3,6,7,11], h = 8

Solution.minEatingSpeed(piles, h)

