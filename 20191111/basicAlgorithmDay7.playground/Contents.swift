import UIKit


//[과제]

/*1. 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
(1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)*/


func numConnection(num1:Int , num2:Int) -> Int{
    let connec = String(num1) + String(num2)
    return Int(connec)!
}

numConnection(num1: 29, num2: 3)



/*2.  - 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수*/
func compareString(comString1:String, comString2:String){
    if comString1 == comString1{
        print("두 문자열은 같다.")
    }
    else{
        print("두 문자열은 다르다.")
    }
}

compareString(comString1: "안녕", comString2: "안녕")


//3. - 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수

func subMulti(num:Int){
    
    print("1 \n2")
    for i in 3...num{
        if i % 2 == 0{
            continue
        }
        if num%i == 0{
            print(i)
        }
    }
}
subMulti(num: 30)

//4. - 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
print("4. 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수")
func commonMulti(){
    
    for i in 1...100{
        if i%2 == 0 || i==0 || i==1{
            continue
        }
        
        if i%3 == 0 && i%5 == 0{
            print(i)
        }
    }
}

commonMulti()
//[도전과제]

//1. - 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수\
//1과 자기 자신만으로 나누어지는 양의정수

print("도전과제 1")

func minority(num:Int){
    
    if num <= 2{
        print("2보다 큰 수를 입력하라.")
        return
    }
    
    for i in 3...num{
        if num%2 == 0 {
            print("소수가 아닙니다. 2 \(i)")
//            continue
            return
        }

            if (i != num) && (num % i == 0){
                print("소수가 아닙니다. \(i)")
//                continue
                return
            }
        if i==num{
            print("소수입니다.")
        }
        
    }
}
minority(num: 17)

/*2. 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력*/

//입력받은 숫자 index

/*3. 정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
(공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
    윤년X 예시 - 200, 300, 500, 600, 1900, 2100*/
