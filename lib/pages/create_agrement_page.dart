import 'package:flutter/material.dart';

import '../models/storage/cache.dart';

import '../models/api/order.dart';
import '../models/api/order_agrement.dart';

class CreateAgrementPage extends StatefulWidget {
  Order order;

  CreateAgrementPage({this.order});

  @override
  CreateAgrementPageState createState() => CreateAgrementPageState();
}

class CreateAgrementPageState extends State<CreateAgrementPage> {

  int dateIndex = 0;
  int price = 0;

  @override
  void initState(){
    super.initState();
    
    price = widget.order.priceFrom;
  }

  Widget buildAppBar(BuildContext context){
    return PreferredSize( 
      preferredSize: Size(MediaQuery.of(context).size.width, 50.0),
      child: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
        elevation: 1.0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children:[
            Text('Детали заказа',
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontSize: 20.0,
               // fontStyle: FontStyle.italic
              ),
            )
          ]
        ),
        actions: [
        
        ]
      )
    );
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView( 
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.width * 0.2,
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
                              child: Text('${widget.order.user.firstName}\n${widget.order.user.lastName}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 16.0
                                ),
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text('${widget.order.user.rating}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18.0
                                ),
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 1.0),
                              child: Text('рейтинг',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 12.0
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
                            width: MediaQuery.of(context).size.width * 0.8 - 90,
                            margin: EdgeInsets.only(left: 25.0),
                            child: Text(widget.order.name,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 24.0
                              ),
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.0, top: 2.0),
                            child: Row(
                              children:[
                                Text(widget.order.category,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontSize: 16.0
                                  ),
                                )
                              ]
                            )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8 - 90,
                            margin: EdgeInsets.only(left: 25.0, top: 10.0),
                            child: Text(widget.order.description,
                              maxLines: 7,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.0
                              ),
                            )
                          )
                        ]
                      )
                    ]
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25.0, left: 10.0),
                    child: Text('Выберите дату',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 16.0
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: List.generate(widget.order.periods.length, 
                        (ind){
                          return Row(
                            children: [
                              Radio<int>(
                                value: ind,
                                groupValue: dateIndex,
                                  onChanged: 
                                  (val){
                                    setState(() {
                                      dateIndex = ind;                              
                                    }
                                  );
                                },
                              ),
                              Text(widget.order.periods[ind].beginTime,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 16.0
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 5.0)),
                              Text('-',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 16.0
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 5.0)),
                              Text(widget.order.periods[ind].endTime,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 16.0
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10.0)),
                              Text(widget.order.periods[ind].date,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 16.0
                                ),
                              ),
                            ]
                          );
                        }
                      ),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Text('Цена',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 16.0
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 5.0, left: 0.0),
                    child: Text('$price р',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2.0, right: 2.0),
                    child: Slider(
                      value: price.toDouble(),
                      min: widget.order.priceFrom.toDouble(),
                      max: widget.order.priceTo.toDouble(),
                      onChanged: (val){
                        setState(() {
                          price = val.floor();                         
                        });
                      },
                    ),
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
                        child: Text('ОТКЛИКНУТЬСЯ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorLight
                          )        
                        ),
                      ),
                      onPressed: (){
                        setState(() {
                          try {
                            var t = Cache.assignedOrders.where((t) => t.order.id == widget.order.id).first;
                            showDialog(context: context, 
                              child: AlertDialog(
                                title: Text('Ошибка'),
                                content: Text('Вы уже откликнулись на эту заявку'),
                                actions: [
                                  FlatButton(
                                    child: Text('Ок'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }
                                  ),
                                ]
                              ),        
                            );
                          } catch (Exception){
                            showDialog(context: context, 
                              child: AlertDialog(
                                title: Text('Успех'),
                                content: Text('Вы успешно откликнулись на заявку!'),
                                actions: [
                                  FlatButton(
                                    child: Text('Ок'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    }
                                  ),
                                ]
                              ),        
                            );
                            Cache.assignedOrders.add(
                              OrderAgrement(
                                id: Cache.assignedOrders.length,
                                price: price,
                                period: widget.order.periods[dateIndex],
                                order: widget.order
                              )
                            );  
                          }  
                        });
                      },
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
