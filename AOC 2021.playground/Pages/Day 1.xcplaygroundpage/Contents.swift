import UIKit

func getData(_ resourceName: String) -> [Int] {
    let fileURL = Bundle.main.url(forResource: resourceName, withExtension: "txt")
    do {
        let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
        let stringArray = content.components(separatedBy: "\n")
        let inputArray = stringArray.compactMap { Int($0)!}
        return inputArray
    } catch {
        print(error)
    }
    return []
}

func getPuzzleAnswer1(array: [Int]) -> Int {
    var count = 0
    
    for i in 0...reportArray.count - 2 {
        if reportArray[i] < reportArray[i+1] {
            count += 1
        }
    }
    return count
}

func getPuzzleAnswer2(array: [Int]) -> Int {
    var count = 0
    
    for i in 0...reportArray.count - 4 {
        if reportArray[i] + reportArray[i+1] + reportArray[i+2] < reportArray[i+1] + reportArray[i+2] + reportArray[i+3] {
            count += 1
        }
    }
    
    return count
}


var reportArray = getData("ResourceData1")
print(String(getPuzzleAnswer1(array: reportArray)))
print(String(getPuzzleAnswer2(array: reportArray)))
