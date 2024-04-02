# Text 위젯  
Text는 문자를 보여주는 위젯 -> 원하는 문자열을 화면에 그려줌
<pre><code>
  Text("안녕하세요, 원희입니다.")
</code></pre>
## 스타일 프로퍼티
TextStyle에 필요한 프로퍼티들 채우고 style 프로퍼티에 넣으면 됨
<pre><code>
  Text("안녕하세요, 원희입니다.",
  style: TextStyle(/*프로퍼티*/),
  )
</code></pre>
* ### fontSize
폰트 크기 조절하는 프로퍼티, double을 받음. 기본설정 14
* ### fontWeight
 폰트 굵기 조절하는 프로퍼티, FontWeight 인스턴스 받음. w100 ~ w900(w400이 기본, w700이 bold)
* ### color
 폰트의 색상을 지정하는 프로퍼티, Color 인스턴스 받음
* ### backgroundColor
 폰트의 배경색을 지정하는 프로퍼티, Color 인스턴스 받음
* ### fontFamily
 Flutter에서 기본 제공하는 폰트 외의 폰트를 pubspec.yaml에 지정했을 때, 이를 적용할 수 있게 도와주는 프로퍼티, String을 받음. 기본폰트는 Roboto


## 스타일 재사용
TextStyle도 하나의 인스턴스로 들어감 -> 폰트스타일들을 미리 저장해두고 사용 가능
<pre><code>
  class AppTextStyles {
  static const double _baseLetterSpacing = -0.5;

  static TextStyle _baseStyle(double size, FontWeight weight) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: _baseLetterSpacing,
    );
  }

  static final TextStyle testStyle1 = _baseStyle(12, FontWeight.w700);
  static final TextStyle testStyle2 = _baseStyle(14, FontWeight.w700);
  static final TextStyle testStyle3 = _baseStyle(16, FontWeight.w700);
}
출처: https://noguen.tistory.com/229 [NOGUEN 블로그:티스토리]
</code></pre>


## TextAlign + TextDirection

### textAlign
textAlign은 TextStyle의 프로퍼티 X -> Text자체의 프로퍼티
* #### enum
  textAlign은 TextAlign enum을 받음
  TextAlign enum에 center, end, justify, left, right, start 있음.
  * ##### center
    가운데 정렬, 위젯 사이즈 내부에서 가운데로 정렬 -> 개행 없는 상태에서는 적용 안 되는     것처럼 보일 수도
  * ##### start, end
    시작, 끝 지점부터 문자를 정렬
  * ##### justify
     양쪽을 맞추어 정렬, 문자 길이 짧으면 동작X.
  * ##### left, right
    왼쪽, 오른쪽을 맞추어 정렬


### TextDirection 
start와 left, end와 right차이는 ?
start와 end는 나라권, 설정마다 달라짐 = textDirection 속성 따라감
(우리나라는 왼쪽->오른쪽 아랍권에선 오른쪽 -> 왼쪽)

<pre><code>
  Text(
  "Hello, I'm Gorani.\nNice to meet you all.",
  textAlign: TextAlign.start,
  textDirection: TextDirection.rtl,
),
출처: https://noguen.tistory.com/229 [NOGUEN 블로그:티스토리]
</code></pre>

start지만 오른쪽으로 정렬


* #### rtl, ltr
  TextDirection도 enum, rtl과 ltr로 구성




# Container 위젯
UI요소를 감싸고, 다양한 형태를 취할 수 있는 위젯
SizedBox와 차이점 : Container위젯은 그 자체를 꾸밀 수 있음

## Container의 프로퍼티
Container() 위젯 내부 프로퍼티를 채워줘야함

* ### width와 height
너비와 높이 값을 조절
width와 height는 nullable한 값 -> 안 넣으면 Container의 부모, 자식 위젯에 따라 그 모양이 달라짐
* ### child
Container는 하나의 자식 위젯을 child 프로퍼티를 통해서 Container 내부에 넣을 수 있음
*크기가 정해진 Container보다 더 크게 설정되면 오버플로우*
* ### padding
Container의 child와의 여백을 설정하는 프로퍼티

원래의 Padding 위젯은 위젯과 위젯간, 즉 위젯 밖에 설정되는 여백을 설정
Container의 padding은 Container 내부의 여백을 설정

padding 프로퍼티는 EdgeInsetsGeometry라는 추상 클래스를 구현한 클래스(EdgeInsets와 EdgeInsetsDirectional : padding을 상대적으로 넣음)를 받음

EdgeInsets만 사용. all, only, symmetric 등등 여러 생성자 존재

