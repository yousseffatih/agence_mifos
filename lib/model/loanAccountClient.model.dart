// To parse this JSON data, do
//
//     final loanAccountClient = loanAccountClientFromJson(jsonString);

import 'dart:convert';

LoanAccountClient loanAccountClientFromJson(String str) => LoanAccountClient.fromJson(json.decode(str));

String loanAccountClientToJson(LoanAccountClient data) => json.encode(data.toJson());

class LoanAccountClient {
    List<Account>? loanAccounts;
    List<SavingsAccount>? savingsAccounts;

    LoanAccountClient({
        this.loanAccounts,
        this.savingsAccounts,
    });

    factory LoanAccountClient.fromJson(Map<String, dynamic> json) => LoanAccountClient(
        loanAccounts: json["loanAccounts"] == null 
            ? [] 
            : List<Account>.from(json["loanAccounts"]!.map((x) => Account.fromJson(x))),
        savingsAccounts: json["savingsAccounts"] == null ? [] : List<SavingsAccount>.from(json["savingsAccounts"]!.map((x) => SavingsAccount.fromJson(x))),

        
    );

    Map<String, dynamic> toJson() => {
        "loanAccounts": loanAccounts == null 
            ? [] 
            : List<dynamic>.from(loanAccounts!.map((x) => x.toJson())),
        "savingsAccounts": savingsAccounts == null ? [] 
        : List<dynamic>.from(savingsAccounts!.map((x) => x.toJson())),

    };
}

class Account {
    int? id;
    String? accountNo;
    int? productId;
    Status? status;
    String? productName;
    String? shortProductName;
   

    Account({
        this.id,
        this.accountNo,
        this.productId,
        this.status,
        this.productName,
        this.shortProductName,
        
    });

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        accountNo: json["accountNo"],
        productId: json["productId"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        productName: json["productName"],
        shortProductName: json["shortProductName"],
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "productId": productId,
        "status": status?.toJson(),
        "productName": productName,
        "shortProductName": shortProductName,
        
    };
}


class SavingsAccount {
    int? id;
    String? accountNo;
    String? externalId;
    int? productId;
    String? productName;
    String? shortProductName;
    Status? status;
    Currency? currency;
    double? accountBalance;
    TType? accountType;
    Timeline? timeline;
    SubStatus? subStatus;
    List<int>? lastActiveTransactionDate;
    TType? depositType;

    SavingsAccount({
        this.id,
        this.accountNo,
        this.externalId,
        this.productId,
        this.productName,
        this.shortProductName,
        this.status,
        this.currency,
        this.accountBalance,
        this.accountType,
        this.timeline,
        this.subStatus,
        this.lastActiveTransactionDate,
        this.depositType,
    });

    factory SavingsAccount.fromJson(Map<String, dynamic> json) => SavingsAccount(
        id: json["id"],
        accountNo: json["accountNo"],
        externalId: json["externalId"],
        productId: json["productId"],
        productName: json["productName"],
        shortProductName: json["shortProductName"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        accountBalance: json["accountBalance"]?.toDouble(),
        accountType: json["accountType"] == null ? null : TType.fromJson(json["accountType"]),
        timeline: json["timeline"] == null ? null : Timeline.fromJson(json["timeline"]),
        subStatus: json["subStatus"] == null ? null : SubStatus.fromJson(json["subStatus"]),
        lastActiveTransactionDate: json["lastActiveTransactionDate"] == null ? [] : List<int>.from(json["lastActiveTransactionDate"]!.map((x) => x)),
        depositType: json["depositType"] == null ? null : TType.fromJson(json["depositType"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "externalId": externalId,
        "productId": productId,
        "productName": productName,
        "shortProductName": shortProductName,
        "status": status?.toJson(),
        "currency": currency?.toJson(),
        "accountBalance": accountBalance,
        "accountType": accountType?.toJson(),
        "timeline": timeline?.toJson(),
        "subStatus": subStatus?.toJson(),
        "lastActiveTransactionDate": lastActiveTransactionDate == null ? [] : List<dynamic>.from(lastActiveTransactionDate!.map((x) => x)),
        "depositType": depositType?.toJson(),
    };
}

class TType {
    int? id;
    String? code;
    String? value;

    TType({
        this.id,
        this.code,
        this.value,
    });

    factory TType.fromJson(Map<String, dynamic> json) => TType(
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
    int? inMultiplesOf;
    String? displaySymbol;
    String? nameCode;
    String? displayLabel;

    Currency({
        this.code,
        this.name,
        this.decimalPlaces,
        this.inMultiplesOf,
        this.displaySymbol,
        this.nameCode,
        this.displayLabel,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        decimalPlaces: json["decimalPlaces"],
        inMultiplesOf: json["inMultiplesOf"],
        displaySymbol: json["displaySymbol"],
        nameCode: json["nameCode"],
        displayLabel: json["displayLabel"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "decimalPlaces": decimalPlaces,
        "inMultiplesOf": inMultiplesOf,
        "displaySymbol": displaySymbol,
        "nameCode": nameCode,
        "displayLabel": displayLabel,
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

class Timeline {
    List<int>? submittedOnDate;
    String? submittedByUsername;
    String? submittedByFirstname;
    String? submittedByLastname;
    List<int>? approvedOnDate;
    String? approvedByUsername;
    String? approvedByFirstname;
    String? approvedByLastname;
    List<int>? activatedOnDate;

    Timeline({
        this.submittedOnDate,
        this.submittedByUsername,
        this.submittedByFirstname,
        this.submittedByLastname,
        this.approvedOnDate,
        this.approvedByUsername,
        this.approvedByFirstname,
        this.approvedByLastname,
        this.activatedOnDate,
    });

    factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        submittedOnDate: json["submittedOnDate"] == null ? [] : List<int>.from(json["submittedOnDate"]!.map((x) => x)),
        submittedByUsername: json["submittedByUsername"],
        submittedByFirstname: json["submittedByFirstname"],
        submittedByLastname: json["submittedByLastname"],
        approvedOnDate: json["approvedOnDate"] == null ? [] : List<int>.from(json["approvedOnDate"]!.map((x) => x)),
        approvedByUsername: json["approvedByUsername"],
        approvedByFirstname: json["approvedByFirstname"],
        approvedByLastname: json["approvedByLastname"],
        activatedOnDate: json["activatedOnDate"] == null ? [] : List<int>.from(json["activatedOnDate"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "submittedOnDate": submittedOnDate == null ? [] : List<dynamic>.from(submittedOnDate!.map((x) => x)),
        "submittedByUsername": submittedByUsername,
        "submittedByFirstname": submittedByFirstname,
        "submittedByLastname": submittedByLastname,
        "approvedOnDate": approvedOnDate == null ? [] : List<dynamic>.from(approvedOnDate!.map((x) => x)),
        "approvedByUsername": approvedByUsername,
        "approvedByFirstname": approvedByFirstname,
        "approvedByLastname": approvedByLastname,
        "activatedOnDate": activatedOnDate == null ? [] : List<dynamic>.from(activatedOnDate!.map((x) => x)),
    };
}
