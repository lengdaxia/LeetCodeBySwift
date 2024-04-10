/*
写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 ""。

示例 1：

输入：strs = ["flower","flow","flight"]
输出："fl"
示例 2：

输入：strs = ["dog","racecar","car"]
输出：""
解释：输入不存在公共前缀。
 

提示：

1 <= strs.length <= 200
0 <= strs[i].length <= 200
strs[i] 仅由小写英文字母组成
*/ 

class Solution {

    static func longestCommonPrefix(_ strs:[String]) -> String {
        if strs.count == 0 {
            return ""
        }
        var commonPrefix = strs[0]
        for i in 0..<strs.count {
            commonPrefix = compareTwoStrings(commonPrefix, strs[i])
            if commonPrefix.count == 0 {
                break
            }
        }

        return commonPrefix
    }

    private static func compareTwoStrings(_ strOne: String, _ strTwo: String) -> String {
        let count = strOne.count > strTwo.count ? strTwo.count : strOne.count
        var index = 0
        while index < count && strOne.prefix(index+1) == strTwo.prefix(index+1) {
            index += 1
        }
        return String(strOne.prefix(index))
    }
}

// let strs = ["flower","flow","flight"]
let strs = ["dog","racecar","car"]

let ret = Solution.longestCommonPrefix(strs)
print(ret)