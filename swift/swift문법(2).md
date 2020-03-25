## swift 중요한 문법 복습 feat.YSpa

지난번 문법 1번편에는 부족한게 있으니까 꼭 이걸 다시 참고하기!!!!





1. let myClass: Dictionary와  let myClass: Dictionary가 가능한가?

   -> 불가능. let은 상수이기에 생성문이 필요. 대입문으로 값을 넣어주어야함.

   ```swift
   let myClass: Dictionary = ["":""] 
   ```

   이게 맞음.



2. 함수내에 생성된 인스턴스가 함수가 끝나도 해제되지 않게 하려면 어떻게 해야할까?

   -> return 등으로 값을 넘겨주어야함

3. swift는 정적인 프로그램이므로 **선컴파일**이 특징이다.

4. 멤버변수는 클래스범위 / 지역변수는 메소드.함수 범위

5. 예시) 책 제목은 반드시 필요하므로 옵셔널이면 안되고, 책 평점은 nil도 가능하게 옵셔널로 

------

### optional 안전하게 사용하기. Unwrapping

첫번째 방법 : ?로 선언하고 !로 사용하기. 이건 무조건 nil이 아니라 값이 있다라고 확신할때. but, !가 많은 코드는 나쁜 코드다!!!!

두번째 방법 : if let으로 쓰기

세번째 방법 : 선언시에 !를 사용하기. 일종의 편의장치. if let과 !의 남발을 방지하기 위함. 이것은, 초기에 잠깐 nil인 상태로 초기화되기 때문에 어쩔수없이 optional으로 선언했지만, 애플리케이션이 동작할때에는 반드시 값이 존재할때! 
이럴때는, 옵셔널 바인딩을 하지않고 변수처럼 사용 가능. 마치 옵셔널이 아닌것처럼 사용가능.

------

빈칸 채우기 문제 안내

- 빈칸 채우기는 이미 완성된 코드 중 빈칸에 알맞은 코드를 입력하는 문제 타입입니다.
- 빈칸을 제외한 기본 코드는 수정할 수 없습니다.
- 빈칸을 채우지 않을 경우, 실행 결과에 에러 메시지가 표시됩니다.

```swift
import Foundation 
struct WatchDevice {    
  var pairediPhone:String? //애플와치와 쌍을 이루는 아이폰의 이름.    
  var appInstalled = false //어플리케이션의 설치 유무     
  enum WatchSize {        
    case m42, m38    
  } 
} 
var appleWatch:WatchDevice? = nil 
appleWatch = WatchDevice(pairediPhone: "링고스타의 아이폰", appInstalled: true) 
// appleWatch에 appleWatch에 대해 optional binding으로 phoneName이라는 새로운 변수를 생성해 주세요
if let phoneName = appleWatch!.pairediPhone{    
  print ("AppleWatch가 \(phoneName)과 쌍을 이룹니다.") } 
```

중요한점은 appleWatch뒤의 ! 이다. 왜냐면 appleWatch가 nil이 아닌것을 내가 보증하는 중임.



------

### assert와 guard

다양한 값들을 동적으로 확인하고 안전하게 처리할 수 있도록 도와주는 친구들

1. assert

   어떤 결과를 조건들을 가지고 확인하는데 사용

   디버깅 모드에서만 작동함. 실제 배포되는 애플리케이션에서는 제외

   ```swift
   var someInt: Int = 0
   
   assert(someInt == 0, "someInt !=0")
   //0이 맞니? 맞으면 그대로 지나치고, 그렇지 않으면 오른쪽의 메세지를 출력하고 여기가 잘못되었다고 알리고 디버깅이 멈춰버리게 됨. 메세지를 안써줄 수도 있음.
   
   someInt = 1
   assert(someInt == 0)//멈춰버림
   ```

   ```swift
   func functionWithAssert(age: Int?){
     assert(age != nil, "age==nil")
     assert((age! >=0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
     print("당신의 나이는 \(age!)세 입니다")
   }
   
   functionWithAssert(age: 50)//동작 중지, 검증 실패
   functionWithAssert(age: -1)//동작 중지, 검증 실패
   ```

2. guard

   Early-exit 즉 검증하고, 얜 아니다 싶으면  빠른 종료를 위해서 사용하는 것.

   return, break같은게 꼭 있어야함

   ```swift
   func functionWithGuard(age: Int?){
     guard let unwrappedAge = age, //여기서 옵셔널 바인딩해주고..만약 nil이면 리턴
     unwrappedAge < 130, //조건 체크
     unwrappedAge >= 0 else{
       print("나이값 입력이 잘못되었습니다")
       retur //무조건 종료 지시어가 있어야함.
     }
     print("성공. \(unwrappedAge)세입니다") //guard는 if와 다르게 변수를 계속 사용할 수 있음.
   }
   ```

   ```swift
   guard unwrappedAge < 100 else{
   	return
   }
   
   //위에 꺼랑 밑에꺼랑 같은 의미
   
   if unwrappedAge < 100 {
     
   }else{
     return
   }
   ```

   

