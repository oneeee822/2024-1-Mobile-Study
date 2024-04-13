# 좌표계
좌측 상단에서 좌표계 시작
x좌표의 경우 오른쪽으로 가면 증가, y좌표의 경우 아래로 가면 증가

# CustomPainter의 주요 메소드
CustomPainter로 새로운 형태의 위젯을 만들기 위해서는 CustomPainter클래스를 상속해야함
2개의 메소드 구현 필수
```
class CutomPaintTest extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
```
## paint 메소드
어떻게 위젯이 그려질지를 정하는 메소드
매개변수로 들어오는 canvas를 이용하여 화면에 어떻게 그려질지 입력

### color
색상 정의, Color 클래스의 인스턴스 받음
### style
PaintingStyle enum(fill, stroke) 받음
### strokeWidth
테두리 굵기 정함, double형 받음
style이 PaintingStyle.fill로 설정되어있으면 동작X  

<br/>

## shouldRepaint 메소드
위젯이 다시 호출될 때 이를 다시 렌더링 할 지 안할지를 정하는 메소드
true 반환 -> 다시 렌더링, false 반환 -> 렌더링을 다시 하지 않음

# 만든 CustomPaint 사용하기
CustomPaint 클래스는 Widget을 상속X -> Widget으로 바꿔줘야함
```CustomPaint(
  child: CustomPaintTest()
)
```
이렇게 하면 됨

# Canvas의 메소드
```
canvas.drawLine();  // 선
canvas.drawRect(); //사각형
canvas.drawCircle();  // 원
canvas.drawArc();  // 원호
canvas.drawImage(); // 이미지
canvas.drawImageNine(); //나인패치 이미지
canvas.drawParagraph(); //텍스트 문단
canvas.drawPath(); // 주어진 경로 따라 그림
```
#### 나인패치
나인패치 이미지는 안드로이드에서 해상도 문제로 이미지가 깨지는 문제를 방지하기 위해 만든 이미지다.확대/축소 되는 부분과 그대로 사용되는 부분을 나누어 만들어진 이미지 파일

## drawPath()
추가적으로 만들 수 있음

### Path
첫번째 매개변수 : Path
drawPath가 그릴 경로를 담고 있는 Path 클래스 인스턴스를 넘겨줘야함

#### moveTo
그리는 점을 이동, moveTo()를 실행하지 않으면 기본적으로 (0, 0)에서 시작

#### lineTo
선을 그어주는 메소드, 현재 위치부터 매개변수로 넣어준x와 y 좌표까지 직선을 그어줌

#### arcToPoint
arcToPoint(Offset arcEnd, {Radius radius = Radius.zero, double rotation = 0.0, bool largeArc = false, bool clockwise = true})

시작 지점(현재 지점)에서 명시된 끝 지점까지 호를 그림
clockwise가 true면 시계 방향, false면 반시계 방향

largeArc는 기본적으로 false 
true로 바꾸면 360도에서 우리가 지정한 각도를 뺀 나머지를 그림

#### arcTo
arcTo(Rect rect, double startAngle, double sweepAngle, bool forceMoveTo)
시작하는 지점과 끝나는 지점을 명시한 뒤, 시작 각도와 끝 각도를 명시하여 호를 그리는 메소드

원을 그리는 메소드, 타원의 형태나 곡선과는 알맞지X





