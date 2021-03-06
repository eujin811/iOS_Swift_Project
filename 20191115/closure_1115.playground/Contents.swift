import UIKit

// [ 자율 학습 ]
// 1. 지난 과제에서 함수를 이용해 풀었던 문제를 클로저로 변형해서 풀어보기
 

//2. 클로저 Full Syntax <-> Optimized Syntax 변환 연습
 

//[ 과제 ]
 //1. 객체 지향 프로그래밍 (Object-Oriented Programming) 에 대해 예습하기


//[ 도전 과제 ]
 //1. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

 let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
   let isAscending: Bool
   if s1 > s2 {
     isAscending = true
   } else {
     isAscending = false
   }
   return isAscending
 }
 
let somClosure2: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
        return s1 > s2
        }

let somClosure3: (String, String) -> Bool = { (s1: String, s2: String) in
    return s1 > s2
}

let somClosure4: (String, String) -> Bool = { (s1, s2) in return s1 > s2}

let somClosure5: (String, String) -> Bool = { return $0 > $1 }
let somClosure6: (String, String) -> Bool = { $0 > $1 }
let somClosure7: (String, String) -> Bool = (>)
//{(s1, s2) in return s1 > s2}



 let someClosure1: (String, String) -> Bool = { $0 > $1 }
someClosure("hi","haha")



//2
/*
 let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
   var count: Int = 0
   for _ in values {
     count += 1
   }
   return count
 }
 */
let otherClosure: ([Int]) -> Int = { $0.count}
otherClosure([1,2,3])
 


