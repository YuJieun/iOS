# TableView

1. 테이블 뷰는 좁은 화면에 큰 콘텐츠를 표시하기 위한 UIScrollview를 서브클래스해서 많은 데이터를 효율적이고 빠르게 표시할 수 있도록 만든 서브클래스이다. 



2. Plain 스타일과 Grouped 스타일



3. 구성요소

   * 테이블 header
   * 테이블 footer
   * section에는 section header, section footer
   * table cell

   가장 중요한건 테이블 셀!



4. UITableView

   * UIScrollView의 서브클래스

   * 세로 방향의 스크롤

   * 많은 데이터를 전재로 효율성 극대화

   * 데이터 리스트의 틀을 제공하는 뷰의 클래스

     

5. UITableViewCell

   * UIView의 서브클래스
   * 테이블 뷰 안에서 내용을 바꿔
   * 반복적으로 표시되기 위한 뷰 재사용성에 초점
   * Static cell : 앱 실행 중 테이블뷰의 내용이 변동되지 않을 때 사용
   * Dynamic prototype : 앱 실행 중 셀이 변경되거나, 수정 또는 삭제 될 때 사용



6. UITableViewCell 구성요소

   * Background view와 Selected Background View

   * 실제 내용이 채워지는 Content View

     여기안에 이미지 , 디테일 레이블 등이 들어감...

   * Accessory View , Editing Control, Reordering Control

