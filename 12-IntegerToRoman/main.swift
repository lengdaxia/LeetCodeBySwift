class Solution {
    func intToRoman(_ num: Int) -> String {
        let values: [Int] = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let numerals: [String] = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        var result = ""
        var remaining = num

        for i in 0..<values.count {
            while remaining >= values[i] {
                result += numerals[i]
                remaining -= values[i]
            }
        }

        return result
    }
}