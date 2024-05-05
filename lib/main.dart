import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
        Center(
          child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                CustomPaint(
                  size: Size(200, 100),
                  painter: MyPainter(
                    left:false,
                    right:true
                  )
                ),
                CustomPaint(
                    size: Size(200, 100),
                    painter: MyPainter(
                        left:false,
                        right:false
                    )
                ),
                CustomPaint(
                    size: Size(200, 100),
                    painter: MyPainter(
                        left:true,
                        right:true
                    )
                ),
              ]
          )
        ),
      ),
    );
  }
}


class MyPainter extends CustomPainter {
  final bool left;
  final bool right;

  MyPainter({this.left = false, this.right = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;

    final leftPath = Path(); //왼쪽 그리기

    if(left){
      leftPath.moveTo(100,0);
      leftPath.lineTo(50,0);
      leftPath.arcToPoint(
              const Offset(50,50),
              radius: const Radius.circular(10),
              clockwise: false
          );
      leftPath.lineTo(100,50);
    }
    else{
      leftPath.moveTo(100, 0);
      leftPath.lineTo(50, 0);
      leftPath.arcToPoint(
              const Offset(50, 50),
              radius: const Radius.circular(10),
              clockwise: true
          );
      leftPath.lineTo(100, 50);
    }

    final rightPath = Path(); //오른쪽 그리기

    if(right){
      rightPath.moveTo(100, 0);
      rightPath.lineTo(150, 0);
      rightPath.arcToPoint(
          const Offset(150, 50),
          radius: const Radius.circular(10),
          clockwise: true
      );
      rightPath.lineTo(100, 50);
    }
    else{
      rightPath.moveTo(100, 0);
      rightPath.lineTo(150, 0);
      rightPath.arcToPoint(
              const Offset(150, 50),
              radius: const Radius.circular(10),
              clockwise: false
          );
      rightPath.lineTo(100, 50);

    }

    final Path combinedPath = Path.combine(
      PathOperation.union,
      leftPath,
      rightPath,
    );

    canvas.drawPath(combinedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/*
class Paint2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawPath(getLeftDentPath(),paint);
    canvas.drawPath(getRightDentPath(),paint);
  }

  Path getLeftDentPath(){
    Path path = Path()
      ..moveTo(150,0)
      ..lineTo(50,0)
      ..arcToPoint(
          const Offset(50,50),
          radius: const Radius.circular(10),
          clockwise: true
      )
      ..lineTo(150,50)
      ..close();
    return path;
  }

  Path getRightDentPath(){
    Path path = Path()
      ..moveTo(150,0)
      ..lineTo(250,0)
      ..arcToPoint(
          const Offset(250,50),
          radius: const Radius.circular(10),
          clockwise: false
      )
      ..lineTo(150,50)
      ..close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Paint3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawPath(getLeftRoundPath(),paint);
    canvas.drawPath(getRightRoundPath(),paint);
  }

  Path getLeftRoundPath(){
    Path path = Path()
      ..moveTo(150,0)
      ..lineTo(50,0)
      ..arcToPoint(
          const Offset(50,50),
          radius: const Radius.circular(10),
          clockwise: false
      )
      ..lineTo(150,50)
      ..close();
    return path;
  }

  Path getRightRoundPath(){
    Path path = Path()
      ..moveTo(150,0)
      ..lineTo(250,0)
      ..arcToPoint(
          const Offset(250,50),
          radius: const Radius.circular(10),
          clockwise: true
      )
      ..lineTo(150,50)
      ..close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



*/