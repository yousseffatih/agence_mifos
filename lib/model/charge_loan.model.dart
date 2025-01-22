// To parse this JSON data, do
//
//     final chanrgesLoan = chanrgesLoanFromJson(jsonString);

import 'dart:convert';

List<ChanrgesLoan> chanrgesLoanFromJson(String str) => List<ChanrgesLoan>.from(json.decode(str).map((x) => ChanrgesLoan.fromJson(x)));

String chanrgesLoanToJson(List<ChanrgesLoan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChanrgesLoan {
    int? id;
    int? chargeId;
    String? name;
    Charge? chargeTimeType;
    Charge? chargeCalculationType;
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
    Charge? chargePaymentMode;
    bool? paid;
    bool? waived;
    bool? chargePayable;
    List<int>? dueDate;

    ChanrgesLoan({
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

    factory ChanrgesLoan.fromJson(Map<String, dynamic> json) => ChanrgesLoan(
        id: json["id"],
        chargeId: json["chargeId"],
        name: json["name"],
        chargeTimeType: json["chargeTimeType"] == null ? null : Charge.fromJson(json["chargeTimeType"]),
        chargeCalculationType: json["chargeCalculationType"] == null ? null : Charge.fromJson(json["chargeCalculationType"]),
        percentage: _toDouble(json["percentage"]),
        amountPercentageAppliedTo: _toDouble( json["amountPercentageAppliedTo"]),
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        amount:  _toDouble(json["amount"]),
        amountPaid:  _toDouble(json["amountPaid"]),
        amountWaived:  _toDouble(json["amountWaived"]),
        amountWrittenOff:  _toDouble(json["amountWrittenOff"]),
        amountOutstanding:  _toDouble(json["amountOutstanding"]),
        amountOrPercentage:  _toDouble(json["amountOrPercentage"]),
        penalty: json["penalty"],
        chargePaymentMode: json["chargePaymentMode"] == null ? null : Charge.fromJson(json["chargePaymentMode"]),
        paid: json["paid"],
        waived: json["waived"],
        chargePayable: json["chargePayable"],
        dueDate: json["dueDate"] == null ? [] : List<int>.from(json["dueDate"]!.map((x) => x)),
    );

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

class Charge {
    int? id;
    String? code;
    String? value;

    Charge({
        this.id,
        this.code,
        this.value,
    });

    factory Charge.fromJson(Map<String, dynamic> json) => Charge(
        id: json["id"],
        code: json["code"],
        value: json["value"],
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

    Currency({
        this.code,
        this.name,
        this.decimalPlaces,
        this.nameCode,
        this.displayLabel,
        this.displaySymbol,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        decimalPlaces: json["decimalPlaces"],
        nameCode: json["nameCode"],
        displayLabel: json["displayLabel"],
        displaySymbol: json["displaySymbol"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "decimalPlaces": decimalPlaces,
        "nameCode": nameCode,
        "displayLabel": displayLabel,
        "displaySymbol": displaySymbol,
    };
}