* ### alignment
Container내부의 위젯을 어디에 정렬시킬지 정하는 프로퍼티
alignment 프로퍼티는 AlignmentGeometry라는 추상 클래스를 구현한 클래스(Alignment와 AlignmentDirectional : alignment를 상대적으로 넣음) 받음.

 Alignment만 사용. topLeft, topCenter, topRight, centerLeft, center, centerRight, bottomLeft, bottomCenter, bottomRight 인스턴스가 있음.

* ### decoration (BoxDecoration)
SizedBox와 차이점을 보여줌
decoration 프로퍼티는 BoxDecoration 클래스를 받음

  * #### color
    Container자체에도 BoxDecoration에도 color가 있음 -> 둘 다 사용하면 에러
    BoxDecoration의 color가 우선

  * #### borderRadius
    모서리 곡률을 넣는 프로퍼티
    BorderRadius 클래스를 받음.  all, circular, zero, horizontal과 같은 메소드 존재
    * ##### all
       모든 모서리에 매개변수로 들어간 Raidus 클래스를 적용
    * ##### circular
      모든 모서리에 Circular, 즉 원형 곡률을 적용
      nullable 필드 X -> BorderRadius.zero 사용하면 됨.
    * ##### shape
      컨테이너의 모양을 결정
      BoxShape enum을 받으며, BoxShape에는 circle과 rectangle(기본값) 존재
      BoxShape circle 지정시 borderRadius값 비워야함


## Container 크기에 대해
width와 height는 nullable

* Container 자식 위젯 X, weight와 height X
  Container는 부모 위젯의 크기에 맞추어 화면을 최대한 채움 

* Container 자식 위젯 O, weight와 height X
  Container는 자식 위젯에 최대한 맞게 크기가 잡힘

* width와 height O
  설정된 크기대로 



# Row와 Column 위젯
return에는 하나의 위젯만 반환가능, 반환타입도 List<Widget> 아님 -> 여러 개의 위젯 반환 불가능
---> Multichild-Layout Widget을 사용하면 가능!!

Multichild-Layout Widget에 Row, Column, Stack과 같은 위젯들 존재

## Row
행, 즉 가로 배치를 도와주는 위젯
children 프로퍼티에 위젯 리스트를 넣어주면, 가로로 진열가능

### Row 위젯의 프로퍼티들
  * #### children
    List<Widget> 받음
    required, 즉 필수 프로퍼티로 받아서 꼭 넣어줘야 함
    *내부에 들어간 위젯의 크기가 커지면 오버플로우*

  * #### mainAxisAlignment와 crossAxisAlignment
    mainAxisAlignment와 crossAxisAlignment
    
    * ##### mainAxisAlignment
      가로 축 정렬 의미
      MainAxisAlignment enum을 받음. center, end, spaceAround, spaceBetween, spaceEvenly, start        가 있음
    * ##### crossAxisAlignment
      세로 축 정렬 의미
      CrossAxisAlignment enum을 받음. center, end, start, stretch, baseline가 있음

    MainAxisAlignment 기본값 : MainAxisAlignment.start
    CrossAxisAlignment 기본값 : CrossAxisAlignment.center

## Column
열, 즉 세로 배치를 도와주는 위젯
children 프로퍼티에 위젯 리스트를 넣어주면, 세로로 진열가능

### Column 위젯의 프로퍼티들
Row와 동일
mainAxisAlignment는 세로 축 정렬을 의미하고 crossAxisAlignment는 가로 축 정렬을 의미

###  Row와 Column의 MainAxisAlignment와 CrossAxisAlignment
Row기준 MainAxis는 가로, Column기준 MainAxis는 세로 -> 같은 MainAxisAlignment라고 해도 적용되는 축이 다름

#### MainAxisAlignment
* start, center, end는 이름 그대로 동작
* spaceBetween 앞과 뒤에 공백 없이 사이에 동일한 간격으로 공백을 넣어줌.
* spaceEvenly는 앞과 뒤에도 동일한 간격으로 공백을 넣어준다.
* spaceAround는 앞과 뒤에 공백을 넣어주긴 하나, 위젯들 사이에 들어가는 공백의 절반만큼만 공백이 들어감

#### CrossAxisAlignment
* start, center, end는 이름 그대로 동작
* stretch는 빈 부분을 채워서 정렬
* baseline은 텍스트의 밑부분을 뜻함 -> 텍스트의 밑단을 기준으로 정렬
  textBaseLine이라는 프로퍼티와 같이 써야 오류 안 남
  textBaseLine 프로퍼티는 TextBaseLine.alphbetic(알파벳 기준)과 TextBaseLine.ideographic(텍스트 영역의 아래를 기준)의 두 enum을 받음





출처: https://noguen.tistory.com/236 [NOGUEN 블로그:티스토리]

    


