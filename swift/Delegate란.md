# Delegate란

delegate는 특정 프로토콜을 상속받아서 해당 프로토콜에서 선언된 함수들을 override하여 사용함.

테이블 뷰, 컬렉션 뷰 등 여러 상황에서 사용함.



ProcViewController.swift

```swift
import UIKit

protocol ProcViewDelegate: class{
  func didBtnClicked(data: String) //프로토콜 내에 함수를 하나 선언함. 옵셔널로 선언된 함수는 상속받는 클래스에서 구현하지 않아도 된다!!!!! -> 질문
}

class ProcViewController: UIViewController {
  var procViewDelegate: ProcViewDelegate?
  
  @IBOutlet weak var btnTest: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func btnClicked(_ sender: UIButton) {
    procViewDelegate?.didBtnClicked(data: "data send")
    self.dismiss(animated: true)
  }
  
}
```



DeleViewController.swift

```swift
import UIKit

class DeleViewController: UIViewController, ProcViewDelegate {
    func didBtnClicked(data: String) {
        self.deleBtn.setTitle(data, for: .normal)
    }
  
    @IBOutlet weak var deleBtn: UIButton! 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func deleBtnClicked(_ sender: UIButton) {
        if let procVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProcViewController") as? ProcViewController{
            procVC.procViewDelegate = self
            self.present(procVC, animated: true, completion: nil)
        }
    }
}
```





