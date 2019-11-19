import UIKit

class Animal {
    let brain = true
    let heart = true
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

//var ani = Animal(legs: 3)

class Human: Animal {
    let head = 1
        
    init() {
        super.init(legs: 2)
    }
  
    
}

var human = Human()
human.legs

class Pet: Animal{
    var fleas: Int
    
    init(fleas: Int) {
        self.fleas = fleas
        super.init(legs: 4)
    }
    
    func bark(){
        print("짖다.")
    }
}



class Dog: Pet{
    
    init(){
        super.init(fleas: 8)
    }
    override func bark() {
        print("왈왈")
    }
}

class Cat: Pet{
    
    init(){
        super.init(fleas: 4)
    }
    override func bark() {
        print("미야옹")
    }
}


