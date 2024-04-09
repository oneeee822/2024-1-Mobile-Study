
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main(){
  runApp(
  MaterialApp(
    home: Scaffold(
      body:
      Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10,10,180,10),
            child:
            Text(
                "GDSC 모바일 스터디",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                )),
          ),

          Container(
            height:1,
            width:500.0,
            color:Colors.grey,
            margin: EdgeInsets.all(10),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(10,10,320,10),
            child:
            Text(
                "과제",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ))
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 150,
                height: 150,
                child:
                ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        return states.contains(MaterialState.pressed)
                            ? Colors.grey
                            : Colors.white;
                      }),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),

                    shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                    elevation: MaterialStateProperty.all<double>(5.0)
                  ),

                  child:
                    Column(
                    children: [
                      Text("오늘의 과제",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 3,
                          color: Colors.black
                        )
                      ),
                      Icon(Icons.book, size: 50, color: Colors.black)
                    ]
                    ),
                ),
              ),

              Container(
                  width: 150,
                  height: 150,
                child:
                ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        return states.contains(MaterialState.pressed)
                            ? Colors.grey
                            : Colors.white;
                      }),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                      elevation: MaterialStateProperty.all<double>(5.0)
                  ),

                  child:
                  Column(
                      children: [
                        Text("수행한 과제",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                height: 3,
                              color: Colors.black

                            )),
                        Icon(Icons.collections_bookmark,  size: 50, color: Colors.black)
                      ]
                  ),
                )
              )
            ]
          ),

          Container(
              margin: EdgeInsets.fromLTRB(10,30,280,10),
            child:
            Text(
                "나의 수행도",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                )),
          ),

          Container(
            width: 390,
            height: 344,
            decoration : BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.all(Radius.circular(10)
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child:
            TableCalendar(
              firstDay: DateTime.utc(2024,01,01),
              lastDay: DateTime.utc(2024,12,31),
              focusedDay: DateTime.now(),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,

              ),

            ),

          ),

          Container(
              margin: EdgeInsets.fromLTRB(10,20,300,10),
              child:
              Text(
                  "나의 다짐",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  )),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(10,10,300,0),
            child:
              Text("아자뵹~~")
          )


        ]
      )
    ),



  ),



  );

}