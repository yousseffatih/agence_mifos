// To parse this JSON data, do
//
//     final savingAccountClient = savingAccountClientFromJson(jsonString);

import 'dart:convert';

SavingAccountClient savingAccountClientFromJson(String str) => SavingAccountClient.fromJson(json.decode(str));

String savingAccountClientToJson(SavingAccountClient data) => json.encode(data.toJson());

class SavingAccountClient {
    int? id;
    String? accountNo;
    Type? depositType;
    int? clientId;
    String? clientName;
    int? savingsProductId;
    String? savingsProductName;
    int? fieldOfficerId;
    String? fieldOfficerName;
    Status? status;
    SubStatus? subStatus;
    Timeline? timeline;
    Currency? currency;
    double? nominalAnnualInterestRate;
    Type? interestCompoundingPeriodType;
    Type? interestPostingPeriodType;
    Type? interestCalculationType;
    Type? interestCalculationDaysInYearType;
    int? lockinPeriodFrequency;
    Type? lockinPeriodFrequencyType;
    bool? withdrawalFeeForTransfers;
    bool? allowOverdraft;
    double? minRequiredBalance;
    bool? enforceMinRequiredBalance;
    double? minBalanceForInterestCalculation;
    bool? withHoldTax;
    TaxGroup? taxGroup;
    bool? isDormancyTrackingActive;
    Summary? summary;

    SavingAccountClient({
        this.id,
        this.accountNo,
        this.depositType,
        this.clientId,
        this.clientName,
        this.savingsProductId,
        this.savingsProductName,
        this.fieldOfficerId,
        this.fieldOfficerName,
        this.status,
        this.subStatus,
        this.timeline,
        this.currency,
        this.nominalAnnualInterestRate,
        this.interestCompoundingPeriodType,
        this.interestPostingPeriodType,
        this.interestCalculationType,
        this.interestCalculationDaysInYearType,
        this.lockinPeriodFrequency,
        this.lockinPeriodFrequencyType,
        this.withdrawalFeeForTransfers,
        this.allowOverdraft,
        this.minRequiredBalance,
        this.enforceMinRequiredBalance,
        this.minBalanceForInterestCalculation,
        this.withHoldTax,
        this.taxGroup,
        this.isDormancyTrackingActive,
        this.summary,
    });

