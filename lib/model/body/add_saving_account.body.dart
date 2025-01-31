// To parse this JSON data, do
//
//     final addSavingAccounBody = addSavingAccounBodyFromJson(jsonString);

import 'dart:convert';

AddSavingAccounBody addSavingAccounBodyFromJson(String str) => AddSavingAccounBody.fromJson(json.decode(str));

String addSavingAccounBodyToJson(AddSavingAccounBody data) => json.encode(data.toJson());

class AddSavingAccounBody {
    bool? allowOverdraft;
    int? clientId;
    String? dateFormat;
    bool? enforceMinRequiredBalance;
    String? externalId;
    int? fieldOfficerId;
    String? locale;
    String? minOverdraftForInterestCalculation;
    String? minRequiredOpeningBalance;
    String? nominalAnnualInterestRate;
    String? nominalAnnualInterestRateOverdraft;
    String? overdraftLimit;
    int? productId;
    String? submittedOnDate;

    AddSavingAccounBody({
        this.allowOverdraft,
        this.clientId,
        this.dateFormat,
        this.enforceMinRequiredBalance,
        this.externalId,
        this.fieldOfficerId,
        this.locale,
        this.minOverdraftForInterestCalculation,
        this.minRequiredOpeningBalance,
        this.nominalAnnualInterestRate,
        this.nominalAnnualInterestRateOverdraft,
        this.overdraftLimit,
        this.productId,
        this.submittedOnDate,
    });

    factory AddSavingAccounBody.fromJson(Map<String, dynamic> json) => AddSavingAccounBody(
        allowOverdraft: json["allowOverdraft"],
        clientId: json["clientId"],
        dateFormat: json["dateFormat"],
        enforceMinRequiredBalance: json["enforceMinRequiredBalance"],
        externalId: json["externalId"],
        fieldOfficerId: json["fieldOfficerId"],
        locale: json["locale"],
        minOverdraftForInterestCalculation: json["minOverdraftForInterestCalculation"],
        minRequiredOpeningBalance: json["minRequiredOpeningBalance"],
        nominalAnnualInterestRate: json["nominalAnnualInterestRate"],
        nominalAnnualInterestRateOverdraft: json["nominalAnnualInterestRateOverdraft"],
        overdraftLimit: json["overdraftLimit"],
        productId: json["productId"],
        submittedOnDate: json["submittedOnDate"],
    );

    Map<String, dynamic> toJson() => {
        "allowOverdraft": allowOverdraft,
        "clientId": clientId,
        "dateFormat": dateFormat,
        "enforceMinRequiredBalance": enforceMinRequiredBalance,
        "externalId": externalId,
        "fieldOfficerId": fieldOfficerId,
        "locale": locale,
        "minOverdraftForInterestCalculation": minOverdraftForInterestCalculation,
        "minRequiredOpeningBalance": minRequiredOpeningBalance,
        "nominalAnnualInterestRate": nominalAnnualInterestRate,
        "nominalAnnualInterestRateOverdraft": nominalAnnualInterestRateOverdraft,
        "overdraftLimit": overdraftLimit,
        "productId": productId,
        "submittedOnDate": submittedOnDate,
    };
}
