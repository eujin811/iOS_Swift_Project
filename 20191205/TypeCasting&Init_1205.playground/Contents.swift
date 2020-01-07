import UIKit

/*
 Type Casting
 [ 과제 ]
 1.
 func addTwoValues(a: Int, b: Int) -> Int {
 return a + b
 }
 let task1: Any = addTwoValues(a: 2, b: 3)
 위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것
 task1 + task1
 */



func addTwoValue(a: Int, b: Int) -> Int {
    return a + b
}

let task1: Any = addTwoValue(a: 2, b: 3)

if task1 is Int {
    let sumTask = (task1 as! Int) + (task1 as! Int)
}

let casting = task1 as? Int

//func addTwoValues(a: Int, b: Int) -> Int {
//    return a + b
//}
//
//let task1: Any = addTwoValues(a: 2, b: 3)
//
//task1
//type(of: task1)
//
//if task1 is Int {
//    let sumTask = (task1 as! Int) + (task1 as! Int)
//}
//
//let casting = task1 as? Int



/*
 [ 도전 과제 ]
 1.
 let task2: Any = addTwoValues
 과제 1번에 이어 이번에는 위와 같이 정의된 task2 변수에 대해
 두 변수의 더하기 연산이 제대로 동작하도록 할 것
 (addTwoValues의 각 파라미터에는 원하는 값 입력)
 task2 + task2
 */

var task3: Any = addTwoValue(a: 5, b: 7)

var sumTesk2 = (task3 as! Int) + (task3 as! Int)


var task2: Any = ({ (s1: Int, s2: Int) in
    s1 + s2
})(2,3)

type(of: task2)
//var sumTesk = task2(s1: 3, s2: 5) as! Int
var sumTesk = (task2 as! Int) + (task2 as! Int)


/*
 2.
 class Car {}
 let values: [Any] = [
 0,
 0.0,
 (2.0, Double.pi),
 Car(),
 { (str: String) -> Int in str.count }
 ]
 위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
 for value in values {
 switch value {
 // Code 구현
 }
 }
 */


class Car5 {}
let values5: [Any] = [
    0,
    0.0,
    (2.0, Double.pi),
    Car5(),
    { (str: String) -> Int in str.count }
]

for data in values5 {
    switch data {
    case _ where data is Int :
        print(data," int")
    case _ where data is Double :
        print(data," Double")
    case _ where data is Car5 :
        print(data," Car5")
    case _ where data is (String) ->Int :
        print(data," (String) -> Int")
    default:
        print(data, "튜플타입")
    }
}


class Car2 {}
let values: [Any] = [
    0,
    0.0,
    (2.0, Double.pi),
    Car2(),
    { (str: String) -> Int in str.count }
]
//위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
for value in values {
    switch value {
    // Code 구현
    case let valueType where ((valueType as? Int) != nil):
        print(valueType)
    case let valueType where ((valueType as? Double) != nil):
        print(valueType)
    case let valueType where ((valueType as? (Double, Double)) != nil):
        print(valueType)
    case let valueType where ((valueType as? Car2) != nil):
        print(valueType)
    case let valueType where ((valueType as? (String) -> Int) != nil):
        print(valueType)
    default:
        print("default",value)

    }
    
}

/*
 Initializer
 [ 과제 ]
 1. 생성자 구현
 - Vehicle 클래스에 지정 이니셜라이져(Designated Initializer) 추가
 - Car 클래스에 modelYear 또는 numberOfSeat가 0 이하일 때 nil을 반환하는 Failable Initializer 추가
 - Bus 클래스에 지정 이니셜라이져를 추가하고, maxSpeed를 100으로 기본 할당해주는 편의 이니셜라이져 추가
 class Vehicle {
 let name: String
 let maxSpeed: Int
 }
 class Car: Vehicle {
 var modelYear: Int
 var numberOfSeats: Int
 }
 class Bus: Vehicle {
 let isDoubleDecker: Bool
 }
 */
class Vehicle2 {
    let name: String
    let maxSpeed: Int
    
    init(name: String, maxSpeed: Int) {
        self.name = name
        self.maxSpeed = maxSpeed
    }
   
}
class jinCar: Vehicle2 {
    var modelYear: Int
    var numberOfSeats: Int
    

    
    init? (modelYear: Int, numberOfSeats: Int, name: String, maxSpeed: Int) {
        guard numberOfSeats > 0 || modelYear > 0 else { return nil }
        self.numberOfSeats = numberOfSeats
        self.modelYear = modelYear
        
        super.init(name: name, maxSpeed: maxSpeed)
    }
}


class Bus2: Vehicle2 {
  let isDoubleDecker: Bool
  init(name: String, maxSpeed: Int, isDoubleDecker: Bool) {
    self.isDoubleDecker = isDoubleDecker
    super.init(name: name, maxSpeed: maxSpeed)
  }
  
  convenience init(name: String, isDoubleDecker: Bool) {
    self.init(name: name, maxSpeed: 100, isDoubleDecker: isDoubleDecker)
  }
}



class Vehicle {
    let name: String
    var maxSpeed: Int
    
    init(){
        self.name = "김김이"
        self.maxSpeed = 200
    }
    //    init(name: String){
    //        self.name = name
    //        self.maxSpeed = 200
    //    }
    init(maxSpeed: Int) {
        self.maxSpeed = maxSpeed
        self.name = "큐큐야"
    }
    //    init(name: String, maxSpeed: Int){
    //        self.name = name
    //        self.maxSpeed = maxSpeed
    //    }
    
}

class Car: Vehicle {
    let modelYear: Int
    let numberOfSeats: Int
    
    init?(modelYear: Int, numberOfSeats: Int) {
        guard numberOfSeats < 0 || modelYear > 0 else {return nil}
        
        self.modelYear = modelYear
        self.numberOfSeats = numberOfSeats
        
        super.init()
    }
}


//- Bus 클래스에 지정 이니셜라이져를 추가하고, maxSpeed를 100으로 기본 할당해주는 편의 이니셜라이져 추가
class Bus: Vehicle {
    let isDoubleDecker: Bool
    
    override init(){
        self.isDoubleDecker = true
        super.init()
    }
    init(isDoubleDecker: Bool) {
        self.isDoubleDecker = isDoubleDecker
        super.init()
    }
    
    convenience override init(maxSpeed: Int) {
        self.init(isDoubleDecker: true)
        self.maxSpeed = maxSpeed
        //        super.maxSpeed = maxSpeed
    }
    
    
}
