class CardModel {
  String user;
  String cardNumber;
  String cardExpired;
  String cardType;
  int cardBackground;
  String cardElementTop;
  String cardElementBottom;

  CardModel({this.user, this.cardNumber, this.cardExpired, this.cardType,
      this.cardBackground, this.cardElementTop, this.cardElementBottom});
}

List<CardModel> cards = [
    CardModel(
        user: "Erick Ogutu",
        cardNumber: "**** **** **** 1425",
        cardExpired: "03-01-2023",
        cardType: "assets/mastercard_logo.png",
        cardBackground: 0xFF1E1E99,
        cardElementTop: "assets/svg/ellipse_top_pink.svg",
        cardElementBottom: "assets/svg/ellipse_bottom_pink.svg"),
    CardModel(
        user: "Erick Ogutu",
        cardNumber: "**** **** **** 8287",
        cardExpired: "03-01-2025",
        cardType: "assets/mastercard_logo.png",
        cardBackground: 0xFFFF70A3,
        cardElementTop: "assets/svg/ellipse_top_blue.svg",
        cardElementBottom: "assets/svg/ellipse_bottom_blue.svg")
  ];