import 'package:flutter/material.dart';

import '../models/storage/cache.dart';

import '../models/api/order.dart';
import '../models/api/order_agrement.dart';

class OrderPage extends StatefulWidget {
  Order order;

  OrderPage({this.order});

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {

  List<String> skills = [
    'Электротехника',
    'Сантехника',
    'Электропроводка',
    'Мелкий ремонт',
    'Перенос груза',
    'Уборка',
  ];
  
  String name;
  String description;
  String category;

  int priceFrom = 100;
  int priceTo = 500;
  List<DatePeriod> periods = [
    DatePeriod(
      date: '',
      beginTime: '10:00',
      endTime: '18:00'
    )
  ];

  @override
  void initState(){
    super.initState();

    category = skills[0];

    periods = [
      DatePeriod(
        date: '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}',
        beginTime: '10:00',
        endTime: '15:00'
      )
    ];
    if (widget.order != null){
      name = widget.order.name;
      description = widget.order.description;
      category = widget.order.category;

      periods = widget.order.periods;

      priceFrom =   priceFrom;
      priceTo = widget.order.priceTo;
    }
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
            Text('Заказ',
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
                   Container(
                    margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Название'
                      ),
                      onChanged: (val){
                        setState(() {
                          name = val;                          
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: TextField(
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Краткое описание'
                      ),
                      onChanged: (val){
                        setState(() {
                          description = val;                          
                        });
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                    child: Text('Категория',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54
                      ),
                    ), 
                  ),
                  GestureDetector(
                    onTap: (){
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: const Text('Выберите категорию'),
                              children: List.generate(skills.length, (ind){
                                return SimpleDialogOption(
                                  onPressed: () { Navigator.pop(context, skills[ind]);},
                                  child: Text(skills[ind])
                                );
                              }
                            )
                          );
                        }
                      ).then((val){
                        if (val != null){
                          setState(() {
                            category = val; 
                          });
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0, top: 15.0),
                      child: Text(category,
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Theme.of(context).primaryColorDark
                        ),
                      )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    child: Divider(),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                    child: Text('Цена',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54
                      ),
                    ), 
                  ),     
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'От'
                            ),
                            onChanged: (val){
                              setState(() {
                                priceFrom = int.parse(val);                                
                              });
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'До'
                            ),
                            onChanged: (val){
                              setState(() {
                                priceTo = int.parse(val);                                
                              });
                            },
                          ),
                        )
                      ]
                    )
                    ),                        Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                    child: Text('Даты',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54
                      ),
                    ), 
                  ),      
                  Container(
                    margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: List.generate(periods.length, 
                        (ind){
                          return Column(
                            children:[
                              Padding(padding: EdgeInsets.only(bottom: 0.0)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(hour: 10, minute: 00),
                                      ).then((val){
                                        if (val != null){
                                          setState(() {
                                            periods[ind].beginTime = '${val.hour.toString().padLeft(2, '0')}:${val.minute.toString().padLeft(2, '0')}';                                            
                                          });
                                        }
                                      });
                                    },
                                    child: Container(
                                      child: Text(periods[ind].beginTime,
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Theme.of(context).primaryColorDark
                                        ),
                                      )
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(hour: 15, minute: 00),
                                      ).then((val){
                                        if (val != null){
                                          setState(() {
                                            periods[ind].endTime = '${val.hour.toString().padLeft(2, '0')}:${val.minute.toString().padLeft(2, '0')}';                                            
                                          });
                                        }
                                      });
                                    },
                                    child:Container(
                                      child: Text(periods[ind].endTime,
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Theme.of(context).primaryColorDark
                                        ),
                                      )
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now().add(Duration(days: 30)),
                                        initialDate: DateTime.now().add(Duration(days: 3))
                                      ).then((val){
                                        if (val != null){
                                          setState(() {
                                            periods[ind].date = '${val.year}-${val.month}-${val.day}';                                            
                                          });
                                        }
                                      });
                                    },
                                    child: Container(
                                      child: Text(periods[ind].date,
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Theme.of(context).primaryColorDark
                                        ),
                                      )
                                    )
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.all(2.0),
                                    icon: Icon(Icons.close,
                                      color: ind > 0 ? Theme.of(context).primaryColorDark : Colors.transparent,
                                    ),
                                    onPressed: (){
                                      setState(() {
                                        if (ind > 0){
                                          periods.removeAt(ind);   
                                        }                                     
                                      });
                                    }
                                  )
                                ]
                              ),
                              Divider()
                            ]
                          );
                        }
                      )
                    )
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10.0),
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
                          setState(() {
                            periods.add( 
                              DatePeriod(
                                date: '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}',
                                beginTime: '10:00',
                                endTime: '15:00'
                              )
                            );                        
                          });
                        }
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0, bottom: 10.0),
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
                        child: Text('ДОБАВИТЬ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorLight
                          )        
                        ),
                      ),
                      onPressed: (){
                        if (name == null || description == null || priceFrom == null || priceTo == null){
                          showDialog(context: context, 
                           child: AlertDialog(
                             title: Text('Ошибка'),
                             content: Text('Введите все поля!'),
                             actions: [
                               FlatButton(
                                 child: Text('Ок'),
                                 onPressed: () {
                                   Navigator.pop(context);
                                 }
                               ),
                             ]
                           )
                          );    
                        }else{
                          setState(() {
                            Cache.createdOrders.add(Order(
                              name: name,
                              category: category,
                              description: description,
                              periods: periods,
                              priceFrom: priceFrom,
                              priceTo: priceTo
                            ));  
                          showDialog(context: context, 
                            child: AlertDialog(
                              title: Text('Успех'),
                              content: Text('Вы успешно добавили заказ!'),
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
                          });
                        }
                      },
                    )
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0),)
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
