import 'package:flutter/material.dart';

import 'view_agrement_page.dart';

import '../models/storage/cache.dart';
import '../routes/default_page_route.dart';

class AssignedOrdersPage extends StatefulWidget {
  
  Widget appBar;
  Function(Widget) onLoad;
  Function(int) onSwitch;

  @override
  AssignedOrdersPageState createState() => AssignedOrdersPageState();
}

class AssignedOrdersPageState extends State<AssignedOrdersPage> {

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState((){
      buildAppBar(context);
    }));
  }

  void buildAppBar(BuildContext context){
    widget.appBar = PreferredSize( 
      preferredSize: Size(MediaQuery.of(context).size.width, 50.0),
      child: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
        elevation: 1.0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children:[
            Text('Принятые заказы',
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontSize: 20.0,
               // fontStyle: FontStyle.italic
              ),
            )
          ]
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.timer, color: Theme.of(context).primaryColorLight),
            onPressed: () {   
              widget.onSwitch(1);            
            }
           )
        ]
      )
    );
    widget.onLoad(widget.appBar);
  } 

  @override
  Widget build(BuildContext context) {
    if (Cache.assignedOrders.isEmpty){
      return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Text('Нет действующих заказов',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20.0
          ),
        ),
      );
    }
    return Container( 
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: List.generate(Cache.assignedOrders.length, (ind){
          var order = Cache.assignedOrders[ind];
          var dt = DateTime.parse('${order.period.date} ${order.period.beginTime}');
          var diff = dt.difference(DateTime.now());;
          return Container(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  DefaultPageRoute(builder: (context) => ViewAgrementPage(order: order)),
                );
              },
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [  
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: Text(order.order.name,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20.0
                              ),
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Row(
                              children:[
                                Container(
                                  width: 100.0,
                                  child: Text('Категория: ',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 16.0
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Text(order.order.category,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontSize: 16.0
                                  ),
                                )
                              ]
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.0, top: 3.0),
                            child: Row(
                              children:[
                                Container(
                                  width: 100.0,
                                  child: Text('Дата: ',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 16.0
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Text(order.period.date,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontSize: 16.0
                                  ),
                                )
                              ]
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.0, top: 3.0),
                            child: Row(
                              children:[
                                Container(
                                  width: 100.0,
                                  child: Text('Время: ',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 16.0
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Text('${order.period.beginTime} - ${order.period.endTime}',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontSize: 16.0
                                  ),
                                )
                              ]
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.0, top: 3.0),
                            child: Row(
                              children:[
                                Container(
                                  width: 100.0,
                                  child: Text('Цена: ',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 16.0
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Text('${order.price} р',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontSize: 16.0
                                  ),
                                )
                              ]
                            )
                          ),
                        ]
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10.0, top: 3.0, right: 10.0),
                        child: Column(
                          children:[
                            Padding(padding: EdgeInsets.only(top: 15.0)),
                            Text('${diff.inHours ~/ Duration.hoursPerDay} дней ${(diff.inHours ~/ Duration.hoursPerDay) % Duration.minutesPerHour} ч ${diff.inMinutes % Duration.minutesPerHour} мин',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 24.0
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 2.0)),
                            Container(
                              alignment: Alignment.center,
                              child: Text('осталось времени',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 16.0
                                ),
                              ),
                            ),
                          ]
                        )
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10.0)),
                    ],
                  ),
                ),
              ),
            )
          );
        })
      ),
    );
  }
}
