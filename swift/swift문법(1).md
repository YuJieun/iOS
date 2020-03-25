# Swift 기본-(1)

Swift Programming Language Guide

Swift API Design Guidelines



## 1. 이름짓기

swift 는 Camel Case사용.

Lower Camel Case : function, method, variable, constant -> ex. someVariableName

Upper Camel Caase : type(class, struct, enum, extension...) -> ex. Person, Point, Week

Swift는 대소문자를 구분함



## 2. 콘솔로그

* print  : 단순 문자열 출력
* dump : 인스턴스의 자세한 설명까지 출력. 

기본적으로 콘솔로그에 남기는 동작



## 3. 문자열 보간법

프로그램 실행중에 문자열 안에 변수, 상수 표현하기 위해 사용  

```swift
\()
```

을 이용해서 사용

```swift
let age : Int = 10

"안녕하세요! 저는 \(age)살입니다"
"안녕하세요! 저는 \(age+5)살입니다"
print("안녕하세요! 저는 \(age+5)살입니다")
```

dump같은경우에는 클래스나 구조체같은 애들을 볼 때 좋음

```swift
class Person {
  var name : String = "jieun"
  var age: Int = 10
}
let person: Person = Person()
print(person)
dump(person)
```



## 4. 변수와 상수

상수 선언 : let

변수 선언 : var

------

let 이름: 타입 = 값

var 이름:타입 = 값

But, 값의 타입이 명확하다면 타입 생략 가능

let 이름 = 값

let 이름 = 값

**띄어쓰기 잘해야함 (민감) **

------

```swift
let constant: String = "차후에 변경 불가"
var variable: String = "차후에 변경 가능"

//상수 값 변경하려고 하면 오류발생
```

------

나중에 할당하려고 하는 상수, 변수는 타입 꼭 명시 해야함

```swift
let sum: Int

sum = 3
sum = 1 //상수는 첫번째 할당 이후 값을 변경할 수 없음. 오류발생
```

변수도 마찬가지로 차후에 할당하는 것이 가능.

변수는 할당 이후 값 변경 가능.



## 5. 기본 데이터 타입

Bool, Int, UInt, Float, Double, Character, String

* Bool -> true, false (0과 1 호환 불가)

* UInt : unsigned integer 부호가없는 정수. 양의 정수

  ex. -100을 할당하게 되면(음수) 오류가 남

  ex. UInt에 Int변수를 넣어도 오류가 남. swift는 굉장히 데이터 타입이 엄격하기 때문에 다른 데이터타입과의 호환이 까다롭다. UInt에 Int를 넣을 수 없음.

* Double과 Float도 구별

* Character 유니코드를 사용. 문자열은 x

* String과 Character도 호환 불가..(암시적 변환은 불가..)



## 6. Any, AnyObject, nil

1. Any : Swift의 모든 타입을 지칭하는 키워드
2. AnyObject : 모든 클래스 타입을 지칭하는 프로토콜
3. nil : 없음을 의미하는 키워드

------

1. Any

```swift
var someAny: Any = 100
//어떤 타입도 수용 가능

someAny = "어떤 타입도 수용 가능"
someANy = 123.12

let someDOuble: Double = someAny // 얘는 오류가 남. Any에 Double을 할당할 수 없다.

```



2. AnyObject

   ```swift
   class SomeClass {}
   
   var someAnyObject: AnyObject = SomeClass()
   
   someAnyObject=123.12 //오류 발생
   ```



3. nil

   ```swift
   var someAny: Any = 100
   
   someAny = nil //오류발생.
   //Any인 경우, 없음은 들어올 수 없음. nil할당 불가
   //null, NULL 과 같은 키워드와 유사
   ```





## 7. 컬렉션 타입

컬렉션 타입은 여러 값들을 묶어서 하나의 변수 등으로 표현할 수 있게 만든다.

* Array : 순서가 있는 리스트 컬렉션
* Dictionary : 키와 값의 쌍으로 이루어진 컬렉션
* Set : 순서가 없고, 멤버가 유일한 컬렉션

