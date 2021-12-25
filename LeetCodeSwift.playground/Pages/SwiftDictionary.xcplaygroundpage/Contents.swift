import UIKit

//@frozen struct Dictionary<Key, Value> where Key : Hashable

// TODO: - basic use
var responseMessages = [
	200: "OK",
	403: "Access forbidden",
	404: "File not found",
	500: "Internal server error",
]

var emptyDict: [String: String] = [:]

var dict = Dictionary<Int, Any>.init()
dict[0] = "zero"
dict[1] = [1]
dict[2] = 3
print(dict)

// 有key则返回值
print(dict[0])
// 没有key会返回nil
print(dict[4])
// 遍历字典
for (key,element) in dict{
	print("key:\(key), value:\(element)")
}


// MARK: - 创建字典

//默认init是空的 , key 必须遵守hashable协议
var dict0 = Dictionary<String, Int>.init()
print(dict0)

// 自定义key创建字典
// 1-自定义key
class CustomKey: Hashable{
	var id: String = UUID().uuidString
	
	static func == (lhs: CustomKey, rhs: CustomKey) -> Bool {
		lhs.id == rhs.id
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}
// 2- 创建字典
var dict1 = Dictionary<CustomKey, String>.init()
let key1 = CustomKey()
let value1 = "one"
dict1[key1] = value1
print(dict1)

// init by key value
let digitWords = ["one","two","three"]
var dict2 = Dictionary.init(uniqueKeysWithValues: zip(digitWords, 1...3))
print(dict2)

// init by (value,value) 元祖
let pairsWithDuplicateKeys = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]

let firstValues = Dictionary(pairsWithDuplicateKeys,
							 uniquingKeysWith: { (first, _) in first })
// ["b": 2, "a": 1]

let lastValues = Dictionary(pairsWithDuplicateKeys,
							uniquingKeysWith: { (_, last) in last })
// ["b": 4, "a": 3]

// init by group
let students = ["Kofi", "Abena", "Efua", "Kweku", "Akosua"]
let studentsByletter = Dictionary(grouping: students) { s in
	s.first!
}
print(studentsByletter)

// MARK: - 查看字典
print(dict0.isEmpty)
print(dict1.count)
print(dict2.capacity)

// MARK: - 获取字典的key和值
var hues = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
print(hues["Coral"])
print(hues["Cerise"])

print(hues["notExistKey",default: 0])
print(hues)
print(hues.randomElement()!)

// 计算字母出现频率
let message = "Hello, Elle!"
var letterCounts: [Character: Int] = [:]
for letter in message{
	letterCounts[letter,default: 0] += 1
}
print(letterCounts)
let maxNum = letterCounts.values.sorted(by: >).first!
print(maxNum)

let maxLatter = letterCounts.firstIndex { $0.value == maxNum }
print(maxLatter!)

// MARK: - 添加键值对
hues.updateValue(28, forKey: "Coral")
hues.updateValue(0, forKey: "notExistKey")
print(hues)

// MARK: - 删除健值对

// MARK: - compare

// MARK: - iterating

// MARK: - finding elements

// MARK: - transform

// MARK: - encode&decode


