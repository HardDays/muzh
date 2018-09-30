import 'user.dart';

class DatePeriod {
  String date;
  String beginTime;
  String endTime;

  DatePeriod({this.date, this.beginTime, this.endTime});
}

class Order {
  int id;
  
  int userId;

  int priceFrom;
  int priceTo;

  String name;
  String description;
  String category;
  
  List <DatePeriod> periods;

  User user;

  Order({this.id, this.periods, this.userId, this.user, this.name, this.description, this.category, this.priceFrom, this.priceTo});
}