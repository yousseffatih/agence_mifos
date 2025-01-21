// To parse this JSON data, do
//
//     final loanAccount = loanAccountFromJson(jsonString);

import 'dart:convert';

LoanAccount loanAccountFromJson(String str) => LoanAccount.fromJson(json.decode(str));

String loanAccountToJson(LoanAccount data) => json.encode(data.toJson());

class LoanAccount {
  int? id;
  String? accountNo;
  String? clientName;
  String? loanProductName;
  String? loanOfficerName;
  Status? status;
  Summary? summary;
  RepaymentSchedule? repaymentSchedule;
  List<Transaction>? transactions;
  List<Charge>? charges;

  LoanAccount({
    this.id,
    this.accountNo,
    this.clientName,
    this.loanProductName,
    this.loanOfficerName,
    this.status,
    this.summary,
    this.repaymentSchedule,
    this.transactions,
    this.charges,
  });

  factory LoanAccount.fromJson(Map<String, dynamic> json) => LoanAccount(
        id: json["id"] ?? 0,
        accountNo: json["accountNo"] ?? "",
        clientName: json["clientName"] ?? "",
        loanOfficerName: json["loanOfficerName"] ?? "",
        loanProductName : json["loanProductName"] ?? "",
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        summary: json["summary"] == null ? null : Summary.fromJson(json["summary"]),
        repaymentSchedule: json["repaymentSchedule"] == null ? null : RepaymentSchedule.fromJson(json["repaymentSchedule"]),
        transactions: json["transactions"] == null ? [] : List<Transaction>.from(json["transactions"]!.map((x) => Transaction.fromJson(x))),
        charges: json["charges"] == null ? [] : List<Charge>.from(json["charges"]!.map((x) => Charge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "clientName":clientName,
        "loanOfficerName":loanOfficerName,
        "status": status?.toJson(),
        "summary": summary?.toJson(),
        "repaymentSchedule": repaymentSchedule?.toJson(),
        "transactions": transactions == null ? [] : List<dynamic>.from(transactions!.map((x) => x.toJson())),
        "charges": charges == null ? [] : List<dynamic>.from(charges!.map((x) => x.toJson())),
      };
}

class Charge {
  int? id;
  int? chargeId;
  String? name;
  ChargeCalculationTypeClass? chargeTimeType;
  ChargeCalculationTypeClass? chargeCalculationType;
  double? percentage;
  double? amountPercentageAppliedTo;
  Currency? currency;
  double? amount;
  double? amountPaid;
  double? amountWaived;
  double? amountWrittenOff;
  double? amountOutstanding;
  double? amountOrPercentage;
  bool? penalty;
  ChargeCalculationTypeClass? chargePaymentMode;
  bool? paid;
  bool? waived;
  bool? chargePayable;
  List<int>? dueDate;

  Charge({
    this.id,
    this.chargeId,
    this.name,
    this.chargeTimeType,
    this.chargeCalculationType,
    this.percentage,
    this.amountPercentageAppliedTo,
    this.currency,
    this.amount,
    this.amountPaid,
    this.amountWaived,
    this.amountWrittenOff,
    this.amountOutstanding,
    this.amountOrPercentage,
    this.penalty,
    this.chargePaymentMode,
    this.paid,
    this.waived,
    this.chargePayable,
    this.dueDate,
  });

  // Static helper method to handle both int and double values
  static double _toDouble(dynamic value) {
    if (value == null) {
      return 0.0;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is double) {
      return value;
    }
    return 0.0;
  }

  factory Charge.fromJson(Map<String, dynamic> json) {
    return Charge(
      id: json["id"] ?? 0,
      chargeId: json["chargeId"] ?? 0,
      name: json["name"] ?? "",
      chargeTimeType: json["chargeTimeType"] == null
          ? null
          : ChargeCalculationTypeClass.fromJson(json["chargeTimeType"]),
      chargeCalculationType: json["chargeCalculationType"] == null
          ? null
          : ChargeCalculationTypeClass.fromJson(json["chargeCalculationType"]),
      percentage: _toDouble(json["percentage"]),
      amountPercentageAppliedTo: _toDouble(json["amountPercentageAppliedTo"]),
      currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
      amount: _toDouble(json["amount"]),
      amountPaid: _toDouble(json["amountPaid"]),
      amountWaived: _toDouble(json["amountWaived"]),
      amountWrittenOff: _toDouble(json["amountWrittenOff"]),
      amountOutstanding: _toDouble(json["amountOutstanding"]),
      amountOrPercentage: _toDouble(json["amountOrPercentage"]),
      penalty: json["penalty"] ?? false,
      chargePaymentMode: json["chargePaymentMode"] == null
          ? null
          : ChargeCalculationTypeClass.fromJson(json["chargePaymentMode"]),
      paid: json["paid"] ?? false,
      waived: json["waived"] ?? false,
      chargePayable: json["chargePayable"] ?? false,
      dueDate: json["dueDate"] == null ? [] : List<int>.from(json["dueDate"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "chargeId": chargeId,
        "name": name,
        "chargeTimeType": chargeTimeType?.toJson(),
        "chargeCalculationType": chargeCalculationType?.toJson(),
        "percentage": percentage,
        "amountPercentageAppliedTo": amountPercentageAppliedTo,
        "currency": currency?.toJson(),
        "amount": amount,
        "amountPaid": amountPaid,
        "amountWaived": amountWaived,
        "amountWrittenOff": amountWrittenOff,
        "amountOutstanding": amountOutstanding,
        "amountOrPercentage": amountOrPercentage,
        "penalty": penalty,
        "chargePaymentMode": chargePaymentMode?.toJson(),
        "paid": paid,
        "waived": waived,
        "chargePayable": chargePayable,
        "dueDate": dueDate == null ? [] : List<dynamic>.from(dueDate!.map((x) => x)),
      };
}

class ChargeCalculationTypeClass {
  int? id;
  String? code;
  String? value;

  ChargeCalculationTypeClass({
    this.id,
    this.code,
    this.value,
  });

  factory ChargeCalculationTypeClass.fromJson(Map<String, dynamic> json) => ChargeCalculationTypeClass(
        id: json["id"] ?? 0,
        code: json["code"] ?? "",
        value: json["value"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
      };
}

class Currency {
  String? code;
  String? name;
  int? decimalPlaces;
  String? nameCode;
  String? displayLabel;
  String? displaySymbol;
  int? inMultiplesOf;

  Currency({
    this.code,
    this.name,
    this.decimalPlaces,
    this.nameCode,
    this.displayLabel,
    this.displaySymbol,
    this.inMultiplesOf,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"] ?? "",
        name: json["name"] ?? "",
        decimalPlaces: json["decimalPlaces"] ?? 0,
        nameCode: json["nameCode"] ?? "",
        displayLabel: json["displayLabel"] ?? "",
        displaySymbol: json["displaySymbol"] ?? "",
        inMultiplesOf: json["inMultiplesOf"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "decimalPlaces": decimalPlaces,
        "nameCode": nameCode,
        "displayLabel": displayLabel,
        "displaySymbol": displaySymbol,
        "inMultiplesOf": inMultiplesOf,
      };
}

class RepaymentSchedule {
  Currency? currency;
  int? loanTermInDays;
  double? totalPrincipalDisbursed;
  double? totalPrincipalExpected;
  double? totalPrincipalPaid;
  double? totalInterestCharged;
  double? totalFeeChargesCharged;
  double? totalPenaltyChargesCharged;
  double? totalWaived;
  double? totalWrittenOff;
  double? totalRepaymentExpected;
  double? totalRepayment;
  double? totalPaidInAdvance;
  double? totalPaidLate;
  double? totalOutstanding;
  List<Period>? periods;

  RepaymentSchedule({
    this.currency,
    this.loanTermInDays,
    this.totalPrincipalDisbursed,
    this.totalPrincipalExpected,
    this.totalPrincipalPaid,
    this.totalInterestCharged,
    this.totalFeeChargesCharged,
    this.totalPenaltyChargesCharged,
    this.totalWaived,
    this.totalWrittenOff,
    this.totalRepaymentExpected,
    this.totalRepayment,
    this.totalPaidInAdvance,
    this.totalPaidLate,
    this.totalOutstanding,
    this.periods,
  });

  factory RepaymentSchedule.fromJson(Map<String, dynamic> json) => RepaymentSchedule(
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        loanTermInDays: json["loanTermInDays"] ?? 0,
        totalPrincipalDisbursed: json["totalPrincipalDisbursed"] ?? 0,
        totalPrincipalExpected: json["totalPrincipalExpected"] ?? 0,
        totalPrincipalPaid: json["totalPrincipalPaid"] ?? 0,
        totalInterestCharged: json["totalInterestCharged"]?.toDouble() ?? 0.0,
        totalFeeChargesCharged: json["totalFeeChargesCharged"] ?? 0,
        totalPenaltyChargesCharged: json["totalPenaltyChargesCharged"] ?? 0,
        totalWaived: json["totalWaived"] ?? 0,
        totalWrittenOff: json["totalWrittenOff"] ?? 0,
        totalRepaymentExpected: json["totalRepaymentExpected"]?.toDouble() ?? 0.0,
        totalRepayment: json["totalRepayment"] ?? 0,
        totalPaidInAdvance: json["totalPaidInAdvance"] ?? 0,
        totalPaidLate: json["totalPaidLate"] ?? 0,
        totalOutstanding: json["totalOutstanding"]?.toDouble() ?? 0.0,
        periods: json["periods"] == null ? [] : List<Period>.from(json["periods"]!.map((x) => Period.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency?.toJson(),
        "loanTermInDays": loanTermInDays,
        "totalPrincipalDisbursed": totalPrincipalDisbursed,
        "totalPrincipalExpected": totalPrincipalExpected,
        "totalPrincipalPaid": totalPrincipalPaid,
        "totalInterestCharged": totalInterestCharged,
        "totalFeeChargesCharged": totalFeeChargesCharged,
        "totalPenaltyChargesCharged": totalPenaltyChargesCharged,
        "totalWaived": totalWaived,
        "totalWrittenOff": totalWrittenOff,
        "totalRepaymentExpected": totalRepaymentExpected,
        "totalRepayment": totalRepayment,
        "totalPaidInAdvance": totalPaidInAdvance,
        "totalPaidLate": totalPaidLate,
        "totalOutstanding": totalOutstanding,
        "periods": periods == null ? [] : List<dynamic>.from(periods!.map((x) => x.toJson())),
      };
}

class Period {
  List<int>? dueDate;
  double? principalDisbursed;
  double? principalLoanBalanceOutstanding;
  double? feeChargesDue;
  double? feeChargesPaid;
  double? totalOriginalDueForPeriod;
  double? totalDueForPeriod;
  double? totalPaidForPeriod;
  double? totalActualCostOfLoanForPeriod;
  int? period;
  List<int>? fromDate;
  List<int>? obligationsMetOnDate;
  bool? complete;
  int? daysInPeriod;
  double? principalOriginalDue;
  double? principalDue;
  double? principalPaid;
  double? principalWrittenOff;
  double? principalOutstanding;
  double? interestOriginalDue;
  double? interestDue;
  double? interestPaid;
  double? interestWaived;
  double? interestWrittenOff;
  double? interestOutstanding;
  double? feeChargesWaived;
  double? feeChargesWrittenOff;
  double? feeChargesOutstanding;
  double? penaltyChargesDue;
  double? penaltyChargesPaid;
  double? penaltyChargesWaived;
  double? penaltyChargesWrittenOff;
  double? penaltyChargesOutstanding;
  double? totalPaidInAdvanceForPeriod;
  double? totalPaidLateForPeriod;
  double? totalWaivedForPeriod;
  double? totalWrittenOffForPeriod;
  double? totalOutstandingForPeriod;
  double? totalOverdue;
  double? totalInstallmentAmountForPeriod;

  Period({
    this.dueDate,
    this.principalDisbursed,
    this.principalLoanBalanceOutstanding,
    this.feeChargesDue,
    this.feeChargesPaid,
    this.totalOriginalDueForPeriod,
    this.totalDueForPeriod,
    this.totalPaidForPeriod,
    this.totalActualCostOfLoanForPeriod,
    this.period,
    this.fromDate,
    this.obligationsMetOnDate,
    this.complete,
    this.daysInPeriod,
    this.principalOriginalDue,
    this.principalDue,
    this.principalPaid,
    this.principalWrittenOff,
    this.principalOutstanding,
    this.interestOriginalDue,
    this.interestDue,
    this.interestPaid,
    this.interestWaived,
    this.interestWrittenOff,
    this.interestOutstanding,
    this.feeChargesWaived,
    this.feeChargesWrittenOff,
    this.feeChargesOutstanding,
    this.penaltyChargesDue,
    this.penaltyChargesPaid,
    this.penaltyChargesWaived,
    this.penaltyChargesWrittenOff,
    this.penaltyChargesOutstanding,
    this.totalPaidInAdvanceForPeriod,
    this.totalPaidLateForPeriod,
    this.totalWaivedForPeriod,
    this.totalWrittenOffForPeriod,
    this.totalOutstandingForPeriod,
    this.totalOverdue,
    this.totalInstallmentAmountForPeriod,
  });

  static double totoDouble(dynamic value) {
      if (value == null) {
        return 0.0;
      }
      if (value is int) {
        return value.toDouble();
      }
      if (value is double) {
        return value;
      }
      return 0.0;
    }

  factory Period.fromJson(Map<String, dynamic> json) {
  return Period(
    dueDate: json["dueDate"] == null ? [] : List<int>.from(json["dueDate"]!.map((x) => x)),
    principalDisbursed: totoDouble(json["principalDisbursed"]),
    principalLoanBalanceOutstanding: totoDouble(json["principalLoanBalanceOutstanding"]),
    feeChargesDue: totoDouble(json["feeChargesDue"]),
    feeChargesPaid: totoDouble(json["feeChargesPaid"]),
    totalOriginalDueForPeriod: totoDouble(json["totalOriginalDueForPeriod"]),
    totalDueForPeriod: totoDouble(json["totalDueForPeriod"]),
    totalPaidForPeriod: totoDouble(json["totalPaidForPeriod"]),
    totalActualCostOfLoanForPeriod: totoDouble(json["totalActualCostOfLoanForPeriod"]),
    period: json["period"] ?? 0,
    fromDate: json["fromDate"] == null ? [] : List<int>.from(json["fromDate"]!.map((x) => x)),
    obligationsMetOnDate: json["obligationsMetOnDate"] == null ? [] : List<int>.from(json["obligationsMetOnDate"]!.map((x) => x)),
    complete: json["complete"] ?? false,
    daysInPeriod: json["daysInPeriod"],
    principalOriginalDue: totoDouble(json["principalOriginalDue"]),
    principalDue: totoDouble(json["principalDue"]),
    principalPaid: totoDouble(json["principalPaid"]),
    principalWrittenOff: totoDouble(json["principalWrittenOff"]),
    principalOutstanding: totoDouble(json["principalOutstanding"]),
    interestOriginalDue: totoDouble(json["interestOriginalDue"]),
    interestDue: totoDouble(json["interestDue"]),
    interestPaid: totoDouble(json["interestPaid"]),
    interestWaived: totoDouble(json["interestWaived"]),
    interestWrittenOff: totoDouble(json["interestWrittenOff"]),
    interestOutstanding: totoDouble(json["interestOutstanding"]),
    feeChargesWaived: totoDouble(json["feeChargesWaived"]),
    feeChargesWrittenOff: totoDouble(json["feeChargesWrittenOff"]),
    feeChargesOutstanding: totoDouble(json["feeChargesOutstanding"]),
    penaltyChargesDue: totoDouble(json["penaltyChargesDue"]),
    penaltyChargesPaid: totoDouble(json["penaltyChargesPaid"]),
    penaltyChargesWaived: totoDouble(json["penaltyChargesWaived"]),
    penaltyChargesWrittenOff: totoDouble(json["penaltyChargesWrittenOff"]),
    penaltyChargesOutstanding: totoDouble(json["penaltyChargesOutstanding"]),
    totalPaidInAdvanceForPeriod: totoDouble(json["totalPaidInAdvanceForPeriod"]),
    totalPaidLateForPeriod: totoDouble(json["totalPaidLateForPeriod"]),
    totalWaivedForPeriod: totoDouble(json["totalWaivedForPeriod"]),
    totalWrittenOffForPeriod: totoDouble(json["totalWrittenOffForPeriod"]),
    totalOutstandingForPeriod: totoDouble(json["totalOutstandingForPeriod"]),
    totalOverdue: totoDouble(json["totalOverdue"]),
    totalInstallmentAmountForPeriod: totoDouble(json["totalInstallmentAmountForPeriod"]),
  );
}

    

  Map<String, dynamic> toJson() => {
        "dueDate": dueDate == null ? [] : List<dynamic>.from(dueDate!.map((x) => x)),
        "principalDisbursed": principalDisbursed,
        "principalLoanBalanceOutstanding": principalLoanBalanceOutstanding,
        "feeChargesDue": feeChargesDue,
        "feeChargesPaid": feeChargesPaid,
        "totalOriginalDueForPeriod": totalOriginalDueForPeriod,
        "totalDueForPeriod": totalDueForPeriod,
        "totalPaidForPeriod": totalPaidForPeriod,
        "totalActualCostOfLoanForPeriod": totalActualCostOfLoanForPeriod,
        "period": period,
        "fromDate": fromDate == null ? [] : List<dynamic>.from(fromDate!.map((x) => x)),
        "obligationsMetOnDate": obligationsMetOnDate == null ? [] : List<dynamic>.from(obligationsMetOnDate!.map((x) => x)),
        "complete": complete,
        "daysInPeriod": daysInPeriod,
        "principalOriginalDue": principalOriginalDue,
        "principalDue": principalDue,
        "principalPaid": principalPaid,
        "principalWrittenOff": principalWrittenOff,
        "principalOutstanding": principalOutstanding,
        "interestOriginalDue": interestOriginalDue,
        "interestDue": interestDue,
        "interestPaid": interestPaid,
        "interestWaived": interestWaived,
        "interestWrittenOff": interestWrittenOff,
        "interestOutstanding": interestOutstanding,
        "feeChargesWaived": feeChargesWaived,
        "feeChargesWrittenOff": feeChargesWrittenOff,
        "feeChargesOutstanding": feeChargesOutstanding,
        "penaltyChargesDue": penaltyChargesDue,
        "penaltyChargesPaid": penaltyChargesPaid,
        "penaltyChargesWaived": penaltyChargesWaived,
        "penaltyChargesWrittenOff": penaltyChargesWrittenOff,
        "penaltyChargesOutstanding": penaltyChargesOutstanding,
        "totalPaidInAdvanceForPeriod": totalPaidInAdvanceForPeriod,
        "totalPaidLateForPeriod": totalPaidLateForPeriod,
        "totalWaivedForPeriod": totalWaivedForPeriod,
        "totalWrittenOffForPeriod": totalWrittenOffForPeriod,
        "totalOutstandingForPeriod": totalOutstandingForPeriod,
        "totalOverdue": totalOverdue,
        "totalInstallmentAmountForPeriod": totalInstallmentAmountForPeriod,
      };
}

class Status {
  int? id;
  String? code;
  String? value;
  bool? pendingApproval;
  bool? waitingForDisbursal;
  bool? active;
  bool? closedObligationsMet;
  bool? closedWrittenOff;
  bool? closedRescheduled;
  bool? closed;
  bool? overpaid;

  Status({
    this.id,
    this.code,
    this.value,
    this.pendingApproval,
    this.waitingForDisbursal,
    this.active,
    this.closedObligationsMet,
    this.closedWrittenOff,
    this.closedRescheduled,
    this.closed,
    this.overpaid,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"] ?? 0,
        code: json["code"] ?? "",
        value: json["value"] ?? "",
        pendingApproval: json["pendingApproval"] ?? false,
        waitingForDisbursal: json["waitingForDisbursal"] ?? false,
        active: json["active"] ?? false,
        closedObligationsMet: json["closedObligationsMet"] ?? false,
        closedWrittenOff: json["closedWrittenOff"] ?? false,
        closedRescheduled: json["closedRescheduled"] ?? false,
        closed: json["closed"] ?? false,
        overpaid: json["overpaid"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
        "pendingApproval": pendingApproval,
        "waitingForDisbursal": waitingForDisbursal,
        "active": active,
        "closedObligationsMet": closedObligationsMet,
        "closedWrittenOff": closedWrittenOff,
        "closedRescheduled": closedRescheduled,
        "closed": closed,
        "overpaid": overpaid,
      };
}

class Summary {
  Currency? currency;
  double? principalDisbursed;
  double? principalPaid;
  double? principalWrittenOff;
  double? principalOutstanding;
  double? principalOverdue;
  double? interestCharged;
  double? interestPaid;
  double? interestWaived;
  double? interestWrittenOff;
  double? interestOutstanding;
  double? interestOverdue;
  double? feeChargesCharged;
  double? feeChargesDueAtDisbursementCharged;
  double? feeChargesPaid;
  double? feeChargesWaived;
  double? feeChargesWrittenOff;
  double? feeChargesOutstanding;
  double? feeChargesOverdue;
  double? penaltyChargesCharged;
  double? penaltyChargesPaid;
  double? penaltyChargesWaived;
  double? penaltyChargesWrittenOff;
  double? penaltyChargesOutstanding;
  double? penaltyChargesOverdue;
  double? totalExpectedRepayment;
  double? totalRepayment;
  double? totalExpectedCostOfLoan;
  double? totalCostOfLoan;
  double? totalWaived;
  double? totalWrittenOff;
  double? totalOutstanding;
  double? totalOverdue;

  Summary({
    this.currency,
    this.principalDisbursed,
    this.principalPaid,
    this.principalWrittenOff,
    this.principalOutstanding,
    this.principalOverdue,
    this.interestCharged,
    this.interestPaid,
    this.interestWaived,
    this.interestWrittenOff,
    this.interestOutstanding,
    this.interestOverdue,
    this.feeChargesCharged,
    this.feeChargesDueAtDisbursementCharged,
    this.feeChargesPaid,
    this.feeChargesWaived,
    this.feeChargesWrittenOff,
    this.feeChargesOutstanding,
    this.feeChargesOverdue,
    this.penaltyChargesCharged,
    this.penaltyChargesPaid,
    this.penaltyChargesWaived,
    this.penaltyChargesWrittenOff,
    this.penaltyChargesOutstanding,
    this.penaltyChargesOverdue,
    this.totalExpectedRepayment,
    this.totalRepayment,
    this.totalExpectedCostOfLoan,
    this.totalCostOfLoan,
    this.totalWaived,
    this.totalWrittenOff,
    this.totalOutstanding,
    this.totalOverdue,
  });

  static double _toDouble(dynamic value) {
    if (value == null) {
      return 0.0;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is double) {
      return value;
    }
    return 0.0;
  }

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        principalDisbursed: json["principalDisbursed"] ?? 0,
        principalPaid: json["principalPaid"] ?? 0,
        principalWrittenOff: json["principalWrittenOff"] ?? 0,
        principalOutstanding: json["principalOutstanding"] ?? 0,
        principalOverdue: _toDouble(json["principalOverdue"]) ?? 0,
        interestCharged: json["interestCharged"]?.toDouble() ?? 0.0,
        interestPaid: json["interestPaid"] ?? 0,
        interestWaived: json["interestWaived"] ?? 0,
        interestWrittenOff: json["interestWrittenOff"] ?? 0,
        interestOutstanding: json["interestOutstanding"]?.toDouble() ?? 0.0,
        interestOverdue: _toDouble(json["interestOverdue"]) ?? 0,
        feeChargesCharged: json["feeChargesCharged"] ?? 0,
        feeChargesDueAtDisbursementCharged: json["feeChargesDueAtDisbursementCharged"] ?? 0,
        feeChargesPaid: json["feeChargesPaid"] ?? 0,
        feeChargesWaived: json["feeChargesWaived"] ?? 0,
        feeChargesWrittenOff: json["feeChargesWrittenOff"] ?? 0,
        feeChargesOutstanding: json["feeChargesOutstanding"] ?? 0,
        feeChargesOverdue: _toDouble(json["feeChargesOverdue"]) ?? 0,
        penaltyChargesCharged: json["penaltyChargesCharged"] ?? 0,
        penaltyChargesPaid: json["penaltyChargesPaid"] ?? 0,
        penaltyChargesWaived: json["penaltyChargesWaived"] ?? 0,
        penaltyChargesWrittenOff: json["penaltyChargesWrittenOff"] ?? 0,
        penaltyChargesOutstanding: json["penaltyChargesOutstanding"] ?? 0,
        penaltyChargesOverdue: _toDouble(json["penaltyChargesOverdue"]),
        totalExpectedRepayment: json["totalExpectedRepayment"]?.toDouble() ?? 0.0,
        totalRepayment: json["totalRepayment"] ?? 0,
        totalExpectedCostOfLoan: json["totalExpectedCostOfLoan"]?.toDouble() ?? 0.0,
        totalCostOfLoan: json["totalCostOfLoan"] ?? 0,
        totalWaived: json["totalWaived"] ?? 0,
        totalWrittenOff: json["totalWrittenOff"] ?? 0,
        totalOutstanding: json["totalOutstanding"]?.toDouble() ?? 0.0,
        totalOverdue: _toDouble(json["totalOverdue"]),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency?.toJson(),
        "principalDisbursed": principalDisbursed,
        "principalPaid": principalPaid,
        "principalWrittenOff": principalWrittenOff,
        "principalOutstanding": principalOutstanding,
        "principalOverdue": principalOverdue,
        "interestCharged": interestCharged,
        "interestPaid": interestPaid,
        "interestWaived": interestWaived,
        "interestWrittenOff": interestWrittenOff,
        "interestOutstanding": interestOutstanding,
        "interestOverdue": interestOverdue,
        "feeChargesCharged": feeChargesCharged,
        "feeChargesDueAtDisbursementCharged": feeChargesDueAtDisbursementCharged,
        "feeChargesPaid": feeChargesPaid,
        "feeChargesWaived": feeChargesWaived,
        "feeChargesWrittenOff": feeChargesWrittenOff,
        "feeChargesOutstanding": feeChargesOutstanding,
        "feeChargesOverdue": feeChargesOverdue,
        "penaltyChargesCharged": penaltyChargesCharged,
        "penaltyChargesPaid": penaltyChargesPaid,
        "penaltyChargesWaived": penaltyChargesWaived,
        "penaltyChargesWrittenOff": penaltyChargesWrittenOff,
        "penaltyChargesOutstanding": penaltyChargesOutstanding,
        "penaltyChargesOverdue": penaltyChargesOverdue,
        "totalExpectedRepayment": totalExpectedRepayment,
        "totalRepayment": totalRepayment,
        "totalExpectedCostOfLoan": totalExpectedCostOfLoan,
        "totalCostOfLoan": totalCostOfLoan,
        "totalWaived": totalWaived,
        "totalWrittenOff": totalWrittenOff,
        "totalOutstanding": totalOutstanding,
        "totalOverdue": totalOverdue,
      };
}

class Transaction {
  int? id;
  int? officeId;
  String? officeName;
  Type? type;
  List<int>? date;
  Currency? currency;
  double? amount;
  double? principalPortion;
  double? interestPortion;
  double? feeChargesPortion;
  double? penaltyChargesPortion;
  double? overpaymentPortion;
  double? unrecognizedIncomePortion;
  double? outstandingLoanBalance;
  List<int>? submittedOnDate;
  bool? manuallyReversed;
  PaymentDetailData? paymentDetailData;

  Transaction({
    this.id,
    this.officeId,
    this.officeName,
    this.type,
    this.date,
    this.currency,
    this.amount,
    this.principalPortion,
    this.interestPortion,
    this.feeChargesPortion,
    this.penaltyChargesPortion,
    this.overpaymentPortion,
    this.unrecognizedIncomePortion,
    this.outstandingLoanBalance,
    this.submittedOnDate,
    this.manuallyReversed,
    this.paymentDetailData,
  });

  // Static helper method to handle both int and double values
  static double _toDouble(dynamic value) {
    if (value == null) {
      return 0.0;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is double) {
      return value;
    }
    return 0.0;
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"] ?? 0,
      officeId: json["officeId"] ?? 0,
      officeName: json["officeName"] ?? "",
      type: json["type"] == null ? null : Type.fromJson(json["type"]),
      date: json["date"] == null ? [] : List<int>.from(json["date"]!.map((x) => x)),
      currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
      amount: _toDouble(json["amount"]),
      principalPortion: _toDouble(json["principalPortion"]),
      interestPortion: _toDouble(json["interestPortion"]),
      feeChargesPortion: _toDouble(json["feeChargesPortion"]),
      penaltyChargesPortion: _toDouble(json["penaltyChargesPortion"]),
      overpaymentPortion: _toDouble(json["overpaymentPortion"]),
      unrecognizedIncomePortion: _toDouble(json["unrecognizedIncomePortion"]),
      outstandingLoanBalance: _toDouble(json["outstandingLoanBalance"]),
      submittedOnDate: json["submittedOnDate"] == null ? [] : List<int>.from(json["submittedOnDate"]!.map((x) => x)),
      manuallyReversed: json["manuallyReversed"] ?? false,
      paymentDetailData: json["paymentDetailData"] == null ? null : PaymentDetailData.fromJson(json["paymentDetailData"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "officeId": officeId,
        "officeName": officeName,
        "type": type?.toJson(),
        "date": date == null ? [] : List<dynamic>.from(date!.map((x) => x)),
        "currency": currency?.toJson(),
        "amount": amount,
        "principalPortion": principalPortion,
        "interestPortion": interestPortion,
        "feeChargesPortion": feeChargesPortion,
        "penaltyChargesPortion": penaltyChargesPortion,
        "overpaymentPortion": overpaymentPortion,
        "unrecognizedIncomePortion": unrecognizedIncomePortion,
        "outstandingLoanBalance": outstandingLoanBalance,
        "submittedOnDate": submittedOnDate == null ? [] : List<dynamic>.from(submittedOnDate!.map((x) => x)),
        "manuallyReversed": manuallyReversed,
        "paymentDetailData": paymentDetailData?.toJson(),
      };
}

class PaymentDetailData {
  int? id;
  PaymentType? paymentType;
  String? accountNumber;
  String? checkNumber;
  String? routingCode;
  String? receiptNumber;
  String? bankNumber;

  PaymentDetailData({
    this.id,
    this.paymentType,
    this.accountNumber,
    this.checkNumber,
    this.routingCode,
    this.receiptNumber,
    this.bankNumber,
  });

  factory PaymentDetailData.fromJson(Map<String, dynamic> json) => PaymentDetailData(
        id: json["id"] ?? 0,
        paymentType: json["paymentType"] == null ? null : PaymentType.fromJson(json["paymentType"]),
        accountNumber: json["accountNumber"] ?? "",
        checkNumber: json["checkNumber"] ?? "",
        routingCode: json["routingCode"] ?? "",
        receiptNumber: json["receiptNumber"] ?? "",
        bankNumber: json["bankNumber"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "paymentType": paymentType?.toJson(),
        "accountNumber": accountNumber,
        "checkNumber": checkNumber,
        "routingCode": routingCode,
        "receiptNumber": receiptNumber,
        "bankNumber": bankNumber,
      };
}

class PaymentType {
  int? id;
  String? name;

  PaymentType({
    this.id,
    this.name,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Type {
  int? id;
  String? code;
  String? value;
  bool? disbursement;
  bool? repaymentAtDisbursement;
  bool? repayment;
  bool? contra;
  bool? waiveInterest;
  bool? waiveCharges;
  bool? accrual;
  bool? writeOff;
  bool? recoveryRepayment;
  bool? initiateTransfer;
  bool? approveTransfer;
  bool? withdrawTransfer;
  bool? rejectTransfer;
  bool? chargePayment;
  bool? refund;
  bool? refundForActiveLoans;

  Type({
    this.id,
    this.code,
    this.value,
    this.disbursement,
    this.repaymentAtDisbursement,
    this.repayment,
    this.contra,
    this.waiveInterest,
    this.waiveCharges,
    this.accrual,
    this.writeOff,
    this.recoveryRepayment,
    this.initiateTransfer,
    this.approveTransfer,
    this.withdrawTransfer,
    this.rejectTransfer,
    this.chargePayment,
    this.refund,
    this.refundForActiveLoans,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"] ?? 0,
        code: json["code"] ?? "",
        value: json["value"] ?? "",
        disbursement: json["disbursement"] ?? false,
        repaymentAtDisbursement: json["repaymentAtDisbursement"] ?? false,
        repayment: json["repayment"] ?? false,
        contra: json["contra"] ?? false,
        waiveInterest: json["waiveInterest"] ?? false,
        waiveCharges: json["waiveCharges"] ?? false,
        accrual: json["accrual"] ?? false,
        writeOff: json["writeOff"] ?? false,
        recoveryRepayment: json["recoveryRepayment"] ?? false,
        initiateTransfer: json["initiateTransfer"] ?? false,
        approveTransfer: json["approveTransfer"] ?? false,
        withdrawTransfer: json["withdrawTransfer"] ?? false,
        rejectTransfer: json["rejectTransfer"] ?? false,
        chargePayment: json["chargePayment"] ?? false,
        refund: json["refund"] ?? false,
        refundForActiveLoans: json["refundForActiveLoans"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
        "disbursement": disbursement,
        "repaymentAtDisbursement": repaymentAtDisbursement,
        "repayment": repayment,
        "contra": contra,
        "waiveInterest": waiveInterest,
        "waiveCharges": waiveCharges,
        "accrual": accrual,
        "writeOff": writeOff,
        "recoveryRepayment": recoveryRepayment,
        "initiateTransfer": initiateTransfer,
        "approveTransfer": approveTransfer,
        "withdrawTransfer": withdrawTransfer,
        "rejectTransfer": rejectTransfer,
        "chargePayment": chargePayment,
        "refund": refund,
        "refundForActiveLoans": refundForActiveLoans,
      };
}


