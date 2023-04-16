class Userinfo {
  Userinfo(
      {required this.email,
      required this.total_earnings,
      required this.total_expenses,
      required this.estimated_networth,
      required this.targeted_networth,
      required this.cashflow,
      required this.stocks,
      required this.real_estate,
      required this.gold,
      required this.fd,
      required this.fd_interests});

  String email;
  String total_earnings;
  String total_expenses;
  String estimated_networth;
  String targeted_networth;
  String cashflow;
  String stocks;
  String real_estate;
  String gold;
  String fd;
  String fd_interests;
  Map<String, dynamic> toJson() => {
        'email': email,
        'total_earnings': total_earnings,
        'total_expenses': total_expenses,
        'estimated_networth': estimated_networth,
        'targeted_networth': targeted_networth,
        'cashflow': cashflow,
        'stocks': stocks,
        'real_estate': real_estate,
        'gold': gold,
        'fd': fd,
        'fd_interests': fd_interests
      };
}
