import 'order.dart';
import 'user.dart';

class OrderAgrement {
  int id;

  int price;
  DatePeriod period;
  User user;
  Order order;

  OrderAgrement({this.id, this.price, this.period, this.user, this.order});

}