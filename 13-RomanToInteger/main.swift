
class Solution {

   static func romanToInteger(_ roman: String) -> Int {

        let romanMap:[Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        var result = 0
        var previous = 0

        for c in roman {
            if let value = romanMap[c] {
                result += value
                if value > previous {
                    result -= 2 * previous
                }
                previous = value
            } else {
                return 0
            }
        }
        return result
    }
}


let result = Solution.romanToInteger("III")
print(result)
print(Solution.romanToInteger("MCMXCIV"))