------

1. Array

   ```swift
   var integers: Array<Int> = Array<Int>()
   integers.append(1)
   integers.append(10)
   
   integers.contains(100)  //true
   integers.contains(99) //false
   
   integers.remove(at: 0) //1  0번째 인덱스 없앰
   integers.removeLast() //100  맨 마지막 요소 없앰
   integers.removeAll() //모두 없앰
   
   integers.count //몇개의 요소?
   
   integers[0] //비어있는 상태인데 0번째 요소를 없애려고 하면 오류발생
   
   ```

   여러가지 Array 표현방법

   ```swift
   //Array<Double>과 [Double]은 동일 표현
   var doubles: Array<Double> = Array<Double>()
   //빈 String Array생성
   var strings: Array<String> = [String]()
   //[]는 새로운 빈 Array
   var characters: [Character] = []
   ```

   let을 쓰면 불변 Array



2. Dictionary

   ```swift
   var anyDictionary: Dictionary<String, Any> = [String:Any]() //Dict도 뒤에 저렇게 축약해서 생성할 수 있음.
   anyDictionary["someKey"] = "value"
   anyDictionary["anotherKey"] = 100
   
   anyDictionary.removeValue(forkey: "anotherKey") //키에 해당하는 값 없애기.
   anyDictionary["someKey"] = nil //이렇게 해주면 someKey에 해당하는 값을 없앨 수 있음.
   //위의 두개를 사용하고 나면 dict에는 아무것도 남지 않게 됨. [:]
   
   ```

   추가로,

   ```swift
   let emptyDict: [String:String] = [:] //빈 dict생성
   let someDict: [String:String] = ["name":"jieun", "gender":"male"]
   
   //let으로 선언해서 dict변경 불가 (remove 등 다 불가능)
   
   let someValue: String = someDict["name"] //오류가남!!! 왜냐, "name"이라는 key에 해당하는 값이 있을 수도 있고 없을 수도 있기 떄문이다.
   //값이 없으면 넣어줄 수 없기 때문에 불확실성 때문에 오류가 나게 된다.
   ```



3. Set

   Set는 축약 문법이 없기 때문에 Set<~~> 라는 형식으로만 쓸 수 있음

   ```swift
   var integerSet: Set<Int>  = Set<Int>()
   integerSet.insert(1)
   integerSet.insert(2)
   integerSet.insert(1) //중복이 없기 떄문에 1은 한번만 추가가 됨. 
   
   integerSet.contains(1)
   integerSet.remove(1)
   integerSet.removeFirst()
   
   integerSet.count
   ```

   세트 응용해보기

   ```swift
   let setA: Set<Int> = [1, 2, 3, 4, 5]
   let setB: Set<Int> = [3, 4, 5, 6, 7]
   
   let union: Set<Int> = setA.union(setB) //합집합. {2,4, 5, 6, 7, 3, 1}
   
   let sorted: [Int] = union.sorted() //정렬 [1,2,3,4,5,6,7]
   
   let intersection: Set<Int> = setA.intersection(setB) //교집합. {5,4,3}
   
   let subtracting: Set<Int> = setA.subtracting(setB) //차집합 {2,1}
   ```

   



## 8. 옵셔널

**Optional은 "값이 있을 수도, 없을 수도 있음" 을 뜻함**

let someConstant: Int = nil. --> 이렇게 하면 오류가남



WHY 옵셔널이 필요할까?

1. nil의 가능성을 코드만으로 충분히 표현가능 (주석 작성 시간 절약)
2. 전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않더라도 안심하고 사용(효율성up, 예외상황 최소화)



```swift
func someFunction(someOptionalParam: Int?){}
func someFunction(someParam: int) {}

someFunction(someOptionalParam: nil)
someFunction(someParam: nil) //오류가 남! Nil is not compatible with expected argument...
```



------

Optional = enum + general 

