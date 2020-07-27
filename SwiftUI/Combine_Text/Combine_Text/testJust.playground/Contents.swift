import UIKit
import Combine

/*
 publiser의 값을 subscribe하는 방법 3가지
 1. sink
 2. subscribe 메소드
 3. assign(to: on: )
 
 */


// subscriber에게 ouput을 한번만 출력한 후 완료하는 publisher
let publisher = Just("jinjin")


// ------------------------------------------------------
// 1. sink로 subscribe

//let subscriber = publisher.sink { (value) in
//    print(value)
//}



let subscriber = publisher.sink(receiveCompletion: { (result) in
    switch result {
    case .finished:
        print("finished")
    case .failure(let error):
        print(error.localizedDescription)
    }
}, receiveValue: { (value) in
    print(value)
})


// jinjin -> finished

print("2번시작 --------------------------------")
//---------------------------------------------------------
// 2. subscribe 메소드

let publisher2 = ["jinjin", "kyj", "youjin", "jiny"].publisher      //Just("jinjin")
publisher2.subscribe(JinSubscriber())


//publisher.subscribe(JinSubscriber

class JinSubscriber: Subscriber {
    typealias Input = String        // Publisher에게 받은 값의 종류
    typealias Failure = Never       // error 종류
    
    func receive(subscription: Subscription) { // subscriber에 publisher를 성공적으로 구독했음을 알리고 item을 요청할 수 있다.
        print("구독 시작!")
        subscription.request(.unlimited)
//        subscription.request(.max(2))     // 구독시작 -> jinjin -> kyj  (완료 메시지 안뜸)
    }
    
    func receive(_ input: String) -> Subscribers.Demand {  // subscriber에게 publisher가 element를 생성했음을 알림
        print("\(input)")
        
//        return .unlimited
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {   // subscriber에게 publisher가 publish 완료했음을 알림!
        print("완료!!", completion)
    }
}

//max(2) -> 완료메시지 안뜸! 4개중에 2개만 나와서!1
//
