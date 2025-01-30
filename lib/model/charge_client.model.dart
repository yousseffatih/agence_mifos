// To parse this JSON data, do
//
//     final chargesClient = chargesClientFromJson(jsonString);

import 'dart:convert';

ChargesClient chargesClientFromJson(String str) => ChargesClient.fromJson(json.decode(str));

String chargesClientToJson(ChargesClient data) => json.encode(data.toJson());

class ChargesClient {
    int? totalFilteredRecords;
    List<PageItem>? pageItems;

    ChargesClient({
        this.totalFilteredRecords,
        this.pageItems,
    });

    factory ChargesClient.fromJson(Map<String, dynamic> json) => ChargesClient(
        totalFilteredRecords: json["totalFilteredRecords"],
        pageItems: json["pageItems"] == null ? [] : List<PageItem>.from(json["pageItems"]!.map((x) => PageItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalFilteredRecords": totalFilteredRecords,
        "pageItems": pageItems == null ? [] : List<dynamic>.from(pageItems!.map((x) => x.toJson())),
    };
}

class PageItem {
    int? id;
    int? clientId;
    int? chargeId;
    String? name;
    ChargeType? chargeTimeType;
    List<int>? dueDate;
    ChargeType? chargeCalculationType;
    Currency? currency;
    double? amount;
    double? amountPaid;
    double? amountWaived;
    double? amountWrittenOff;
    double? amountOutstanding;
    bool? penalty;
    bool? isActive;
    bool? isPaid;
    bool? isWaived;

    PageItem({
        this.id,
        this.clientId,
        this.chargeId,
        this.name,
        this.chargeTimeType,
        this.dueDate,
        this.chargeCalculationType,
        this.currency,
        this.amount,
        this.amountPaid,
        this.amountWaived,
        this.amountWrittenOff,
        this.amountOutstanding,
        this.penalty,
        this.isActive,
        this.isPaid,
        this.isWaived,
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

    factory PageItem.fromJson(Map<String, dynamic> json) => PageItem(
        id: json["id"],
        clientId: json["clientId"],
        chargeId: json["chargeId"],
        name: json["name"],
        chargeTimeType: json["chargeTimeType"] == null ? null : ChargeType.fromJson(json["chargeTimeType"]),
        dueDate: json["dueDate"] == null ? [] : List<int>.from(json["dueDate"]!.map((x) => x)),
        chargeCalculationType: json["chargeCalculationType"] == null ? null : ChargeType.fromJson(json["chargeCalculationType"]),
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        amount: _toDouble(json["amount"]),
        amountPaid: _toDouble(json["amountPaid"]),
        amountWaived: _toDouble(json["amountWaived"]),
        amountWrittenOff: _toDouble(json["amountWrittenOff"]),
        amountOutstanding: _toDouble(json["amountOutstanding"]),
        penalty: json["penalty"],
        isActive: json["isActive"],
        isPaid: json["isPaid"],
        isWaived: json["isWaived"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "chargeId": chargeId,
        "name": name,
        "chargeTimeType": chargeTimeType?.toJson(),
        "dueDate": dueDate == null ? [] : List<dynamic>.from(dueDate!.map((x) => x)),
        "chargeCalculationType": chargeCalculationType?.toJson(),
        "currency": currency?.toJson(),
        "amount": amount,
        "amountPaid": amountPaid,
        "amountWaived": amountWaived,
        "amountWrittenOff": amountWrittenOff,
        "amountOutstanding": amountOutstanding,
        "penalty": penalty,
        "isActive": isActive,
        "isPaid": isPaid,
        "isWaived": isWaived,
    };
}

class ChargeType {
    int? id;
    String? code;
    String? value;

    ChargeType({
        this.id,
        this.code,
        this.value,
    });

    factory ChargeType.fromJson(Map<String, dynamic> json) => ChargeType(
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
        "decimalPlaces": nameCode,
        "displayLabel": displayLabel,
        "displaySymbol": displaySymbol,
    };
}

