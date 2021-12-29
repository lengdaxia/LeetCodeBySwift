import UIKit

/*
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。
  

 示例 1:

 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 示例 4:

 输入: s = ""
 输出: 0
  

 提示：

 0 <= s.length <= 5 * 104
 s 由英文字母、数字、符号和空格组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters

 */

class Solution{
	
	static func lengthOfLongestSubString(_ s: String) -> Int{
			
		let sArr = Array(s)
		var left: Int = 0
		var right: Int = 0
		var res: Int = 0
		var window: [Character: Int] = [:]
		
		while (right < sArr.count){
			let c = sArr[right]
			right += 1
			window[c, default: 0] += 1
			
			while window[c, default: 0] > 1 {
				let d = sArr[left]
				left += 1
				
				window[d, default: 0] -= 1
			}
			
			res = max(res, right - left)
		}
		
		return res
	}
}
let x = "abcabcbb"
let y = "pwwkew"
let z = ""

Solution.lengthOfLongestSubString(x)
Solution.lengthOfLongestSubString(y)
Solution.lengthOfLongestSubString(z)
