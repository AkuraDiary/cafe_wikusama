class User {
  final String name;
  final String username;
  final String image;
  bool addItem;

  User(this.name, this.username, this.image, this.addItem);
}

class ModelPesanan {
  final String name;
  final String username;
  final String price;
  final String no;
  bool isFollowedByMe;

  ModelPesanan(this.no,this.name, this.username,this.price, this.isFollowedByMe);
}