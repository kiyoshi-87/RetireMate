class ResultData {
  int totalEarnings;
  int totalExpenses;
  int currentNetworth;
  int cashflow;
  Map<String, double> investments;
  ResultData(this.cashflow, this.currentNetworth, this.totalEarnings,
      this.totalExpenses, this.investments) {}
}
