import 'package:flutter/material.dart';

import 'create_agrement_page.dart';
import '../routes/default_page_route.dart';

import '../models/storage/cache.dart';

class NearOrdersPage extends StatefulWidget {
  
  Widget appBar;
  Function(Widget) onLoad;

  @override
  NearOrdersPageState createState() => NearOrdersPageState();
}

class NearOrdersPageState extends State<NearOrdersPage> {

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
            Text('Доступные заказы',
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
            icon: Icon(Icons.search, color: Theme.of(context).accentColor),
            onPressed: () {   
                         
            }
           )
        ]
      )
    );
    widget.onLoad(widget.appBar);
  } 

  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: List.generate(Cache.nearOrders.length, (ind){
          var order = Cache.nearOrders[ind];
          var user = order.user;
          return Container(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  DefaultPageRoute(builder: (context) => CreateAgrementPage(order: order)),
                );  
              },
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Theme.of(context).primaryColor)
                              ),
                              child: Icon(Icons.person,
                                color: Colors.grey,
                                size: 40.0,
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text('${user.firstName}\n${user.lastName}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 12.0
                                ),
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text('${user.rating}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14.0
                                ),
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 1.0),
                              child: Text('рейтинг',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 10.0
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(order.name,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20.0
                              ),
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.0, top: 10.0),
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
                            margin: EdgeInsets.only(left: 25.0, top: 3.0),
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
                            margin: EdgeInsets.only(left: 25.0, top: 3.0),
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
                            margin: EdgeInsets.only(left: 25.0, top: 3.0),
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
                      )
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
