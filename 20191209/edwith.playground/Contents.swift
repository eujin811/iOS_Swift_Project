import UIKit

struct User {
    var friends: [Friends] = []
    var blocks: [Friends] = []
}

struct Friends: Equatable {
    let name: String
}

/*
 ↑ User와 Friends 타입은 수정 금지
 ↓ FriendList 타입은 수정 허용
 */

struct FriendList {
    var friends:Friends
//    var user = User()

    
    mutating func addFriend(name: String) {
        // 호출 시 해당 이름의 친구를 friends 배열에 추가
        self.friends = Friends(name: name)
    }
    
    func blockFriend(name: String) {
        // 호출 시 해당 이름의 친구를 blocks 배열에 추가
        // 만약 friends 배열에 포함된 친구라면 friends 배열에서 제거
        let input = Friends(name: name)
        
        if user.blocks.isEmpty{
            user.blocks = user.friends
        }
        
        for i in 0...(user.blocks.count - 1){
            
            if user.blocks[i] == input{
                user.blocks.remove(at: i)
            }
        }
        
        
    }
}


//

var user = User()

//var friendList = FriendList()
//var friendList = FriendList(user: user)
//friendList.addFriend(name: "원빈")
//friendList.addFriend(name: "장동건")


var friendList = FriendList(friends: Friends(name: "원빈"))
user.friends.append(friendList.friends)
friendList.addFriend(name: "장동건")
user.friends.append(friendList.friends)
friendList.addFriend(name: "정우성")
user.friends.append(friendList.friends)

user.friends
//friendList.user.friends   // 원빈, 장동건, 정우성

friendList.blockFriend(name: "정우성")
user.friends   // 원빈, 장동건
user.blocks    // 정우성

