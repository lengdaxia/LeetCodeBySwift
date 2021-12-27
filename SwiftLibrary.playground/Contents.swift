import UIKit

var greeting = "Hello, playground"

let strArr = Array(greeting)
let str = String(strArr[0...3])
print(str)



let count = greeting.count + 2
var plusStr = String(Array(repeating: "+", count: count))

print(plusStr)

let intStr = "1\n3 1 4 1 5 9"

let n = Int(intStr.split(separator: "\n").first!) ?? 0

print(n)

let strArray = intStr.split(separator: "\n").last!
var array = strArray.split(separator: " ").map {Int($0)!}

var a2 = array.sort()
print(a2)



