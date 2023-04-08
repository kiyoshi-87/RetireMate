import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retirement_app/screens/HomePage.dart';
import '../models/earningsdata.dart';
import '../models/result.dart';
import '../constants.dart' as Constants;

class Calculation {
  Calculation(BuildContext context, Map<String, String> metrics,
      Map<String, double> investments, EarningsData data) {
    var earnings = data.earnings;
    var emi = data.emi;
    var loan = data.loan;
    var currentEarnings = earnings[Constants.current_earnings] ?? 0.0;
    var yearlyIncrement = earnings[Constants.yearly_increment] ?? 0.0;
    var inflation = earnings[Constants.inflation] ?? 0.0;
    var monthlyExpenses = earnings[Constants.monthly_expenses] ?? 0.0;
    var retirementTime = investments[Constants.time_for_retirement] ?? 0.0;
    //final data calculations
    var totalearnings =
        totalEarnings(currentEarnings, yearlyIncrement, retirementTime).floor();
    var totalexpenses =
        totalExpenses(monthlyExpenses, inflation, emi, loan, retirementTime)
            .floor();
    var totalinvestments =
        totalInvestments(investments, metrics, retirementTime).floor();
    var currentNetworth = totalearnings + totalinvestments - totalexpenses;
    var cashflow = 0;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => Homepage(),
            settings: RouteSettings(
                arguments: ResultData(cashflow, currentNetworth, totalearnings,
                    totalexpenses, investments))));
  }

  double totalEarnings(
      var currentEarnings, var yearlyIncrement, var retirementTime) {
    double ans = 0.0;
    int R = retirementTime.floor();
    for (int i = 0; i < R; i++) {
      var T = currentEarnings + ((currentEarnings * yearlyIncrement) / 100.0);
      currentEarnings = T;
      ans = ans + T;
    }
    return ans;
  }

  double totalExpenses(var monthlyExpenses, var inflation, var emi, var loan,
      var retirementTime) {
    double ans = 0.0;
    var yearlyExpenses = monthlyExpenses * 12;
    int R = retirementTime.floor();
    for (int i = 0; i < R; i++) {
      var T = yearlyExpenses + ((yearlyExpenses * inflation) / 100);
      yearlyExpenses = T;
      ans = ans + T;
    }
    if (emi[0].isEmpty) return ans;
    for (int i = 0; i < emi.length; i++) {
      ans = ans + emi[i][0] * emi[i][1];
    }
    for (int i = 0; i < loan.length; i++) {
      double P = loan[i][0];
      double Y = loan[i][1];
      double I = loan[i][2];
      ans = ans + P * pow((1 + (I / 100)), Y);
    }
    return ans;
  }

  double totalInvestments(var investments, var metrics, var R) {
    double ans = 0.0;
    var stocks = investments[Constants.stock_investments];
    var gold = investments[Constants.gold];
    var realEstate = investments[Constants.real_estate_worth];
    var fixedDeposits = investments[Constants.fixed_deposits];
    var fdReturns = investments[Constants.interest];

    //api call to get the stock index returns(YOY)
    var stockReturns = 12.0;

    //api call to get the real estate returns based on location
    var realestateReturns = 10.0;

    // api call to get the gold returns
    var goldReturns = 8.0;

    //api call to get gold per gram rate
    var goldPerGram = 6062.0;

    //conversion of gold to gm
    if (metrics[Constants.metric] == "mg")
      gold = gold / 1000.0;
    else if (metrics[Constants.metric] == "kg") gold = gold * 1000;

    var totalGold = gold * goldPerGram;

    ans = stocks * pow((1 + (stockReturns / 100)), R) +
        realEstate * pow((1 + (realestateReturns / 100)), R) +
        totalGold * pow((1 + (goldReturns / 100)), R) +
        fixedDeposits * pow((1 + (fdReturns / 100)), R);

    return ans;
  }
}
