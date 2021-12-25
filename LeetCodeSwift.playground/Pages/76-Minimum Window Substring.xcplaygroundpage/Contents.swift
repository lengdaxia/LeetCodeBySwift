//: [Previous](@previous)
import Foundation
/*
 Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

 The testcases will be generated such that the answer is unique.

 A substring is a contiguous sequence of characters within the string.

  

 Example 1:

 Input: s = "ADOBECODEBANC", t = "ABC"
 Output: "BANC"
 Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
 Example 2:

 Input: s = "a", t = "a"
 Output: "a"
 Explanation: The entire string s is the minimum window.
 Example 3:

 Input: s = "a", t = "aa"
 Output: ""
 Explanation: Both 'a's from t must be included in the window.
 Since the largest window of s only has one 'a', return empty string.
  

 Constraints:

 m == s.length
 n == t.length
 1 <= m, n <= 105
 s and t consist of uppercase and lowercase English letters.
  

 Follow up: Could you find an algorithm that runs in O(m + n) time?
 */

//extension StringProtocol{
//	
//	subscript(offset: Int) -> Character{
//		self[index(startIndex, offsetBy: offset)]
//	}
//}

class Solution {
	
	func minWindowOptimized(_ s: String, _ t: String) -> String{
		
		// string转换成char数组
		let sChars = Array(s), tChars = Array(t)
		// 目标子字符串转换成 频数字典
		var tFreq = Dictionary( tChars.map{ ($0, 1)}, uniquingKeysWith: +)
		// 指针和判断常量
		// left：左指针，shortestLen，窗口的最短长度， start：更新目标的起始index，matters： 判断符合情况的字符个数
		var left = 0, shortestLen = Int.max, start = 0, matters = 0
		
		// 遍历 s 字符串数组，sChar当前的s中的Char
		for(i, sChar) in sChars.enumerated() {
			// 当tFreq中存在sChar的时候，进行后续操作，否则就跳出本次循环
			guard let sCharFreq = tFreq[sChar] else {
				continue
			}
			
			// 将对比的Tfreq的sChar频数 减去 1
			tFreq[sChar] = sCharFreq - 1
			
			//当频数>0的时候，matters+1，用判断窗口收缩的时机
			if sCharFreq > 0 {
				matters += 1
			}
			
			// 当matters等于 目标字符串数组的个数的时候，将窗口左侧的left向右增加
			while matters == tChars.count {
				
				// 获取窗口最左侧的char，如果不存在则跳过本次循环，并left+1
				guard let leftFreq = tFreq[sChars[left]] else {
					left += 1
					continue
				}
				
				// 如果取出来的char频数为0，则matter - 1，并更新指标变量
				if leftFreq == 0{
					matters -= 1
					
					// 如果右侧指针小于最短长度，则更新start和shortestLen为右侧指针
					if i - left + 1 < shortestLen {
						shortestLen = i - left + 1
						start = left
					}
				}
				
				// 目标频数字典的左侧频数 + 1
				tFreq[sChars[left]] = leftFreq + 1
				// left指针向右+1
				left += 1
			}
		}
		
		// 输出最短数的子字符串
		return shortestLen == Int.max ? "" : String(sChars[start..<start+shortestLen])
	}
	
	func minWindow(_ s: String, _ t: String) -> String {
		
		var window: [Character: Int] = [:]
		var need: [Character: Int] = [:]
		
		for c in t{
			need[c,default: 0] += 1
		}
//		print(need)

		var valid: Int = 0
		
		var left:Int = 0
		var right: Int = 0
		
		var start: Int = 0
		var len: Int = Int.max
		print(len)
		
		//
		while (right < s.count){
			
			// normal method to get char at index
//			let c = s[s.index(s.startIndex, offsetBy: right)]
//			print(c)
			
			// convinient way
//			let c = s[right]
			let c = charAt(s, right)
//			print(c)
			right += 1
			
			if need.keys.contains(c){
				window[c, default: 0] += 1
				if window[c] == need[c]{
					valid += 1
				}
			}
			
			// 判断左侧是否要收缩
			while (valid == need.count) {
				
				//
				if (right - left) < len {
					start = left
					len = right - left
				}
				
				let d = charAt(s, left)
				left += 1
				
				if need.keys.contains(d) {
					//
					if window[d] == need[d] {
						valid -= 1
					}
					window[d,default: 0] -= 1
				}
			}
		}
		
		return len == Int.max ? "" : subString(s, start, start+len)
	}
	
	private func charAt(_ str: String, _ offset: Int) -> Character{
		return str[str.index(str.startIndex, offsetBy: offset)]
	}
	
	private func subString(_ str: String, _ from: Int, _ to: Int) -> String{
		
		let strArr = Array(str)
		let str = String(strArr[from..<to])
		return str
	}
}

let s = Solution()
let ret = s.minWindow("HelloYourSwiftLeetcode", "llou")
print(ret)

//: [Next](@next)
