//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//MARK: Nested functions

func makeIncrementer() -> Int {
    var y = 10
    
    func add () {
        y += 5
    }
    
    add()
    
    return y
}

makeIncrementer()

//sending fucntion as argument

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

hasAnyMatches(list: [20, 8, 7], condition: lessThanTen)

//MARK: Error handling
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func sendJob(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    
    return "Job sent"
}

//1
do {
    let printerResponse = try sendJob(job: 1000, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

//2
let printerSuccess = try? sendJob(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? sendJob(job: 1885, toPrinter: "Never Has Toner")

//MARK: FUNCTIONAL PROGRAMMING
/******************** FUNCTIONAL PROGRAMMING ***********************/
// Or called as Higher order functions
//MAP
let arrayOfInt = [2,3,4,5,4,7,2]
let newMappedArr = arrayOfInt.map { value -> Int in
    return value * 10
}
newMappedArr

let bookAmount = ["harrypotter" : 100.0, "junglebook" : 100.0]
let newMappedDict = bookAmount.map { (key, val) -> String in
    return key.capitalized
}
newMappedDict

//Filter

let newFIlteredArr = arrayOfInt.filter { value -> Bool in
    value < 10
}
newFIlteredArr

//REDUCE
let newReducedArr = arrayOfInt.reduce(0) { (result, value) -> Int in
    return result + value
}

newReducedArr

//Flat MAP
let codes = [["abc", "def"], ["ghi", "jkl"]]
let newCodes = codes.flatMap {
    $0.map({$0.uppercased()})
}
newCodes

//CHAINING ALL
let years = [1989, 1992, 2003, 1970, 2014, 2001, 2015, 1990, 2000, 1999]
let sum = years.filter({ $0 >= 2000 }).map({ 2017 - $0 }).reduce(0, +)
print(sum)
// Output: 52

let compArr = [1, 5, nil, 5, 9]
let newCompArr = compArr.compactMap { eachVal in
    return eachVal
}
newCompArr

let arrayWithNoOptionals = ["1", "two", "3"].compactMap { Int($0) }
print(arrayWithNoOptionals) // [1, 3]

//Sorted
let sortedNumbers = [3, 1, 5, 6, 2, 4].sorted { $0 < $1 }
print(sortedNumbers)

//FOR EACH
let logs = ["Error", "Created", "Crashed"]
logs.forEach { print($0) }

/******************************************/

//MARK: Sequence - Iterators

class FibonacciIterator: IteratorProtocol {
    var nextValues = (0, 1)
    var stopsAt: Int
    var iterationsCount = 0
    
    init(iteratorLength: Int) {
        stopsAt = iteratorLength
    }
    
    func next() -> Int? {
        guard iterationsCount<stopsAt else {
            return nil
        }
        iterationsCount += 1
        
        let next = nextValues.0
        nextValues = (nextValues.1,nextValues.0+nextValues.1)
        return next
    }
}

class FibonacciSequence: Sequence {
    var stopsAt: Int
    
    init(sequenceLength: Int) {
        stopsAt = sequenceLength
    }
    
    func makeIterator() -> FibonacciIterator {
        return FibonacciIterator(iteratorLength: stopsAt)
    }
}

let arr = Array(FibonacciSequence(sequenceLength: 10))

for f in arr {
    print("fibo: \(f)")
}

//MARK: EQUATABLE / Comparable protocol
//1
struct Person: Comparable {
    var name: String
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.name < rhs.name
    }
}

let taylor = Person(name: "Taylor Swift")
let justin = Person(name: "Justin Bieber")
print("Comparable protocol:\(taylor < justin)")

//2
struct Country {
  let name: String
  let capital: String
  var visited: Bool
}

extension Country: Equatable {
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.name == rhs.name &&
            lhs.capital == rhs.capital &&
            lhs.visited == rhs.visited
    }
}

let canada = Country(name: "Canada", capital: "Ottawa", visited: true)
let australia = Country(name: "Australia", capital: "Canberra", visited: false)
let bucketList = [australia]

let visited = Country(name: "Australia", capital: "Canberra", visited: true)
let unvisited = Country(name: "Australia", capital: "Canberra", visited: false)

visited == australia       // false
unvisited == australia

bucketList.contains(canada)

//Comparable

extension Country: Comparable {
    static func < (lhs: Country, rhs: Country) -> Bool {
        return lhs.name < rhs.name ||
            (lhs.name == rhs.name && lhs.capital < rhs.capital) ||
            (lhs.name == rhs.name && lhs.capital == rhs.capital && rhs.visited)
    }
}

bucketList.sorted()


//MARK: Options set

struct PossibleExits: OptionSet {
    let rawValue: Int
    
    static let North = PossibleExits(rawValue: 1)
    static let East = PossibleExits(rawValue: 1 << 1)
    static let South = PossibleExits(rawValue: 1 << 2)
    static let West = PossibleExits(rawValue: 1 << 3)
}

struct GateRoom {
    var exits: PossibleExits = [.East]
    
    mutating func pullLever() {
        if exits.contains(.West) {
            exits.subtract(.West)
            print("The gate closes")
        }
        else {
            print("The gate opens")
            exits.union(.West)
        }
    }
}

var gateRoom = GateRoom()
gateRoom.pullLever()
gateRoom.pullLever()

//MARK: Simple pattern matching

enum Suspect: CustomStringConvertible {
    case Person(name: String)
    case Robot(registrationNumber: Int)
    case Animal(name: String, species: String)

    var description: String {
      switch self {
      case let .Person(name):
        return "A person named \(name)"
      case let .Robot(registrationNumber):
        return "A robot with registration #\(registrationNumber)"
      case let .Animal(name, species):
        return "An animal (\(species)) named \(name)"
      }
    }
}

extension Array {
    func randomElement() -> Iterator.Element {
    return self[Int(arc4random_uniform(UInt32(self.count)))]
  }
}

var suspects = [
  Suspect.Person(name: "Mic"),
  Suspect.Person(name: "Brian"),
  Suspect.Person(name: "Ray"),
  Suspect.Animal(name: "Flappy", species: "Bird"),
  Suspect.Animal(name: "Furball", species: "Cat"),
  Suspect.Animal(name: "Bobo", species: "Doge"),
  Suspect.Animal(name: "Sushi", species: "Doge"),
  Suspect.Robot(registrationNumber: 42),
  Suspect.Robot(registrationNumber: 2001)
]

for case let .Animal(name, species) in suspects where species == "Doge"{
    print("Got species \(species) named \(name)!")
}

let randomSuspect = suspects.randomElement()

if case .Person(let name) = randomSuspect {
  print("Begin investigation of suspect named \(name)...")
}
else if case .Robot(let registrationNumber) = randomSuspect, registrationNumber > 100 {
  print("Begin investigation of robot #\(registrationNumber)...")
}
else {
  print("Not an interesting suspect; try again!")
}

//MARK: Protocol extensions

protocol Monster {
    var name: String { get set }
}

extension Monster {
    func destroy(city:String) {
        print("\(name) destroyed \(city)")
    }
}

struct PlatedMonster: Monster {
    var name = ""
}

struct FlyingMonster: Monster {
    var name = ""
}

var godzilla = PlatedMonster(name:"Godzilla")
var rodan = FlyingMonster(name:"Rodan")
godzilla.destroy(city: "Tokyo")
rodan.destroy(city: "New York City")

//MARK: Custom Operators
//Prefix operator

prefix operator √

prefix func √(inValue: Double) -> Double {
    return sqrt(inValue)
}

let sqRootVal = √25
print(sqRootVal)

//infix operator

precedencegroup SquareSumOperatorPrecedence {
    lowerThan: MultiplicationPrecedence
    higherThan: AdditionPrecedence
    associativity: left
    assignment: false
}
infix operator ◉: SquareSumOperatorPrecedence
func ◉<T: Numeric>(lhs: T, rhs: T) -> T { //mentioning infix is not necassary
    return lhs*lhs + rhs*rhs
}

let lhsVal = 5.0
let rhsVal = 6.0
let sumSqrVal = lhsVal ◉ rhsVal
print("sumSqrVal: \(sumSqrVal)")

//postfix operator

postfix operator +==

postfix func +==<T: Numeric>(inVal: T) -> T {
    return inVal + 1
}

let sumVal = 8+==
print("SumVal: \(sumVal)")


//MARK: Protocol with Generics

protocol Stackable {
    associatedtype T: Comparable //associated type is nothing but protocol with Generic
    func push(_ element: T)
    func pop() -> T?
}

class Stack<T>: Stackable where T: Comparable {
    private var storage: [T] = []
    func push(_ element: T) {
        storage.append(element)
    }
    func pop() -> T? {
        return storage.popLast()
    }
}

var stack1 = Stack<Int>()
stack1.push(13)
stack1.push(3)
stack1.pop()

var stack2 = Stack<Int>()

func pushToAll<S: Stackable>(stacks: [S], value: S.T) {
    stacks.forEach {$0.push(value)}
}

pushToAll(stacks: [stack1, stack2], value: 4)

dump(stack1)
dump(stack2)
