class Item {
  String imgPath;
  double price;
  String nameproduct;
  String location;
  
  Item({required this.imgPath, required this.price,required this.nameproduct, this.location="main branch"});
}


 final List items = [
  Item(nameproduct:"product 1", imgPath: "assets/img/1.webp",price: 12.99,location: "mohamed elsalamony"),
  Item(nameproduct:"product 2",imgPath: "assets/img/2.webp",price: 12.99),
  Item(nameproduct:"product 3",imgPath: "assets/img/3.webp",price: 12.99),
  Item(nameproduct:"product 4",imgPath: "assets/img/4.webp",price: 12.99),
  Item(nameproduct:"product 5",imgPath: "assets/img/5.webp",price: 12.99),
  Item(nameproduct:"product 6",imgPath: "assets/img/6.webp",price: 12.99),
  Item(nameproduct:"product 7",imgPath: "assets/img/7.webp",price: 12.99),
  Item(nameproduct:"product 8",imgPath: "assets/img/8.webp",price: 12.99),
 ];