import UIKit

/*1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
   구현 내용은 자유롭게
 
 ** 강아지 (Dog)
 - 속성: 이름, 나이, 몸무게, 견종
 - 행위: 짖기, 먹기
 
 ** 학생 (Student)
 - 속성: 이름, 나이, 학교명, 학년
 - 행위: 공부하기, 먹기, 잠자기
 
 ** 아이폰(IPhone)
 - 속성: 기기명, 가격, faceID 기능 여부(Bool)
 - 행위: 전화 걸기, 문자 전송
 ** 커피(Coffee)
 - 속성: 이름, 가격, 원두 원산지
 */

class Coffee{
    var name: String
    var price: Int
    var madeBy: String
    
    init(name: String, price: Int, madeBy: String) {
        self.name = name
        self.price = price
        self.madeBy = madeBy
    }
    
    var nameSetGet: String {
        get {
            return name
        }
        set {
            name = newValue
        }
    }
}

class iPhone{
    var modelName: String
    var price: Int
    var faceID: Bool
    
    init(modelName: String, price: Int, faceID: Bool) {
        self.modelName = modelName
        self.price = price
        self.faceID = faceID
    }
    
    func call(){
        print("전화건다.")
    }
    func message(){
        print("문자 보낸다")
    }
}

class Student{
    var name: String
    var age: Int
    var school: String
    var grade: Int
    
    init(name: String, age: Int, school: String, grade: Int) {
        self.name = name
        self.age = age
        self.school = school
        self.grade = grade
    }
    
    func study() {
        print("공부하다.")
    }
    func eating() {
        print("먹다.")
    }
    func sleep() {
        print("잔다.")
    }
}


class Dog{
    var name: String
    var age: Int
    var weight: Int
    var species: String
    
    init(name: String, age: Int, weight: Int, species: String) {
        self.name = name
        self.age = age
        self.weight = weight
        self.species = species
    }
    
    func howl() {
        print("\(name)이 짖는다.")
    }
    
    func eating() {
        print("\(name)이 짖는다.")
    }
//    var eating
}

let poppy = Dog.init(name: "tory", age: 3, weight: 4, species: "marti")
poppy.howl()



/*
2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
 
 ** 계산기 (Calculator)
 - 속성: 현재 값
 - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
 
 ex)
 let calculator = Calculator() // 객체생성
 
 calculator.value  // 0
 calculator.add(10)    // 10
 calculator.add(5)     // 15
 
 calculator.subtract(9)  // 6
 calculator.subtract(10) // -4
 
 calculator.multiply(4)   // -16
 calculator.multiply(-10) // 160
 
 calculator.divide(10)   // 16
 calculator.reset()      // 0
 */
class Calculator{
    var present: Int = 0
//    var num1: Int
//    var num2: Int
    

    func add(num1: Int) -> Int{
        present += num1
        return present
    }
    func sub(num1: Int) -> Int {
        present -= num1
        return present
    }
    func multiply(num1: Int) -> Int {
        present *= num1
        return present
    }
    func divide(num1: Int) -> Int{
        return (present/num1)
    }
    func reset() -> Int{
        present = 0
        return present
    }
}

//3. 첨부된 그림을 참고하여 각 도형별 클래스를 만들고 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
class Square{
    //넓이 = 변의 제곱, 변 = 한변*4
    var side: Int
    
    init(side: Int) {
        self.side = side
    }
    
    func area() -> Int {
        return side*side
    }
    func circumference() -> Int {
        return side*4
    }
}

class Rectangle{
    //넓이 = 가로*세로 , 변 = 가로*세로*2
    var weight: Int
    var langth: Int
    
    init(weight: Int, langth: Int) {
        self.weight = weight
        self.langth = langth
    }
    
    func area() -> Int{
        return weight*langth
    }
    func circumference() -> Int{
        return weight*langth*2
    }
}
var rec = Rectangle.init(weight: 2, langth: 3)
rec.area()

class Circle{
    //넓이 = 파이*반지름*바지름, 변 =. 2*파이*반지름
    var radius: Double
    var pi = 3.14
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double{
        return pi*radius*radius
    }
    func cirumference() -> Double {
        return 2*pi*radius
    }
}

class Triangle{
    //넓이 (밑변*높이)/2
    var weight: Int
    var height: Int
    
    init(weight: Int, height: Int) {
        self.weight = weight
        self.height = height
    }
    
    func area() -> Int{
        return (weight*height)/2
    }
}

class Trpezoid{
    //넓이 (및변 + 윗변)*높이/2
    var bottomSide:Int
    var topSide:Int
    var height: Int
    
    init(bottomSide: Int, topSide: Int, height: Int) {
        self.bottomSide = bottomSide
        self.topSide = topSide
        self.height = height
    }
    
    func area() -> Int{
        return (bottomSide+topSide)*height/2
    }
}

class Cube{
    //부피 = 변*변*변
    var radius: Int
    init(radius: Int) {
        self.radius = radius
    }
    
    func bulk() -> Int{
        return radius^3
    }
}

class RectanglarSolid{
    //부피 =가로*세로* 높이
    var weight: Int
    var langth: Int
    var height: Int
    
    init(weight: Int, langth: Int, height: Int) {
        self.height = height
        self.weight = weight
        self.langth = langth
    }
    
    func bulk() -> Int {
        return height*weight*langth
    }
}

class CircularCylinder{
    //파이 * 반지름^2 * 높이
    var pi = 3.14
    var radius: Double
    var height: Double
    
    init(radius: Double, height: Double) {
        self.radius = radius
        self.height = height
    }
    
    func bulk() -> Double{
        return pi*radius*radius*height
    }
    
}

class Sphere{
    //부피 = (4/3)파이*반지름^3
    var pi = 3.14
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    func bulk() -> Double{
        return (4/3)*pi*radius*radius*radius
    }
}

class Cone{
    //부피 = (1/3)파이*반지름^2*높이
    var pi = 3.14
    var radius: Double
    var height: Double
    
    init(radius: Double, height: Double) {
        self.radius = radius
        self.height = height
    }
    
    func bulk() -> Double{
        return (1/3)*pi*radius*radius
    }
}
