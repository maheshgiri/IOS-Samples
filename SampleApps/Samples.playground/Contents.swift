//: Playground - noun: a place where people can play

import UIKit

var str = 3



func calculateArea(height:inout Int,width:Int)->Int{

    return height+width;
}

var area=calculateArea(height: &str, width: 4)

var numb:[String]=[]

var numDoubel:[Double]=[10,20,30]

numDoubel.append(10.00)

numDoubel.remove(at: 0)
numDoubel.count
//numDoubel.removeAll()

for val in numDoubel{
  print("Value is \(val)")
    numDoubel.append(val+5)
}
numDoubel.count

/*
 Use of Optional Var ? for null
 */
class Car{
    var model:String?
}

var vehicle:Car?
vehicle=Car()
vehicle?.model="Two"

if let v=vehicle,let p=v.model{
    print("Vehilcle model is \(p)")
}

//Use of where keyword

var cars:[Car]?

cars=[Car]()
cars?.append(Car())
if let carsArr=cars ,carsArr.count > 0 {
    print("Correct checked")
}else{
    cars?.append(Car())
    print("Count of cars \(cars?.count)")
}

//Use of ! when user will has give a value

class Person{
     var _age : Int!
    
    init(age:Int) {
            self._age=age
        
    }

    func age() -> Int {
        return _age
    }
}

var age=Person( age : 8)
print("Age of Person is \(age.age())")
var age1=Person( age : 3)
print("Age of Person is \(age1.age())")


//Enum Examples

enum Planets{
    case Jupitor
    case Mercury
    case Earth
    
}




//Procol Example

protocol Example{
    var name :String {get}
    func whatTypeOfExample() -> String

}

class MyExample : Example{
    internal var name: String = "MyExample"


    
    internal func whatTypeOfExample() -> String {
        return self.name
    }

}

let type=MyExample()
type.whatTypeOfExample()
type.name="New Example"
type.whatTypeOfExample()

//End Protocol Example


