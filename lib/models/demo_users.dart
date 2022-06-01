import 'package:flutter/material.dart';

const users = [
  userAditya,
  userHuzaifa,
  userMihir,
  userOwais,
  userSmriti,
  userRohan,
  userSakshi,
  userTuba
];

const userOwais = DemoUser(
  id: 'owais',
  name: 'Owais Shaikh',
  image:
      'https://images.unsplash.com/photo-1567027757540-7b572280fa22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
);

const userHuzaifa = DemoUser(
    id: 'huzaifa',
    name: 'Huzaifa ',
    image:
        'https://images.unsplash.com/photo-1622547748225-3fc4abd2cca0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80');

const userAditya = DemoUser(
  id: 'aditya',
  name: 'Aditya paranjape ',
  image:
      'https://images.unsplash.com/photo-1459356979461-dae1b8dcb702?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
);

const userMihir = DemoUser(
  id: 'Mihir',
  name: 'Mihir Kulkarni',
  image:
      'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
);

const userRohan = DemoUser(
  id: 'rohan',
  name: 'Rohan oak',
  image:
      'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
);

const userSakshi = DemoUser(
  id: 'sakshi',
  name: 'Sakshi Joshi',
  image:
      'https://images.unsplash.com/photo-1604004215402-e0be233f39be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
);
const userSmriti = DemoUser(
  id: 'smriti',
  name: 'Smriti Mahale',
  image:
      'https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80',
);
const userTuba = DemoUser(
  id: 'tuba',
  name: 'Tuba Khan',
  image:
      'https://images.unsplash.com/photo-1502219684198-fa9b5164d9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
);

@immutable
class DemoUser {
  final String id;
  final String name;
  final String image;

  const DemoUser({
    required this.id,
    required this.name,
    required this.image,
  });
}
