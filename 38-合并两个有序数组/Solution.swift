
class Solution {

    static func merge(_ nums1: inout [Int], _ m: Int,_ nums2: [Int], _ n: Int){
        var i = m - 1, j = n - 1, p = m + n - 1

        while i>=0 && j>=0 {
            if nums1[i] > nums2[j] {
                nums1[p] = nums1[i]
                i -= 1
            } else {
                nums1[p] = nums2[j]
                j -= 1
            }
            p -= 1
        }

        while j >= 0 {
            nums1[p] = nums2[j]
            j -= 1
            p -= 1
        }
    }
}


var nums1 = [1,2,2,0,0,0]
let nums2 = [1,3,5]

Solution.merge(&nums1, 3, nums2, nums2.count);
print(nums1)