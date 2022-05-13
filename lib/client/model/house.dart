class House {
  String imageUrl;
  String address;
  double price;
  int bedRooms;
  int bathRooms;
  double sqFeet;
  int garages;
  List<String> moreImagesUrl;
  bool isFav;

  House({
    this.imageUrl,
    this.address,
    this.price,
    this.bathRooms,
    this.bedRooms,
    this.sqFeet,
    this.garages,
    this.moreImagesUrl,
    this.isFav,
  });
}