    factory SavingAccountClient.fromJson(Map<String, dynamic> json) {
      print("this is the error : ${json["savingsProductName"]}");
      return SavingAccountClient(
        id: json["id"],
        accountNo: json["accountNo"],
        depositType: json["depositType"] == null ? null : Type.fromJson(json["depositType"]),
        clientId: json["clientId"],
        clientName: json["clientName"],
        savingsProductId: json["savingsProductId"],
        savingsProductName: json["savingsProductName"],
        fieldOfficerId: json["fieldOfficerId"],
        fieldOfficerName: json["fieldOfficerName"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        subStatus: json["subStatus"] == null ? null : SubStatus.fromJson(json["subStatus"]),
        timeline: json["timeline"] == null ? null : Timeline.fromJson(json["timeline"]),
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        nominalAnnualInterestRate: json["nominalAnnualInterestRate"],
        interestCompoundingPeriodType: json["interestCompoundingPeriodType"] == null ? null : Type.fromJson(json["interestCompoundingPeriodType"]),
        interestPostingPeriodType: json["interestPostingPeriodType"] == null ? null : Type.fromJson(json["interestPostingPeriodType"]),
        interestCalculationType: json["interestCalculationType"] == null ? null : Type.fromJson(json["interestCalculationType"]),
        interestCalculationDaysInYearType: json["interestCalculationDaysInYearType"] == null ? null : Type.fromJson(json["interestCalculationDaysInYearType"]),
        lockinPeriodFrequency: json["lockinPeriodFrequency"],
        lockinPeriodFrequencyType: json["lockinPeriodFrequencyType"] == null ? null : Type.fromJson(json["lockinPeriodFrequencyType"]),
        withdrawalFeeForTransfers: json["withdrawalFeeForTransfers"],
        allowOverdraft: json["allowOverdraft"],
        minRequiredBalance: json["minRequiredBalance"],
        enforceMinRequiredBalance: json["enforceMinRequiredBalance"],
        minBalanceForInterestCalculation: json["minBalanceForInterestCalculation"],
        withHoldTax: json["withHoldTax"],
        taxGroup: json["taxGroup"] == null ? null : TaxGroup.fromJson(json["taxGroup"]),
        isDormancyTrackingActive: json["isDormancyTrackingActive"],
        summary: json["summary"] == null ? null : Summary.fromJson(json["summary"]),
    );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "depositType": depositType?.toJson(),
        "clientId": clientId,
        "clientName": clientName,
        "savingsProductId": savingsProductId,
        "savingsProductName": savingsProductName,
        "fieldOfficerId": fieldOfficerId,
        "fieldOfficerName": fieldOfficerName,
        "status": status?.toJson(),
        "subStatus": subStatus?.toJson(),
        "timeline": timeline?.toJson(),
        "currency": currency?.toJson(),
        "nominalAnnualInterestRate": nominalAnnualInterestRate,
        "interestCompoundingPeriodType": interestCompoundingPeriodType?.toJson(),
        "interestPostingPeriodType": interestPostingPeriodType?.toJson(),
        "interestCalculationType": interestCalculationType?.toJson(),
        "interestCalculationDaysInYearType": interestCalculationDaysInYearType?.toJson(),
        "lockinPeriodFrequency": lockinPeriodFrequency,
        "lockinPeriodFrequencyType": lockinPeriodFrequencyType?.toJson(),
        "withdrawalFeeForTransfers": withdrawalFeeForTransfers,
        "allowOverdraft": allowOverdraft,
        "minRequiredBalance": minRequiredBalance,
        "enforceMinRequiredBalance": enforceMinRequiredBalance,
        "minBalanceForInterestCalculation": minBalanceForInterestCalculation,
        "withHoldTax": withHoldTax,
        "taxGroup": taxGroup?.toJson(),
        "isDormancyTrackingActive": isDormancyTrackingActive,
        "summary": summary?.toJson(),
    };
}

class Currency {
    String? code;
    String? name;
    int? decimalPlaces;
    int? inMultiplesOf;
    String? nameCode;
    String? displayLabel;

