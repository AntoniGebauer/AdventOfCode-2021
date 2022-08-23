import UIKit

extension String {
    var number: String {
        let pattern = UnicodeScalar("0")..."9"
        return String(unicodeScalars
                        .compactMap { pattern ~= $0 ? Character($0) : nil })
    }
}

func getData(_ resourceName: String) -> [String] {
    let fileURL = Bundle.main.url(forResource: resourceName, withExtension: "txt")
    do {
        let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
        let inputArray = content.components(separatedBy: "\n")
        return inputArray
    } catch {
        print(error)
    }
    return []
}

func getPuzzleAnswer1(inputArray: [String]) -> Int {
    var horizontal = 0
    var depth = 0
    for input in inputArray {
        input.contains("forward") ?  horizontal += Int(input.number)! : nil
        input.contains("down") ?  depth += Int(input.number)! : nil
        input.contains("up") ?  depth -= Int(input.number)! : nil
    }
    return horizontal * depth
}

func getPuzzleAnswer2(inputArray: [String]) -> Int {
    var horizontal = 0
    var depth = 0
    var aim = 0
    
    for input in inputArray {
        if input.contains("forward") {
            horizontal += Int(input.number)!
            depth += aim * Int(input.number)!
        }
        if input.contains("down") {
            aim += Int(input.number)!
        }
        if input.contains("up") {
            aim -= Int(input.number)!
        }
    }
    
    return horizontal * depth
}

var reportArray = getData("ResourceData2")

print(String(getPuzzleAnswer1(inputArray: reportArray)))
print(String(getPuzzleAnswer2(inputArray: reportArray)))



