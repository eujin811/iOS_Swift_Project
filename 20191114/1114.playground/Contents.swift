import UIKit


// [ 과제 ]

/*
1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
 func combineString(str1: String?, str2: String?, str3: String?) -> String {
   // code
 }
 // 입력 예시 및 결과
 combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
 combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"
 */

func combineString(str1: String?, str2: String?, str3: String?) -> String {
    var stringArray = [String]()
    var returnString: String
    if str1 != nil {
        stringArray.append(str1!)
    }
    if str2 != nil {
        stringArray.append(str2!)
    }
    if str3 != nil {
        stringArray.append(str3!)
    }
    
    returnString = stringArray.joined()
    return returnString
}

combineString(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
combineString(str1: "AB", str2: nil, str3: "EF")    // "ABEF"


/*
 2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
 enum Arithmetic {
   case addition, subtraction, multiplication, division
 }
 */

enum Arithmetic {
    case addition, subtraction, multiplication, division
    
}

func calculator(type: Arithmetic, num1: Int, num2: Int) -> Int{
    switch type {
    case .addition:
       return num1 + num2
    case .subtraction:
        return num1 - num2
    case .multiplication:
        return num1 * num2
    case .division:
        return num1 / num2
    }
}
calculator(type: .addition, num1: 2, num2: 5)
calculator(type: .multiplication, num1: 2, num2: 5)

// [ 도전 과제 ]
/*
 1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
 각 케이스에는 Double 타입의 Associated Value 를 받도록 함
 추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
 섭씨 = (화씨 - 32) * 5 / 9
 섭씨 = 켈빈 + 273
  */

enum Tempurature {
    case celcius       //섭씨
    case fahrenheit    //화씨
    case kelvin        //캘빈
    
    mutating func toCelcius(temp: Double) -> Double{
        switch self {
        case .fahrenheit:
            return (temp - 32) * 5 / 9
        case .kelvin:
            return temp + 273
        case .celcius:
            return temp
        }
    }
   
    
}

var convertTem = Tempurature.fahrenheit
convertTem.toCelcius(temp: 231.5)

var convertTemKe = Tempurature.kelvin
convertTemKe.toCelcius(temp: 21)

var convertNot = Tempurature.celcius
convertNot.toCelcius(temp: 27)







 //2. 다음 ArithmeticExpression 의 각 케이스별로 연산을 수행하고 그 값을 반환하는 evaluate 함수 구현

indirect enum ArithmeticExpression {
   case number(Int)
   case addition(ArithmeticExpression, ArithmeticExpression)
   case multiplication(ArithmeticExpression, ArithmeticExpression)
    
//    mutating func addition(num1: Int, num2: Int) -> Int{
//        return num1 + num2
//    }
    
//    mutating func multiplication(num1: Int, num2: Arithmetic){
//
//    }
    
    mutating func evaluate(num1: Int, num2: Int) -> Int{
        switch self {
        case .addition(.number(num1), .number(num2)):
           return num1 + num2
        case .multiplication(.number(num1), .number(num2)):
           return num1 * num2
        default:
            return 0
        }
    }
 }
 let five = ArithmeticExpression.number(5)
 let four = ArithmeticExpression.number(4)
 let sum = ArithmeticExpression.addition(five, four)

 let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
 func evaluate(_ expression: ArithmeticExpression) -> Int {
   // 코드
    
    return 0
 }
 evaluate(five)    // 결과 : 5
 evaluate(sum)     // 결과 : 9
 evaluate(product) // 결과 : 18
 
 





