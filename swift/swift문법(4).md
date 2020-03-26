## swift 기본-(4)

Swift는 ARC기반임. Automatic Reference Counting

컴파일 타임에 개발자가 직접 코드를 작성해야 되었던 부분을 자동으로 구문 분석해서 적절하게 레퍼런스 감소 코드를 삽입해주어, 실행 중에 별도의메모리 관리가 이루어지지 않음.

가비지 컬렉터와 달리 참조사이클을 자동으로 처리하지 않기 때문에, 객체에 대해 강한참조가 남아있으면 해당 객체는 메모리 해제가 되지 않음.



1. Strong

   어떠한 설정도 없을 떄의 기본값.

   강한 참조를 유지하겠다.

   이 키워드는 레퍼런스 카운트를 증가시킴.

   But, 강한 순환 참조는 클로저 캡처링이나 객체간 서로 참조 등등의 경우에 RC가 0이 되지 않는 상황이 발생할 수 있고, 이때 메모리 누수가 일어남.

   ex. 서로 다른 객체가 서로를 강하게 참조하게 되면, 순환참조가 발생해 메모리 누수 발생/

   ```swift
   class Foo {
     var bar: Bar?
   }
   
   class Bar {
     var foo: Foo?
   }
   
   let foo = Foo()
   let bar = Bar()
   
   foo.bar = bar   // Foo가 Bar를 강하게 참조
   bar.foo = foo   // Bar가 Foo를 강하게 참조
   ```

   위는 순환참조가 발생한 예시.



2. Weak, Unowned

   대상 객체에 대해 레퍼런스 카운트를 증가시키지 않음.

   

   * Weak

     객체가 nil일 수 있음. 

     객체가 옵셔널이기 때문에 객체가 해제 되어 버린 상태에서 참조하면, 오류!

     대신, 언래핑 하는 과정을 통해 안전하게 사용가능

     반드시 **Optional**임!

   * Unowned

     객체는 절대 nil일 수 없다.

     Optional 객체가 아니다.

     매우 위험한 방법이므로 잘 사용 x

   ```swift
   class Foo {
       var bar: Bar?
   }
   
   class Bar {
       weak var foo: Foo?
   }
   
   let foo = Foo()
   let bar = Bar()
   
   foo.bar = bar     // Foo가 Bar를 강하게 참조
   bar.foo = foo     // Bar가 Foo를 약하게 참조
   ```

   