# GCD란?

Grand Central Dispatch

쉽고 편한 멀티 스레딩 처리를 위해 애플이 제공하는 api중 하나



* DispatchQueue 클래스는 실제로 해야할 task를 담아두면 선택된 스레드에서 실행을 해줌.

  크게 두 종류가 있음. **Serial Dispatch Queue**와 **Concurrent Dispatch Queue**
  항상 FIFO 방식으로 동작

  * Serial Dispatch Queue : 등록된 작업을 한번에 하나씩 처리. 작업이 완료되면 다음 작업 처리
  * Concurrent Dispatch Queue : 등록된 작업을 하나씩 처리하지 않고, 여러 작업을 동시에 처리

  ```swift
  let serialQueue = DispatchQueue(label: "magi82.serial")
  print(serialQueue) // Serial Dispatch Queue
  
  let concurrentQueue = DispatchQueue(label: "magi82.concurrent", attributes: .concurrent)
  print(concurrentQueue) // Concurrent Dispatch Queue
  ```

* 앱 실행시 시스템에서 기본적으로 두개 큐를 만들어줌. **Main Queue**와 **Global Queue**

  * Main Queue : 메인 스레드(UI스레드)에서 사용되는 Serial Queue

    모든 UI처리는 메인 스레드에서 처리해야함

  * Global Queue : 편의상 사용할 수 있게 만들어놓은 Concurrent Queue. 
    처리 우선 순위를 위한 qos(Quality of Service) 파라메터를 제공함.
    병렬적으로 동시에 처리 하기 때문에 작업 완료 순서를 정할 수는 없지만, 우선적으로 일을 처리하게 할 수 있음.
    대표적인 예로 서버와의 통신작업같은경우 시간이 얼마나 걸릴지 모르고 작업량이 많기 때문에 백그라운드로 실행하여 후처리를 메인큐에서 하는 경우가 있음.

  ```swift
  let mainQueue = DispatchQueue.main
  print(mainQueue)	// Main Queue
  
  let globalQueue = DispatchQueue.global(qos: .background)
  print(globalQueue)	// Global Queue
  ```

* qos 우선순위 (Quality of Service)

  1. userInteractive - 중요도 높고 즉각적 반응이 요구되는 작업일때.  global queue지만 메인쓰레드에서 실행된다.
  2. userInitiated
  3. default
  4. utility
  5. background - 유저가 인지하지 못하는 백단에서 실행되는 작업
  6. unspecified

* sync : 동기처리 메소드 (해당 작업 처리하는 동안 다음으로 진행x)

  ```swift
  DispatchQueue.main.sync{
    print("value 1")
  }
  print("value 2")
  
  //value 1
  //value 2
  ```

* async : 비동기처리 메소드 (처리를 하라고 지시하고 다음으로 넘어감)

  ```swift
  let globalQueue = DispatchQueue.global(qos: .background)
  globalQueue.async {
    print("value 1")
  }
  print("value 2")
  //value 2
  //value 1
  ```

  