```swift
enum Optional<Wrapped> : ExpressibleByNilLiteral{
  case none //옵셔널 값이 없다
  case some(WRapped) //옵셔널 값이 있다
}
let optionalValue: Optional<Int> = nil //이게 완전한 문법이지만, 
let optionalBalue: Int? = nil //이렇게 뒤에 물음표를 붙이면 옵셔널이다! 물음표는 띄워서 쓰면 안된다.
```

------

1. 느낌표 (!) : 암시적 추출 옵셔널

   ```swift
   var optionalValue: Int! = 100 //암시적 추출 옵셔널
   
   switch optionalValue { //이렇게 switch문으로 값이 들어왔는지 없는지 체크해볼 수 있음
     case .none:
     print("This OPtional variable is nil")
     case .some(let value):
     print("Value is \(value)")
   }
   
   //기존 변수처럼 사용가능
   optionalValue = optionalValue + 1
   //nil 할당 가능
   optionalvalue = nil
   //잘못된 접근으로 인한 런타임 오류 발생
   optionalValue = optionalValue + 1 //왜냐면, nil에 +1은 안되므로!!!
   ```

2. 물음표(?) : 일반적 옵셔널

   ```swift
   var optionalValue: Int? = 100
   
   switch optionalValue { //마찬가지로 이렇게 switch문으로 값이 들어왔는지 없는지 체크해볼 수 있음
     case .none:
     print("This OPtional variable is nil")
     case .some(let value):
     print("Value is \(value)")
   }
   
   //nil 할당 가능
   optionalvalue = nil
   //기존 변수처럼 사용불가 - 옵셔널은 일반 값은 다른 타입이므로 연산불가!!!
   optionalValue = optionalValue + 1 
   ```

   

## 9. 옵셔널 값 추출

Optional Unwrapping !

옵셔널 어떻게 꺼내서 사용하고 어떻게 활용할 수 있는가?

Optional Unwrapping에는 

* Optional Binding - 옵셔널 바인딩
* Force Unwrapping - 강제 추출

이 있다.



1. Optional Binding: 옵셔널의 값을 꺼내오는 방법 중 하나 / nil 체크 + 안전한 값 추출

   ```swift
   func printName(_ name: String){
   	print(name)
   }
   var myName: String? = nil
   printName(myName) 
   //전달되는 값의 타입이 다르기 때문에 컴파일 오류발생
   ```

   따라서, **if-let**방식을 사용!

   ```swift
   func printName(_ name: String){
   	print(name)
   }
   var myName: String! = nil
   
   if let name: String = myName{
     printName(name)
   } else {
     print("myName == nil")
   }
   
   //name상수는 if-let 구문 내에서만 사용가능
   //상수 사용범위 벗어나서 컴파일 오류 발생
   printName(name)
   ```

   한번에 하나씩만 바인딩할 수 있는게 아니라 여러개 바인딩 가능.

   ```swift
   var myName: String? = "jieun"
   var yourName: String? = nil
   
   if let name = myName, let friend = yourName{ //쉼표를 사용해서 여러 옵셔널 타입 바인딩 가능함. 두 변수에 모두 값이 들어있어야만 실행 가능.
     print ("\(name) and \(friend)")
   } // yourName이 nil이기 때문에 실행되지 않음
   
   yourName = "haha"
   if let name = myName, let friend = yourName{
     print ("\(name) and \(friend)")
   } //jieun and haha
   ```

   

2. Force Unwrappint : 옵셔널의 값을 강제로 추출

   ```swift
   func printName(_ name: String){
   	print(name)
   }
   var myName: String? = "jieun"
   printName(myName!) //jieun. 물음표가 벗겨지고 값이 전달됨. 이렇게 뒤에 느낌표를 붙이게 되면 값을 강제로 추출한다.
   ```

   ------

   ```swift
   myName = nil
   print(myName!) //강제추출 시에 값이 없으므로 오류가 발생한다.
   
   var yourName: String! = nil //암시적 추출 옵셔널 형식은 처음에 선언할때부터 위의 print(~!)을 생각해서 선언한다고 생각하면 됨.
   
   printName(yourName)
   //따라서 얘는 뒤에 느낌표를 안붙였는데 느낌표를 붙인 것과 같은 효과를 냄.
   //But
   //nil 값이 전달되기 때문에 런타입 오류 발생
   ```

   옵셔널 강제 추출 방식은 추천되는 방법은 아니고, 안전하게 사용하기 위해서는 옵셔널 바인딩을 사용하는 것이 좋다.



