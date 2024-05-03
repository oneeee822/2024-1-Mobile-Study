# UI 구성 방식

## Imperative UI (명령형)
'어떻게' 구성하는지 명시
전통적인 방식, 정보를 정확히 전달해야함   
e.g., 사각형을 그리기 위해서는 기계에게 사각형의 정의까지 알려줘야함
## Declaratice UI (선언형)
'무엇을' 구성하는지 명시   
e.g., 기계가 사각형을 알고 있기에 정의가 무엇인지 몰라도 됨.

F(State) = View 함수에 인자로 State를 넘겨주면 그것을 View로 보여준다는 공식
즉, 커다란 골조는 완성되어있고 그 안에 어떤 상태를 명시해주는 방식으로 View 구성

--> 지금 학습하는 Flutter는 Declaratice UI 방식으로 View 그림

# State
데이터들을 일반적으로 상태로 표현 -> 보여주고자 하는 데이터 혹은 모습

## AppDate
앱 전반에서 사용되는 데이터
AppData의 변경점을 다른 페이지에서도 보여줘야함
## WidgetData
위젯에서 사용되는 데이터 -> 다른 페이지에서 필수적으로 변경하지 않아도 됨

# Stateless & Stateful


## Stateless
여태 이용한 것들 모두 Stateless Widget   
상태가 없다는 것은 표현할 모습이나 데이터가 없다는 것   
첫모습이 보여줄 전부, 정적임, 새로고침이 없는 위젯   

## Stateful
상태있음, 동적, 새로고침이 있는 위젯   
유저상호작용이 있는 앱들은 대부분 Stateful Widget으로 제작

### StatefulWidget Template
```
class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State createState() => _HomePageState(); // createState() 매서드를 통해 _HomePageState를 연결, 
                                                //StatefulWidget이 호출될 때마다 생성
                                                //createState() 매서드가 생성한 객체를 반환
}

class _HomePageState extends State {
	CalendarFormat calenderFormat = CalendarFormat.month;

	DateTime selectedDate = DateTime.now();

	@override
	Widget build(BuildContext context) {
		return Container();
	}
}
```
#### 클래스 두 개를 사용하는 이유?
StatefulWidget클래스는 Widget 클래스를 상속함. but Widget 클래스는 immutable함.   
mutable한 속성을 대신하기 위해 _HomePageState클래스를 만든 것임.    
따라서 _HomePageState클래스는 State클래스가 됨.   


### setState함수
매개변수로 람다 함수를 넣어줌으로써 상태 변화시킨 것을 적용할 수 있음.   
즉, 역할은 위젯을 다시 그려주는 것   
setState(() {}) 의 매개변수는 위젯을 다시 그려주기 전에 수행할 명령어 집합   

#### setState method 사용시 문제점
한 개 위젯의 state를 업데이트하려 해도 그 이하 모든 위젯들을 리빌드 해야함. -> 비효율   
동시에 다른 위젯의 state를 업데이트 시키지 못함   

-> 이를 해결하기 위해 State management 개념 생성

# State management
위젯이 쉽게 데이터에 접근할 수 있는 방법   
변화된 데이터에 맞추어 UI를 다시 그려주는 기능

## Provider
상태관리 솔루션 라이브러리이다.

Model 클래스를 만들어줌으로써 data를 전달함.

Provider도 하나의 위젯, 일반 위젯과 똑같은 특성을 가짐
Provider위젯은 데이터를 필요로하는 위젯들보다 항상 상위에 위치해야함.

### Provider의 required argument
Create<T> create라는 required argument를 가지고 있음.   
create매서드로 Model클래스를 리턴해주면 Provider의 child 클래스에 있는 모든 위젯에서 Model클래스 인스턴스에 접근할 수 있게 된다.   
e.g., 
```
Widget build(BuildContext context) {
  return Provider(
    create: (context) => Model(name: name)
    child: //자식클래스
  );
}
```

#### of매서드
of매서드는 주어진 context를 거슬러 올라가면서 가장 가까이에 있는 원하는 타입의 인스턴스를 찾아서 반환하라는 의미.

### 전달방법
Provider.of<데이터타입>(context).변수이름 => data;   
