import 'package:real_estate_app/client/model/house.dart';

final _house1 = House(
    imageUrl: 'assets/images/house1.jpeg',
    address: 'Janison, MI 49428,SF',
    price: 200.00,
    bedRooms: 4,
    bathRooms: 2,
    garages: 2,
    sqFeet: 1.416,
    isFav: false,
    moreImagesUrl: [
      'assets/images/house1.jpeg',
      'assets/images/indoor1.jpg',
      'assets/images/indoor2.jpg',
      'assets/images/indoor3.jpg',
      'assets/images/indoor4.jpg',
      'assets/images/indoor5.jpg',
    ]);

final _house2 = House(
    imageUrl: 'assets/images/house2.jpeg',
    address: '351, Rockwood Dr,SF',
    price: 140.00,
    bedRooms: 4,
    bathRooms: 2,
    garages: 1,
    sqFeet: 1.416,
    isFav: false,
    moreImagesUrl: [
      'assets/images/house2.jpeg',
      'assets/images/indoor1.jpg',
      'assets/images/indoor2.jpg',
      'assets/images/indoor3.jpg',
      'assets/images/indoor4.jpg',
      'assets/images/indoor5.jpg',
    ]);

final _house3 = House(
    imageUrl: 'assets/images/house2.jpeg',
    address: '354, Hendrywood Dr,SF',
    price: 210.00,
    bedRooms: 5,
    bathRooms: 3,
    garages: 1,
    sqFeet: 1.700,
    isFav: false,
    moreImagesUrl: [
      'assets/images/house3.jpeg',
      'assets/images/indoor1.jpg',
      'assets/images/indoor2.jpg',
      'assets/images/indoor3.jpg',
      'assets/images/indoor4.jpg',
      'assets/images/indoor5.jpg',
    ]);

final _house4 = House(
    imageUrl: 'assets/images/house4.png',
    address: 'Manison, MI 49526,SF',
    price: 170.00,
    bedRooms: 2,
    bathRooms: 1,
    garages: 1,
    sqFeet: 1.210,
    isFav: false,
    moreImagesUrl: [
      'assets/images/house4.png',
      'assets/images/indoor1.jpg',
      'assets/images/indoor2.jpg',
      'assets/images/indoor3.jpg',
      'assets/images/indoor4.jpg',
      'assets/images/indoor5.jpg',
    ]);

final _house5 = House(
    imageUrl: 'assets/images/house5.jpeg',
    address: 'BackStreet, MI 49526,SF',
    price: 150.00,
    bedRooms: 3,
    bathRooms: 1,
    garages: 1,
    sqFeet: 1.42,
    isFav: false,
    moreImagesUrl: [
      'assets/images/house5.jpeg',
      'assets/images/indoor1.jpg',
      'assets/images/indoor2.jpg',
      'assets/images/indoor3.jpg',
      'assets/images/indoor4.jpg',
      'assets/images/indoor5.jpg',
    ]);

final List<House> houseList = [
  _house2,
  _house1,
  _house3,
  _house4,
  _house5,
];

List<String> categoryList = [
  'For Sale',
  'rent',
];