## 10. 튜플

튜플은, Collection이 아닌 Type이다. 

------

Type이 무엇이냐? type에는 두가지 종류가 있는데

* named Types
* compound Types가 있다.

1. named Types :  클래스, 구조체, 열거형, 프로토콜, Int, String, Double 등등

   예를들면, Zedd라는 클래스를 만들면 Zedd라는 이름을 가지고 있는 타입이 만들어지게 됨.

   Int ,String 등등 도 구조체로 구현이 되어 있기 때문에 Named Type이다.

2. compound Types : 이름이 없는 타입으로, swift 언어 자체에서 정의된다.

   compound Types에는 두가지 유형이 있다.

   function type과 tuple type. 또한, comound Types은 위에서 말한 named type과 다른 기타 compound Types들이 포함될 수 있다.

   tuple을 예로 들면,

   (Int,(Int,Int)). 1번 Int는 위에서 배운 named type.

   두번째 (Int, Int)는 tuple. 따라서 compound type에는 둘다 포함됨.

------

tuple은 아주아주 간단한 구조체라고 생각하면 편함.

여러가지 "타입"을 한꺼번에 묶어서 사용 가능.

```swift
var tuple = (1,"Hello World!", true)
var anotherTuple = (1, (tuple)) //하나의 타입만을 괄호로 묶는건 의미가 없음.
```

```swift
func a() -> Int {return 1}
func b() -> String {return "wow"}

var functionTuple = (a(), b())//이렇게 function type을 담을 수도 있음.
```

------

그러면 tuple을 어떻게 쓰는가. 점(.)을 쓰면 된다.

```swift
var tuple = (1,"Hello World!", true)
tuple.0 //1
tuple.1 //"Hello world"
```

```swift
var tuple = (1,"Hello World!", true)
var anotherTuple = (1, (tuple))
anotherTuple.0 //1
anotherTuple.1.0 //1
anotherTuple.1.2 //true
```

------

tuple에는 이름을 줄 수도 있음

```swift
var namedTuple = (name: "wow", age: 999, likes : ["swift","ios"])

namedTuple.name
namedTuple.age
namedTuple.likes
```

이렇게 쓸 수 있다는 점에서 tuple은 아주 간단한 구조체라고 하는 것 같음.

```swift
var namedTuple2: (name: String, age: Int, likes: [String]) = ("jieun", 999, ["Swift","iOS"])
//위처럼 타입을 먼저 주고, 이후 값 할당 가능.
```

------

tuple은 Sequence라는 프로토콜을 준수하지 않기 때문에, 루프를 돌릴 순 없음.

Sequence 프로토콜을 따르는 것 like 배열에 넣어주면 루프 돌릴 수 있음

```swift
var tupleArr = [(1, "Hello, world!", true),(2, "Hello, world!",false)]
for index in tupleArr{
    print(index.0)//1 2
    print(index.1)//"Hello, world!" "Hello, world!"
    print(index.2)//true false
}
```

배열에 튜플을 넣을 때는, tuple들의 타입과 순서가 모두 같아야함.

------

tuple의 가장 좋은 점은 여러가지 타입을 한번에 리턴하게 할 수 있음

```swift
func someFunction() -> (Int,String,Bool){
    return (1,"Zedd",true)
}
var someTuple = someFunction()

someTuple.0//1
someTuple.1//"Zedd"
someTuple.2//true
```



## 11. 타입캐스팅

