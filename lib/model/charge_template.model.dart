// To parse this JSON data, do
//
//     final chargesTemplate = chargesTemplateFromJson(jsonString);

import 'dart:convert';

ChargesTemplate chargesTemplateFromJson(String str) => ChargesTemplate.fromJson(json.decode(str));

String chargesTemplateToJson(ChargesTemplate data) => json.encode(data.toJson());

class ChargesTemplate {
    double? amountPaid;
    double? amountWaived;
    double? amountWrittenOff;
    List<ChargeOption>? chargeOptions;
    bool? penalty;
    bool? paid;
    bool? waived;
    bool? chargePayable;

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

    ChargesTemplate({
        this.amountPaid,
        this.amountWaived,
        this.amountWrittenOff,
        this.chargeOptions,
        this.penalty,
        this.paid,
        this.waived,
        this.chargePayable,
    });

    factory ChargesTemplate.fromJson(Map<String, dynamic> json) => ChargesTemplate(
        amountPaid: _toDouble(json["amountPaid"]),
        amountWaived: _toDouble(json["amountWaived"]),
        amountWrittenOff: _toDouble(json["amountWrittenOff"]),
        chargeOptions: json["chargeOptions"] == null ? [] : List<ChargeOption>.from(json["chargeOptions"]!.map((x) => ChargeOption.fromJson(x))),
        penalty: json["penalty"],
        paid: json["paid"],
        waived: json["waived"],
        chargePayable: json["chargePayable"],
    );

    Map<String, dynamic> toJson() => {
        "amountPaid": amountPaid,
        "amountWaived": amountWaived,
        "amountWrittenOff": amountWrittenOff,
        "chargeOptions": chargeOptions == null ? [] : List<dynamic>.from(chargeOptions!.map((x) => x.toJson())),
        "penalty": penalty,
        "paid": paid,
        "waived": waived,
        "chargePayable": chargePayable,
    };
}

class ChargeOption {
    int? id;
    String? name;
    bool? active;
    bool? penalty;
    Currency? currency;
    double? amount;
    Charge? chargeTimeType;
    Charge? chargeAppliesTo;
    Charge? chargeCalculationType;
    Charge? chargePaymentMode;

    ChargeOption({
        this.id,
        this.name,
        this.active,
        this.penalty,
        this.currency,
        this.amount,
        this.chargeTimeType,
        this.chargeAppliesTo,
        this.chargeCalculationType,
        this.chargePaymentMode,
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

    factory ChargeOption.fromJson(Map<String, dynamic> json) => ChargeOption(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        penalty: json["penalty"],
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        amount: _toDouble(json["amount"]),
        chargeTimeType: json["chargeTimeType"] == null ? null : Charge.fromJson(json["chargeTimeType"]),
        chargeAppliesTo: json["chargeAppliesTo"] == null ? null : Charge.fromJson(json["chargeAppliesTo"]),
        chargeCalculationType: json["chargeCalculationType"] == null ? null : Charge.fromJson(json["chargeCalculationType"]),
        chargePaymentMode: json["chargePaymentMode"] == null ? null : Charge.fromJson(json["chargePaymentMode"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
        "penalty": penalty,
        "currency": currency?.toJson(),
        "amount": amount,
        "chargeTimeType": chargeTimeType?.toJson(),
        "chargeAppliesTo": chargeAppliesTo?.toJson(),
        "chargeCalculationType": chargeCalculationType?.toJson(),
        "chargePaymentMode": chargePaymentMode?.toJson(),
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

    Currency({
        this.code,
        this.name,
        this.decimalPlaces,
        this.nameCode,
        this.displayLabel,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        decimalPlaces: json["decimalPlaces"],
        nameCode: json["nameCode"],
        displayLabel: json["displayLabel"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "decimalPlaces": decimalPlaces,
        "nameCode": nameCode,
        "displayLabel": displayLabel,
    };
}
