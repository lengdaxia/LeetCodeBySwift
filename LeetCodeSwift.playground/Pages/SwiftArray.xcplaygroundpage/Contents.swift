//: [Previous](@previous)
import Foundation

//@frozen struct Array<Element>


// TODO: - 数组的创建
let oddNumbers = [1,3,5,7,9]
let streets = ["Albemarle","Brandywine","Chesapeake"]

//简单声明
var emptyDoubles: [Double] = []

//完整的声明
var emptyFloats: Array<Float> = Array()

// 声明二维数组
var twoDArray = [[Int]]()
twoDArray = [[1,2],[3,4]]
print(twoDArray)

// 初始化 二维数组 5*3=>0
var init2DArray = Array(repeating: Array(repeating: 0, count: 3), count: 5)
print(init2DArray)

//声明一个固定长度和默认元素的数组
var digitCounts = Array(repeating: 0, count: 10)
print(digitCounts)

// MARK: - 获取数组元素

// for in
for street in streets{
	print("I don't live on \(street)")
}

// is emyty
if oddNumbers.isEmpty{
	print("There is no odd numbers")
}else{
	print("I Konw \(oddNumbers.count) odd numbers")
}

// 获取数组第一个和最后一个元素
if let firstElement = oddNumbers.first,
let lastElement = oddNumbers.last{
	print(firstElement, lastElement, separator: ", ")
}

// first，last返回的是optianl类型元素
print(emptyDoubles.first, emptyDoubles.last, separator: ", ")


// 通过下标访问, 返回不是optinal类型，
print(oddNumbers[1], oddNumbers[2], separator: ", ")

//如果index越界则会崩溃, index Out of range
//print(emptyDoubles[0])


// MARK: - 增加元素
var students = ["Ben", "Ivy", "Jordell"]

// 在数组末尾，增加单个元素
students.append("Maxime")

// 在数组末尾，增加多个元素
students.append(contentsOf: ["Shakia","William"])

print(students)

// 数组相加
var students2 = ["Mary","Jone"]
//可以 + 直接操作数组相加
students = students + students2
print(students)

// 插入 at index
students.insert("Liam", at: 3)
print(students)


// MARK: - 数组删除
// remove at index
students.remove(at: 0)
// remove last
students.removeLast()
// remove first
students.removeFirst()


// MARK: - 获取数组元素的索引
var s = students.firstIndex(of: "Mary")
var s_am = students.firstIndex { s in
	s.contains("am")
}

// MARK: - 数组拷贝
var numbers = [1,2,3,4,5]
var numbersCopy = numbers
numbers[0] = 100
print(numbers)
print(numbersCopy)



//: [Next](@next)