스위프트의 타입캐스팅은 인스턴스의 타입을 확인하는 용도. or 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인하는 용도로 사용.

as, is 를 사용

------

기존 다른 언어의 type casting은 다음과 같은 구조이다.

```swift
let someInt: Int = 100
let someDouble: Double = Double(someInt)
```

얘는 스위프트에서는 타입캐스팅이 아니다. Double 타입의 인슨턴스를 하나 더 생성하는 것이다.

------

```swift
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
} //이 클래스들은 서로 부모-자식 관계를 이루고 있다.

// 인스턴스 생성
var yagom: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()

```

is를 사용하여 타입을 확인해보자

```swift
var result: Bool

result = yagom is Person // true
result = yagom is Student // false
result = yagom is UniversityStudent // false

result = hana is Person // true
result = hana is Student // true. student은 person의 특성을 모두 가지고 있음.상속받았기 때문.
result = hana is UniversityStudent // false

result = jason is Person // true
result = jason is Student // true
result = jason is UniversityStudent // true

if yagom is UniversityStudent {
    print("yagom은 대학생입니다")
} else if yagom is Student {
    print("yagom은 학생입니다")
} else if yagom is Person {
    print("yagom은 사람입니다")
} // yagom은 사람입니다

switch jason {
case is Person:
    print("jason은 사람입니다")
case is Student:
    print("jason은 학생입니다")
case is UniversityStudent:
    print("jason은 대학생입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 사람입니다

switch jason {
case is UniversityStudent:
    print("jason은 대학생입니다")
case is Student:
    print("jason은 학생입니다")
case is Person:
    print("jason은 사람입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 대학생입니다
```

------

업 캐스팅은, as를 사용하여 부모클래스의 인스스를 사용할 수 있도록 타입정보 전환해줌.

Any 혹은 AnyObject로도 타입정보 변환 가능하며, 

암시적으로 처리되므로 생략해도 무방.

많이 사용되진 않음

```swift
// UniversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
var mike: Person = UniversityStudent() as Person

var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류

// UniversityStudent 인스턴스를 생성하여 Any 행세를 할 수 있도록 업 캐스팅
var jina: Any = Person() // as Any 생략가능
```

------

다운 캐스팅은,  as? 또는 as!를 사용해서 자식 클래스의 인스턴스로 사용할 수 있도록 타입정보 전환해줌

```swift
//as? : 조건부 다운 캐스팅
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent //실질적으로 대학생이고, Person으로 타입캐스팅 되었으므로 캐스팅 가능. 캐스팅 실패되면 옵셔널로 반환이 됨.
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil


//as! : 강제 다운 캐스팅. 넌 무조건 이 역할을 해야해!
var forcedCasted: Student //반환타입이 옵셔널이 아닌 일반 타입이 됨. 좀더 편하게 활용 가능.

forcedCasted = mike as! UniversityStudent//마이크는 원래 대학생이 었기 때문에 별 문제가 안됨.
//forcedCasted = jenny as! UniversityStudent // 런타임 오류
//forcedCasted = jina as! UniversityStudent // 런타임 오류
//forcedCasted = jina as! Student // 런타임 오류
//얘네들은 강제로 대학생 행세가 안됨.
```

------

활용하기

```swift
func doSomethingWithSwitch(someone: Person) {
    switch someone { //인스턴스가 실질적으로 뭔지 판단
    case is UniversityStudent //얘는 단순히 확인만 하기 때문에
        (someone as! UniversityStudent).goToMT() //타입변환을 해주고 사용을 해야함
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person) 
doSomethingWithSwitch(someone: mike)
doSomethingWithSwitch(someone: jenny) 
doSomethingWithSwitch(someone: yagom)


func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent { //그래서 if let구문을 사용하면 캐스팅과 동시에 옵셔널을 추출해서 사용 가능. -->이게 이해가 안되네..물어보자 
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person)
doSomething(someone: mike)
doSomething(someone: jenny) 
doSomething(someone: yagom) 
```

