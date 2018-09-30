import '../api/order.dart';
import '../api/order_agrement.dart';
import '../api/user.dart';

class Cache {

  static User user = User();

  static List <Order> nearOrders = [
    Order(
      id: 1, 
      userId: 1,
      name: 'Починка крана', 
      description: 'Проблема с краном на кухне, необходим срочный ремонт', 
      periods: [
        DatePeriod(
          date: '2018-10-10', 
          beginTime: '12:00', 
          endTime: '15:00',
        ),
         DatePeriod(
          date: '2018-10-11', 
          beginTime: '11:00', 
          endTime: '14:00',
        )
      ],
      category: 'Сантехника',
      priceFrom: 1000,
      priceTo: 1500,
      user: User(
        id: 1,
        rating: 4.5,
        firstName: 'Иван',
        lastName: 'Петров',
        address: 'Казань',
        skills: ['Ремонт']
      ),
    ),
    Order(
      id: 2, 
      userId: 2,
      name: 'Починка ванной', 
      description: 'Проблема с ванной, необходимо пробить канализацию', 
      periods: [
        DatePeriod(
          date: '2018-10-12', 
          beginTime: '08:00', 
          endTime: '15:00',
        )
      ],
      category: 'Сантехника',
      priceFrom: 2000,
      priceTo: 2300,
      user: User(
        id: 2,
        rating: 4.0,
        firstName: 'Петр',
        lastName: 'Федоров',
        address: 'Москва',
        skills: ['Ремонт']
      )
    ),
    Order(
      id: 3, 
      userId: 3,
      name: 'Достака пианино', 
      description: 'Необходимо доставить пианино на 10 этаж без лифта', 
      periods: [
        DatePeriod(
          date: '2018-10-14', 
          beginTime: '12:00', 
          endTime: '15:00',
        ),
         DatePeriod(
          date: '2018-10-16', 
          beginTime: '10:00', 
          endTime: '12:00',
        )
      ],
      category: 'Перенос грузов',
      priceFrom: 400,
      priceTo: 700,
      user: User(
        id: 3,
        rating: 5.0,
        firstName: 'Густав',
        lastName: 'Байт',
        address: 'Казань',
        skills: ['Ремонт']
      )
    )
  ];

  static List <OrderAgrement> assignedOrders = [

  ];

  static List <Order> createdOrders = [

  ];
  
}