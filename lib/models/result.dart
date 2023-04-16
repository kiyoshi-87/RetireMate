class ResultData {
  double totalEarnings;
  double totalExpenses;
  double estimatedNetworth;
  double cashflow;
  Map<String, double> investments;
  Map<String, String> metrics;
  ResultData(this.cashflow, this.estimatedNetworth, this.totalEarnings,
      this.totalExpenses, this.investments, this.metrics) {}
}
