import UIKit


class Solution {
	func checkInclusion(_ s1: String, _ s2: String) -> Bool {
		
		let s1Arr = [Character](s1), s2Arr = [Character](s2)
		let need: [Character: Int] = Dictionary(s1Arr.map { ($0, 1) }, uniquingKeysWith: +)
		
		var window: [Character: Int] = [:]
		
		print(need,s2Arr)
		
		var left: Int = 0, right: Int = 0
		var valid: Int = 0
		
		while right < s2Arr.count {
			let c = s2Arr[right]
			right += 1
			
			if need.keys.contains(c) {
				window[c,default: 0] += 1
				if window[c] == need[c] {
					valid += 1
				}
			}
			
			print("Debug: left:\(left), right:\(right), valid: \(valid)")
			
			while right - left >= s1Arr.count {
				if valid == need.count {
					return true
				}
				
				let d = s2Arr[left]
				left += 1
				
				if need.keys.contains(d) {
					if window[d] == need[d] {
						valid -= 1
					}
					window[d,default: 0] -= 1
				}
			}
			
		}
		
		return false
	}
}

//let s1 = "ab", s2 = "eidbaooo"
let s1 = "ab", s2 = "eidboaoo"

Solution().checkInclusion(s1, s2)




