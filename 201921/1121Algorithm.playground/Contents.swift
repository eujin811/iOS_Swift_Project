import UIKit


//1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
//e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2
func gause(num: Int) -> Int{
    var sum = 0
    let inputNum = num

    for _ in 1...inputNum/2{
        sum += 1+inputNum
    }
    if inputNum%2 != 0{
        sum += (inputNum/2)+(inputNum%2)
    }

    
    return sum
}

gause(num: 5)

//2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
//e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...

func three(num: Int){

    for i in 1...num{
        let numArr = Array(String(i))
        let compar = numArr.endIndex-1
        let lastNum = Int(String(numArr[compar]))
        if (lastNum! % 3) == 0 && lastNum! != 0{
            print("*")
            continue
        }
        print(i)
    }
}
three(num: 16)


//3. 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
//e.g.  Input : 6, 9   ->  Output : 18, 3
// 최대공약수
// 1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
// 2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복
// 최소 공배수
// - 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수
func common(num1: Int, num2: Int){
    var max = 0, min = 0
    let least = num2 * num1       //최소공배수
    if( num1 > num2){
        max = num1
        min = num2
    }else{
        max = num2
        min = num1
    }
    
    if(max / min == 0){
        print("최대 공약수: \(num2)")
        print("최소 공배수: \(num1)")
        return
    }else{
        while min != 0 {
            let r = max % min
            max = min
            min = r
        }
        print("최대 공약수: \(max) 최소 공배수 \(least / max)")

    }
    
    
}
common(num1: 12, num2: 15)
