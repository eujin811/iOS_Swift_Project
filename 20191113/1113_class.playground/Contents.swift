import UIKit

/*
 [ 실습 문제 ]
 */

/*
 <1>
 [보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
 위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
 스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
 */
var likeFruit = ["철수": "apple", "영희": "banana", "진수": "grape", "미희": "strawberry"]
//if likeFruit.contains(where: { (<#(key: String, value: String)#>) -> Bool in
//    return value == "i"
//})

for (_ , value) in likeFruit{
    if value.contains("e"){
        print(value)
    }
}

/*
 <2>
 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
 ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
 */
func reChange() -> Array<Int>{
    var arrayNum = [2,8,7,1,4,3]
    var oddNum = [Int]()
    var evenNum = [Int]()
    
    for arrayNum in arrayNum{
        if arrayNum%2 == 0{
            evenNum.append(arrayNum)
        }
        else{
            oddNum.append(arrayNum)
        }
    }
    arrayNum.removeAll()

    arrayNum = oddNum
    arrayNum += evenNum

    return arrayNum
}

reChange()

/*
 <3>
 0 ~ 9 사이의 숫자가 들어있는 배열에서 각 숫자가 몇 개씩 있는지 출력하는 함수
 입력 : [1, 3, 3, 3, 8]
 결과 : "숫자 1 : 1개, 숫자 3 : 3개, 숫자 8 : 1개"
 */

func howManyNum(inArray:Array<Int>) {
    var numCount = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    for i in 0...(inArray.count-1){
        if inArray[i] < 10{
            let ia = inArray[i]
            numCount[ia] += 1
        }
    }
//    numCount
    for i in 0...(numCount.count-1){
        if numCount[i] != 0{
            print("숫자 \(i) : \(numCount[i])개")
        }
    }

}


howManyNum(inArray: [1, 3, 3, 3, 8])

