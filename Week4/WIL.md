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

