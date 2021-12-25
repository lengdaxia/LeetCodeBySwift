import Foundation

public struct Difference {
	private var diff: [Int] = []
	
	public init(_ nums: [Int]) {
		let count = nums.count
		assert(count > 0, "nums should't empty array")
		diff = Array(repeating: 0, count: count)
		
		diff[0] = nums[0]
		
		for i in 1..<count{
			diff[i] = nums[i] - nums[i-1]
		}
	}
	
	public mutating func increment(_ i: Int, _ j: Int, _ val: Int){
		diff[i] += val
		
		if j + 1 < diff.count {
			diff[j+1] -= val
		}
	}
	
	public func result() -> [Int]{
		var res = Array(repeating: 0, count: diff.count)
		res[0] = diff[0]
		
		for i in 1..<diff.count{
			res[i] = res[i-1] + diff[i]
		}
		return res
	}
}
