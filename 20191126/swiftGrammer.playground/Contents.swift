////import UIKit
////
////
//////딕셔너리
//////var airports = [String: String?]()
//////airports["ICN"] = "Inchon International Airport"
//////airports["ICN"] = nil
//////
////////프로토콜
//////protocol ExampleProtocol {
//////    var simpleDescripton : String {get}
//////    mutating func adjust()
//////}
//////
//////func getGasPrices() -> (Double, Double, Double) {
//////    return (3.59, 3.69, 3.79)
//////}
//////getGasPrices()
//////
////////클로저
//////let numbers = [Int]()
//////numbers.map({
//////    (number:Int) -> Int in
//////    let result = 3 * number
//////    return result
//////})
//////
////////swfit 다중상속 지원x
//////
////////멀티라인
//////let pr = """
//////kkk
//////kk
//////lol
//////"""
//////pr
//////
//////var langSwift = "swift"
////////for char in langSwift.characters
//////
//////var n = 1024
//////repeat {
//////    n = n * 2
//////}
//////while n < 1000
//////
//////print("n = \(n)")
//////
//////
////////guard if
//////func divideGuard(base: Int){
//////    guard base != 0 else {
//////        print("연산할 수 없습니다.")
//////        return
//////    }
//////
//////    let result = 100 / base
//////    print(result)
//////
//////}
//////
//////let sampleChar : Character = "a"
//////
//////switch sampleChar{
//////case "a":
//////    print("a")
//////    fallthrough
//////case "A":
//////    print("글자는 A 입니다.")
//////default :
//////    print("일치하는 글자가 없습니다.")
//////}
////
////
////var value = (2,3)
////
////switch value {
////case (0..<2, 3) :
////    print("범위 a")
////case (2..<5, 0..<3) :
////    print("범위 b")
////case (2..<5, 3..<5) :
////    print("범위 c")
////default :
////    print("범위 D 포함")
////}
////
////outer: for i in 1...5 {
////    inner : for j in 1...9{
////        if (j==3) {
////            break outer
////        }
////
////        print("\(i) x \(j) =\(i*j)")
////    }
////}
////
////class Mom{
////    var tribe = "사람"
////    var gender = "female"
////
////    init(tribe:String, gender:String){
////        self.tribe = tribe
////        self.gender = gender
////    }
////}
////
////class Car{
////
////}
////
////class Sum{
////    //프로퍼티
////    let num1: Int
////    let num2: Int
////
////    //초기화구문
////    init(num1: Int, num2: Int){
////        self.num1 = num1
////        self.num2 = num2
////    }
////
////    //메소드
////    func add() -> Int{
////        return num1 + num2
////    }
////
////}
////
//////var addSum = su
////var first = Sum(num1: 15, num2: 23)
////first.add()
////
////var se = Sum(num1: 23, num2: 33)
////se.add()
////
////first.add()
////let button = UIButton()
////
////let f = { () -> Void in
////    print("클로저 실행")
////}
////f()
////
////({ () -> Void in
////    print("두번째 클로저 실행")
////})()
////
////let c = { (s1: Int, s2: String) -> Void in
////    print("s1: \(s1), s2:\(s2)")
////}
////c(1, "kkk 세번쨰 클로저")
////
////({ (s1: String, s2: Int) -> Void in
////    print(s1,s2)
////})("네번째 클로저",4)
////
////func divide(base: Int, success s: () -> Void) -> Int{
////    defer {
////        s()
////    }
////    return 100 / base
////}
////
////divide(base: 100){ () in
////    print("연산성공")
////}
//
//
////func divide(base: Int, success s: () -> Void, fail f: () -> Void) -> Int {
////    guard base != 0 else {
////        f()
////        return 0
////    }
////
////    defer {
////        s()
////    }
////    return 100/base
////}
////
////divide(base: 100, success: { () in
////    print("연산 성공")
////}) { () in
////    print("연산 실패")
////}
////
////struct Job{
////    var income: Int = 0{
////        willSet(newIncome){
////            print("이번달 월급 \(newIncome)")
////        }
////        didSet{
////            if income > oldValue{
////                print("월급 \(income - oldValue)원 증가 소득세 상향")
////            }
////            else{
////                print("월급 삭감!")
////            }
////        }
////    }
////}
//
//enum HTTPCode: Int{
//    case OK = 200
//    case NOT_MODIFY = 304
//    case INCORRECT_PAGE = 404
//    case SERVER_ERROR = 500
//
//    var value: String{
//        return "HTTPCode number is \(self.rawValue)"
//    }
//
//    func getDescription() -> String{
//        switch self {
//        case .OK:
//            return "응답 성공. HTTP 코드 \(self.rawValue)"
//        case .NOT_MODIFY:
//            return "변경내역 없음. \(self.rawValue)"
//        case .INCORRECT_PAGE :
//            return "존재하지 않는 페이지. \(self.rawValue)"
//        case .SERVER_ERROR :
//            return "서버 오류입니다. \(self.rawValue)"
//        }
//    }
//    static func getName() -> String{
//        return "This Enumeration is HTTPCode"
//    }
//}
//
////enum Rank: Int {
////    case one = 1
////    case two, three, four, five
////}
////Rank.one.rawValue
////Rank.two.rawValue
//
//

/*
class ComplexCalculate{
    var a : Int
    var b : Int
    
    init(a: Int, b:Int) {
        self.a = a
        self.b = b
    }
    
    func sum () -> Int{
        return a + b
    }
    func substraction () -> Int {
        return a - b
    }
    func multiple () -> Int{
        return a * b
    }
    func division () -> Int{
        return a / b
    }
}

class poopoo: ComplexCalculate{
    
    override func division() -> Int {
        return a % b
    }
    
}

*/

protocol SomeProperyProtocol {
    var name: String {get set}
    var description: String {get}
}
class RubyMember: SomeProperyProtocol{
 var name = "dd"
    var description: String{
        return "name:ddd"
    }
}




