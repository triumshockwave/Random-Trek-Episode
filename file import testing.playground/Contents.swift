import Cocoa
var fileContent = ""

let filePath = NSString(string:"~/Desktop/tos.txt").expandingTildeInPath
do {
    fileContent = try NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue) as String
} catch  {
    print("Error reading file")
}

print(fileContent)
let lines = fileContent.components(separatedBy: "\n")
print(lines[1])
for field in lines[1].components(separatedBy: "\t") {
    print(field)
}
