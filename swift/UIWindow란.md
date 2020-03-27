# UIWindow

사용자 인터페이스에 배경(backdrop)을 제공하고, 중요한 이벤트 처리 행동(behaviors)을 제공하는 객체.
시각적 모습을 가지고 있지는 않음 but 앱 view의 시각화에 중요한 역할
스크린에 나타나는 모든 뷰는 window로 묶여 있음.

```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
```

스토리보드는 Xcode템플릿이 자동으로 제공하는 app delegate객체에 window속성이 있어야 함.

간단하게 말하자면, iOS앱은 모든 View들의 컨테이너 역할을 하는 UIWindow 인스턴스를 하나 가짐. 얘는 app delegate에 정의되어 있음.
UIWindow는 UIView의 하위클래스이므로 window는 그 자체가 view이기도 함.