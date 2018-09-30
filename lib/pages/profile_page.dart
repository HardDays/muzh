import 'package:flutter/material.dart';

import 'profile_edit_page.dart';

import '../models/storage/cache.dart';
import '../routes/default_page_route.dart';

class ProfilePage extends StatefulWidget {
  
  Widget appBar;
  Function(Widget) onLoad;

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

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
            Text('Профиль',
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
            icon: Icon(Icons.edit, color: Theme.of(context).primaryColorLight),
            onPressed: () {   
              Navigator.push(
                context,
                DefaultPageRoute(builder: (context) => ProfileEditPage()),
              );            
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
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Card(
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).primaryColor)
                  ),
                  child: Icon(Icons.person,
                    color: Colors.grey,
                    size: MediaQuery.of(context).size.width * 0.3,
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: Text('${Cache.user.firstName ?? 'Имя'} ${Cache.user.lastName ?? ''}',
                    style: TextStyle(
                      fontSize: 20.0,
                      //color: Theme.of(context).primaryColor
                    ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Text('4.3',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Theme.of(context).primaryColor
                    ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
                  child: Text('рейтинг',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).primaryColorDark
                      //color: Theme.of(context).primaryColor
                    ),
                  )
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text('0',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                            Text('Заказов\nвыполнено',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColorDark
                              ),
                            )
                          ],
                        ), 
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text('0',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                            Text('Заказов\nсоздано',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColorDark
                              ),
                            )
                          ],
                        ),                   
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text('0 р',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                            Text('Денег\nзаработано',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColorDark
                              ),
                            )
                          ],
                        ), 
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text('0 р',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                            Text('Денег\nпотрачено',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColorDark
                              ),
                            )
                          ],
                        ),                   
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