    Currency({
        this.code,
        this.name,
        this.decimalPlaces,
        this.inMultiplesOf,
        this.nameCode,
        this.displayLabel,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        decimalPlaces: json["decimalPlaces"],
        inMultiplesOf: json["inMultiplesOf"],
        nameCode: json["nameCode"],
        displayLabel: json["displayLabel"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "decimalPlaces": decimalPlaces,
        "inMultiplesOf": inMultiplesOf,
        "nameCode": nameCode,
        "displayLabel": displayLabel,
    };
}

class Type {
    int? id;
    String? code;
    String? value;

    Type({
        this.id,
        this.code,
        this.value,
    });

    factory Type.fromJson(Map<String, dynamic> json) => Type(
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

class Status {
    int? id;
    String? code;
    String? value;
    bool? submittedAndPendingApproval;
    bool? approved;
    bool? rejected;
    bool? withdrawnByApplicant;
    bool? active;
    bool? closed;
    bool? prematureClosed;
    bool? transferInProgress;
    bool? transferOnHold;
    bool? matured;

    Status({
        this.id,
        this.code,
        this.value,
        this.submittedAndPendingApproval,
        this.approved,
        this.rejected,
        this.withdrawnByApplicant,
        this.active,
        this.closed,
        this.prematureClosed,
        this.transferInProgress,
        this.transferOnHold,
        this.matured,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        code: json["code"],
        value: json["value"],
        submittedAndPendingApproval: json["submittedAndPendingApproval"],
        approved: json["approved"],
        rejected: json["rejected"],
        withdrawnByApplicant: json["withdrawnByApplicant"],
        active: json["active"],
        closed: json["closed"],
        prematureClosed: json["prematureClosed"],
        transferInProgress: json["transferInProgress"],
        transferOnHold: json["transferOnHold"],
        matured: json["matured"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
        "submittedAndPendingApproval": submittedAndPendingApproval,
        "approved": approved,
        "rejected": rejected,
        "withdrawnByApplicant": withdrawnByApplicant,
        "active": active,
        "closed": closed,
        "prematureClosed": prematureClosed,
        "transferInProgress": transferInProgress,
        "transferOnHold": transferOnHold,
        "matured": matured,
    };
}

class SubStatus {
    int? id;
    String? code;
    String? value;
    bool? none;
    bool? inactive;
    bool? dormant;
    bool? escheat;
    bool? block;
    bool? blockCredit;
    bool? blockDebit;

    SubStatus({
        this.id,
        this.code,
        this.value,
        this.none,
        this.inactive,
        this.dormant,
        this.escheat,
        this.block,
        this.blockCredit,
        this.blockDebit,
    });

    factory SubStatus.fromJson(Map<String, dynamic> json) => SubStatus(
        id: json["id"],
        code: json["code"],
        value: json["value"],
        none: json["none"],
        inactive: json["inactive"],
        dormant: json["dormant"],
        escheat: json["escheat"],
        block: json["block"],
        blockCredit: json["blockCredit"],
        blockDebit: json["blockDebit"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
        "none": none,
        "inactive": inactive,
        "dormant": dormant,
        "escheat": escheat,
        "block": block,
        "blockCredit": blockCredit,
        "blockDebit": blockDebit,
    };
}

class Summary {
    Currency? currency;
    int? totalInterestPosted;
    double? accountBalance;
    int? totalOverdraftInterestDerived;
    int? interestNotPosted;
    double? availableBalance;

    Summary({
        this.currency,
        this.totalInterestPosted,
        this.accountBalance,
        this.totalOverdraftInterestDerived,
        this.interestNotPosted,
        this.availableBalance,
    });

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        totalInterestPosted: json["totalInterestPosted"],
        accountBalance: json["accountBalance"],
        totalOverdraftInterestDerived: json["totalOverdraftInterestDerived"],
        interestNotPosted: json["interestNotPosted"],
        availableBalance: json["availableBalance"],
    );

    Map<String, dynamic> toJson() => {
        "currency": currency?.toJson(),
        "totalInterestPosted": totalInterestPosted,
        "accountBalance": accountBalance,
        "totalOverdraftInterestDerived": totalOverdraftInterestDerived,
        "interestNotPosted": interestNotPosted,
        "availableBalance": availableBalance,
    };
}

class TaxGroup {
    int? id;
    String? name;

    TaxGroup({
        this.id,
        this.name,
    });

    factory TaxGroup.fromJson(Map<String, dynamic> json) => TaxGroup(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Timeline {
    List<int>? submittedOnDate;
    String? submittedByUsername;
    String? submittedByFirstname;
    String? submittedByLastname;

    Timeline({
        this.submittedOnDate,
        this.submittedByUsername,
        this.submittedByFirstname,
        this.submittedByLastname,
    });

    factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        submittedOnDate: json["submittedOnDate"] == null ? [] : List<int>.from(json["submittedOnDate"]!.map((x) => x)),
        submittedByUsername: json["submittedByUsername"],
        submittedByFirstname: json["submittedByFirstname"],
        submittedByLastname: json["submittedByLastname"],
    );

    Map<String, dynamic> toJson() => {
        "submittedOnDate": submittedOnDate == null ? [] : List<dynamic>.from(submittedOnDate!.map((x) => x)),
        "submittedByUsername": submittedByUsername,
        "submittedByFirstname": submittedByFirstname,
        "submittedByLastname": submittedByLastname,
    };
}
