//: [Previous](@previous)

import Foundation

/*
 There is a car with capacity empty seats. The vehicle only drives east (i.e., it cannot turn around and drive west).

 You are given the integer capacity and an array trips where trip[i] = [numPassengersi, fromi, toi] indicates that the ith trip has numPassengersi passengers and the locations to pick them up and drop them off are fromi and toi respectively. The locations are given as the number of kilometers due east from the car's initial location.

 Return true if it is possible to pick up and drop off all passengers for all the given trips, or false otherwise.

  

 Example 1:

 Input: trips = [[2,1,5],[3,3,7]], capacity = 4
 Output: false
 Example 2:

 Input: trips = [[2,1,5],[3,3,7]], capacity = 5
 Output: true
  

 Constraints:

 1 <= trips.length <= 1000
 trips[i].length == 3
 1 <= numPassengersi <= 100
 0 <= fromi < toi <= 1000
 1 <= capacity <= 105
 */


class Solution {
	func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool{
		
		//bus stop maximum count value 1001
		let nums = Array(repeating: 0, count: 1001)
		
		var df = Difference(nums)
		
		for trip in trips {
			let val = trip[0]
			let i = trip[1]
			let j = trip[2] - 1
			
			df.increment(i, j, val)
		}
		
		let res = df.result()
		
		let index = res.first { i in
			i > capacity
		}
		
		return index == nil
	}
}

//: [Next](@next)
