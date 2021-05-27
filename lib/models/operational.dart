class OperationModel {
  String name;
  String selectedIcon;
  String unselectedIcon;

  OperationModel({this.name, this.selectedIcon, this.unselectedIcon});
}

List<OperationModel> datas = [
    OperationModel(
        name: "Mpesa\nTransfer",
        selectedIcon: "assets/svg/money_transfer_white.svg",
        unselectedIcon: "assets/svg/money_transfer_blue.svg"),
    OperationModel(
        name: "Bank Card\nPayment",
        selectedIcon: "assets/icons/home.png",
        unselectedIcon: "assets/icons/home_icon.svg"),
    OperationModel(
        name: "Stripe\nPayment",
        selectedIcon: "assets/svg/insight_tracking_white.svg",
        unselectedIcon: "assets/svg/insight_tracking_blue.svg"),
    OperationModel(
        name: "Paypal\nPayment",
        selectedIcon: "assets/icons/wallet.png",
        unselectedIcon: "assets/svg/insight_tracking_blue.svg"),
  ];