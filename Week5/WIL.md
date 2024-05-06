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
<br/><br/>
# State
데이터들을 일반적으로 상태로 표현 -> 보여주고자 하는 데이터 혹은 모습

### AppDate
앱 전반에서 사용되는 데이터
AppData의 변경점을 다른 페이지에서도 보여줘야함
### WidgetData
위젯에서 사용되는 데이터 -> 다른 페이지에서 필수적으로 변경하지 않아도 됨   

<br/><br/>
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

<br/><br/>
# State management
위젯이 쉽게 데이터에 접근할 수 있는 방법   
변화된 데이터에 맞추어 UI를 다시 그려주는 기능
<br/><br/>
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

#### 전달방법
Provider.of<데이터타입>(context).변수이름 => data;   
<br/><br/>
### ChangeNotifierProvider
changeNotifier 인스턴스를 만들어서 프로바이더로 쉽게 접근

#### ChangeNotifier
위젯에 listen값을 알려줌 - true면 새로 그리고 false면 그리지 X   
addListener로 콜백함수를 실행할 수 있음. ( dispose를 수동으로 해줘야함)
<br/><br/>
### MultiProvider
Provider를 같은 위젯에 여러개 공유시킬 때 ChangeNotifierProvider의 child로 ChangeNotifierProvider를 넣고, 그 child로 다른 ChangeNotifierProvider를 넣는 형태로 공유하는대신 이용할 수 있는 것.   

MultiProvider의 providers: 속성에 리스트로 provider을 넣으면 됨
<br/><br/>
### Provider의 장점
- 위젯 리빌드시 상태 손실 걱정 없이 create, observe, dispose 가능
- lazy loading 지원하여 사용자가 사용중이지 않은 Provider를 당장 로딩하지 X
- Flutter의 devetool엥서 Provider 객체 관찰가능
- 단방향 데이터 흐름으로 앱의 확장성 높임
### Provider의 결함
- 런타임에 ProviderNotFoundException이 호출
- Provider를 더 이상 사용하지 않을 때 수동으로 dispose 해야함
- 다른 Provider를 의존하는 Provider를 생성할 수 X
  
<br/><br/>
## Riverpod
Provider 패키지의 상위 버전 패키지   
Provider의 결함을 해결한 후 Provider의 장점을 상속하여 제작

### Riverpod 장점
- Compile-safe : 컴파일 타임에 오류 발견 -> 런타임에 ProviderNotFoundException 예외 발생하지 X
- Flutter SDK에 의존 X : Flutter 뿐만 아니라 Dart에서도 사용 가능
- 동일한 타입의 여러 개의 Provider 가질 수 있음
- ProxyProvider사용없이 다른 Provider와 간편하게 결합가능
- 테스트 내에서 Provider 재정의 필요 X
- autoDispose 기능 제공

<br/><br/>
## GetX

### 상태관리방식   
   
#### 단순 상태 관리
기존의 데이터와 변경되는 데이터가 같은지 확인하지 X   

변화하는 상태를 관리하는 객체 Controller를 사용하고 이 Controller는 GetXController를 상속함.   
(GetX의 상태 관리를 위해서는 무조건 GetXController를 상속받아야 함)
update() 메소드는 화면 전체를 리빌드함으로써 controller를 바라보고 있는 모든 코드에 업데이트를 알리는 역할을 함.   
상태 변화를 감지하기 위해서는 매번 update() 메소드를 호출해야함.   

별도의 Controller 인스턴스 초기화없이 GetBuilder 내부에서 초기화 할 수도 있음.Get.find() 메소드를 통해 인스턴스를 불러올 수 있음

#### 반응형 상태 관리
데이터에 변화가 있을 때만 재랜더링   
단순 상태관리와 비교했을 때 변수를 선언하는 방식과 업데이트 함수 부분이 다름.   

#### obs
객체를 생성할 때 뒤에 obs가 붙음
ex) ```final person = Person().obs;```
obs는 observable의 약자로, 오브젝트의 변화를 감지하겠다는 의미   
-> GetX는 obs가 붙은 오브젝트들의 변화를 감시   

obs가 붙은 객체는 update라는 메소드를 사용할 수 있음. but 이때 update 메소드는 Simple State Management의 update 메소드와 의미가 다름.

update 메소드는 내부적으로 콜백 인스턴스를 받음. 

#### MVC패턴
MVC(Model-View-Controller) 패턴이란 앱의 구조에 관한 패턴

- Model: 앱의 데이터, repository 등을 담당
- View: 앱의 UI를 담당
- Controller: Model과 View를 연결해주는 역할


