import UIKit

import UIKit

//: [Previous](@previous)
/*:
 # Practice
 */
/*:
 ---
 ## Conditional Statements
 ---
 */
/*
 - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
 - 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
 - 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
   (switch where clause 를 이용해 풀어볼 수 있으면 해보기)
 */

///1
func subFun(_ sub:Float) -> String {
    
    switch sub {
    case 4.5:
        return "A+"
    case 4.0..<4.5:
        return "A"
    case 3.5..<4.0:
        return "B+"
    case 3.0..<3.5:
        return "B"
    case 2.5..<3.0:
        return "C+"
    case 2.0..<2.5:
        return "C"
    default:
        return "F"
    }
    
}
print(subFun(4))

//2
func monthFunc(month:Int) -> String {
    switch month {
    case 1:
        return "January"
    case 2:
        return "February"
    case 3:
        return "March"
    case 4:
        return "April"
    case 5:
        return "may"
    case 6:
        return "Jun"
    case 7:
        return "July"
    case 8:
        return "Aug"
    case 9:
        return "Sep"
    case 10:
        return "Oct"
    case 11:
        return "Nov"
    default:
        return "Dec"
    }
}

monthFunc(month: 1)

//3세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
//(switch where clause 를 이용해 풀어볼 수 있으면 해보기)
func numThree(num1:Int, num2:Int, num3:Int) -> Bool{
    if(num1*num2*num3 > 0){
        return true
    }
    else{
        return false
    }
  
}

numThree(num1: 1, num2: -1, num3: 7)
/*:
 ---
 ## Loops
 ---
 */
/*
 반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.
 - 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
   (Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
   ex) 5! = 5 x 4 x 3 x 2 x 1
 - 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
   (2, 5 를 입력한 경우 결과는 2의 5제곱)
 - 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
   (1234 인 경우 각 자리 숫자를 합치면 10)
 */


//1자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수

func factorialFun(numf:Int) -> Int{
    var fc = 1
    for i in 1...numf{
        fc *= i
    }
    return fc
}

factorialFun(numf: 8)

//자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
func square(numS1:Int, numS2:Int) -> Int{
    var sum = 1
    for _ in 1...numS2{
        sum *= numS1
    }
    return sum
}

print(square(numS1: 2, numS2: 5))

//자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
//몫

func numMulti(num:Int) -> Int{
    var sum = 0
    var num = num
    
    while true{
        sum += num%10
        num /= 10
        if num<10{
            return sum
        }
    }
    return sum
}
numMulti(num: 235)
/*:
 ---
 ## Control Transfer
 ---
 */
/*
 - 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
   그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
 - 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
 */

/*자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수*/
func sumAll(num:Int) -> Int{
    var sum = 0
    
    for i in 1...num{
        sum += i
        if sum>2000{
            return sum
        }
    }
    return sum
}

sumAll(num: 100)

//1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수

func numOutput() {
    for i in 1...50{
        if i>=20 && i<=30{
            continue
        }
        print(i)
    }
}
numOutput()
//: [Next](@next)


