// To parse this JSON data, do
//
//     final submitChargesBody = submitChargesBodyFromJson(jsonString);

import 'dart:convert';

SubmitChargesBody submitChargesBodyFromJson(String str) => SubmitChargesBody.fromJson(json.decode(str));

String submitChargesBodyToJson(SubmitChargesBody data) => json.encode(data.toJson());

class SubmitChargesBody {
    String? amount;
    int? chargeId;
    String? dateFormat;
    String? dueDate;
    String? locale;

    SubmitChargesBody({
        this.amount,
        this.chargeId,
        this.dateFormat,
        this.dueDate,
        this.locale,
    });

    factory SubmitChargesBody.fromJson(Map<String, dynamic> json) => SubmitChargesBody(
        amount: json["amount"],
        chargeId: json["chargeId"],
        dateFormat: json["dateFormat"],
        dueDate: json["dueDate"],
        locale: json["locale"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "chargeId": chargeId,
        "dateFormat": dateFormat,
        "dueDate": dueDate,
        "locale": locale,
    };
}
