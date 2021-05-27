class TransactionModel {
  String name;
  String photo;
  String date;
  String amount;

  TransactionModel({this.name, this.photo, this.date, this.amount});
}

List<TransactionModel> transactions = [
    TransactionModel(
        name: "Panel Doors",
        photo: "assets/images/furniture/furniture1.png",
        date: "1st Apr 2020",
        amount: "-Ksh 35.214"),
    TransactionModel(
        name: "Cealing Board",
        photo: "assets/images/furniture/jacalyn-beales-435629-unsplash.png",
        date: "30th Mar 2020",
        amount: "-Ksh 100.00"),
    TransactionModel(
        name: "Flush Door",
        photo: "assets/images/furniture/pexels-patryk-kamenczak-775219.jpg",
        date: "15th Mar 2020",
        amount: "+Ksh 250.00")
  ];