## swift  기본 -(3)

### 1. 프로퍼티

구조체, 클래스, 열거형 내부에 구현 가능.

연산 프로퍼티는 var만 가능.

```swift
struct Student {
    
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    // 인스턴스 연산 프로퍼티   --- 특정한 연산을 수행해줌.
    var westernAge: Int {   
        get {   //값을 꺼내가려면, KoreanAge-1을 연산함
            return koreanAge - 1
        }
        
        set(inputValue) { //값을 set해주면, inputValue+1을 연산함
            koreanAge = inputValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생  //타입과 연관돼서 저장해야함.
    
    /*
    // 인스턴스 메서드
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
     */
    
    // 읽기전용 인스턴스 연산 프로퍼티
    // 간단히 위의 selfIntroduce() 메서드를 대체할 수 있습니다
  
  //지은 : 즉 밑에 애는 읽기전용이다!
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다"
        }
    }
        
    /*
     // 타입 메서드
     static func selfIntroduce() {
     print("학생타입입니다")
     }
     */
    
    // 읽기전용 타입 연산 프로퍼티
    // 읽기전용에서는 get을 생략할 수 있습니다
    static var selfIntroduction: String {
        return "학생타입입니다"
    }
}

// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)
// 학생타입입니다

// 인스턴스 생성
var yagom: Student = Student()
yagom.koreanAge = 10

// 인스턴스 저장 프로퍼티 사용
yagom.name = "yagom"
print(yagom.name)
// yagom

// 인스턴스 연산 프로퍼티 사용
print(yagom.selfIntroduction)
// 저는 Swift반 yagom입니다

print("제 한국나이는 \(yagom.koreanAge)살이고, 미쿡나이는 \(yagom.westernAge)살입니다.")
// 제 한국나이는 10살이고, 미쿡나이는 9살입니다.
```



```swift
struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {  //set에 매개변수 없으면 밑에처럼 newValue라고 명시되게 된다.
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000

print(moneyInMyPocket.won)
// 11000.0

moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)
// 11000.0

```





## 2. 프로토콜

어떤 구조체, 클래스, 열거형에다가 너는 이 기능이 꼭 필요해! 이 기능을 꼭 구현해놨어야해라고 요구사항을 정의한것.

구현할 거에요~ -> 채택

실제 구현한 것 -> 프로토콜을 준수하다

라고 부름



프로토콜 형식

```swift
protocol 프로토콜 이름 {
  /* 정의부 */
}
```

프로토콜 정의하기 

```swift
protocol Talkable {
  //프로퍼티 요구.
  //항상 var을 이용
  //get set 모두 명시: 읽기쓰기 모두 가능한 프로퍼티여야한다.
  //get만 명시 : 읽기만 가능해도 상관 없다
  var topic: String { get set }
  var language: String { get }
  
  //메서드 요구.
  //구현을 직접하지 않고 걍 뭐가 필요한지만 알려줌
  func talk()
  
  //이니셜라이저 요구
  init(topic: String, language: String)
}
```

프로토콜 채택하기

```swift
struct Person: Talkable{ //Talkable라는 프로토콜을 채택함
  var topic: String //읽기쓰기 모두 가능
  let language: String //읽기전용
  //위와 같이 정의하던지
  //또는 아래와 같이 가능
  var topic: String {
    set {
      self.topic = newValue
    }
    get {
      return self.topic
    }
  }
  var language: String { get {return "한국어"}}
  
  func talk(){
    print("~~~~")
  }
  
  init(topic:String, language: String){
    self.topic = topic
    self.language = language
  }
}
```



프로토콜은 상속을 받을 수 있다.

```swift
protocol 프로토콜 이름 : 부모 프로토콜 목록 {
  
}//클래스는 하나만 상속가능하지만, 프로토콜은 여러개의 부모를 가질 수 있음
```

```swift
protocol Readable {
    func read()
}
protocol Writeable {
    func write()
}
protocol ReadSpeakable: Readable {
    func speak()
}
protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

struct SomeType: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    
    func write() {
        print("Write")
    }
    
    func speak() {
        print("Speak")
    }
}
```



클래스가 클래스와 프로토콜 동시에 상속받는경우

```swift
class SuperClass: Readable {
    func read() { }
}

class SubClass: SuperClass, Writeable, ReadSpeakable {  //상속받으려는 클래스를 먼저 써주고 그 다음 프로토콜을 쓴다.
    func write() { }
    func speak() { }
}
```





## 3. 익스텐션 extension

익스텐션은 구조체, 클래스, 열거형, 프로토콜 등 타입에 새로운 기능을 추가하기 위해 사용

타입만 알고 있으면 기능을 확장할 수 있음!

연산 타입 프로퍼티 추가, 이니셜라이저, 특정 프로토콜 준수 등의 기능 추가



```swift
extension 확장할 타입 이름 {
  /* 타입에 추가될 새로운 기능 구현 */
}
```

```swift
extension Int { //Int타입에 연산프로퍼티 추가!
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven) // false
print(2.isEven) // true
print(1.isOdd)  // true
print(2.isOdd)  // false

var number: Int = 3
print(number.isEven) // false
print(number.isOdd) // true

number = 2
print(number.isEven) // true
print(number.isOdd) // false
```



또한 메서드도 추가가 가능

```swift
extension Int { 
  func multiply(by n:Int) -> Int { //by는 라벨 n 은 인자 함수내부에서 사용
    return self * n
  }
}

print(3.multiply(by: 2))  // 6
print(4.multiply(by: 5))  // 20

number = 3
print(number.multiply(by: 2))   // 6
print(number.multiply(by: 3))   // 9
```



또한 이니셜라이저도 추가가능

```swift
extension String {
    init(int: Int) {
        self = "\(int)"
    }
    
    init(double: Double) {
        self = "\(double)"
    }
}

let stringFromInt: String = String(int: 100) 
// "100"

let stringFromDouble: String = String(double: 100.0)    
// "100.0"
```

