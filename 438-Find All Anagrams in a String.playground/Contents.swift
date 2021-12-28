import UIKit

class Solution {
	func findAnagrams(_ s: String, _ p: String) -> [Int] {
		
		let sArr = [Character](s), pArr = [Character](p)
		
		var left: Int = 0, right: Int = 0
		var valid: Int = 0
		
		var need: [Character: Int] = [:], window: [Character: Int] = [:]
		for c in pArr{
			need[c, default: 0] += 1
		}
		print(need)
		
		var res: [Int] = []
		
		while (right < sArr.count){
			let c = sArr[right]
			right += 1
			
			if (need.keys.contains(c)){
				window[c, default: 0] += 1
				
				if (window[c] == need[c]){
					valid += 1
				}
			}
			print(window,left,right,valid)
			
			while(right - left >= pArr.count){
				if(valid == need.count){
					res.append(left)
				}
				
				let d = sArr[left]
				left += 1
				
				if(need.keys.contains(d)){
					if(need[d] == window[d]){
						valid -= 1
					}
					window[d, default: 0] -= 1
				}
			}
		}
		
		return res
	}
}

let s = "cbaebabacd"
let p = "abc"

let solution = Solution()
let retArr = solution.findAnagrams(s, p)
print(retArr)


