import 'package:flutter/material.dart';

import 'order_page.dart';

import '../models/storage/cache.dart';
import '../routes/default_page_route.dart';
import '../models/storage/cache.dart';

class CreatedOrdersPage extends StatefulWidget {
  
  Widget appBar;
  Function(Widget) onLoad;
  Function(int) onSwitch;

  @override
  CreatedOrdersPageState createState() => CreatedOrdersPageState();
}

class CreatedOrdersPageState extends State<CreatedOrdersPage> {

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
            Text('Мои заказы',
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
            icon: Icon(Icons.calendar_view_day, color: Theme.of(context).primaryColorLight),
            onPressed: () {   
              widget.onSwitch(0);             
            }
           )
        ]
      )
    );
    widget.onLoad(widget.appBar);
  } 

  @override
  Widget build(BuildContext context) {
    if (Cache.createdOrders.isEmpty){
      return Container( 
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Добавить заказ',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20.0
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).primaryColorDark)
              ),
              child: IconButton(
                padding: EdgeInsets.all(2.0),
                icon: Icon(Icons.add,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    DefaultPageRoute(builder: (context) => OrderPage()),
                  );
                },
              ),
            )
          ],
        ),
      );
    } else {
      return Container( 
      margin: EdgeInsets.all(10.0),
        child: ListView(
          children: List.generate(Cache.createdOrders.length, (ind){
            var order = Cache.createdOrders[ind];
            var dt = DateTime.parse('${order.periods[0].date} ${order.periods[0].beginTime}');
            return Container(
              child: GestureDetector(
                onTap: (){
                
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
                              child: Text(order.name,
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
                                  Text(order.category,
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
                                  Text(order.periods[0].date,
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
                                  Text('${order.periods[0].beginTime} - ${order.periods[0].endTime}',
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
                                  Text('${order.priceFrom} - ${order.priceTo} р',
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
                          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 10.0),
                          height: 45.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).primaryColor.withAlpha(200),
                              ]
                            )
                          ),
                          child: FlatButton(
                            color: Colors.transparent,
                            child: Container(
                              height: 45.0,
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: Text('УДАЛИТЬ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColorLight
                                )        
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                Cache.createdOrders.removeAt(ind);                                                            
                              });
                            },
                          )
                        ),
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
}
