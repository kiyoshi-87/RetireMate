import 'dart:collection';

class EarningsData {
  late Map<String, double> earnings;
  late List<List<double>> emi;
  late List<List<double>> loan;
  EarningsData(this.emi, this.loan, this.earnings);
}
