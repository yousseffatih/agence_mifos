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

    factory SavingAccountClient.fromJson(Map<String, dynamic>? json) {
        if (json == null) return SavingAccountClient();
        return SavingAccountClient(
            id: json["id"] as int?,
            accountNo: json["accountNo"] as String?,
            depositType: json["depositType"] != null ? Type.fromJson(json["depositType"] as Map<String, dynamic>) : null,
            clientId: json["clientId"] as int?,
            clientName: json["clientName"] as String?,
            savingsProductId: json["savingsProductId"] as int?,
            savingsProductName: json["savingsProductName"] as String? ?? "",
            fieldOfficerId: json["fieldOfficerId"] as int?,
            fieldOfficerName: json["fieldOfficerName"] as String?,
            status: json["status"] != null ? Status.fromJson(json["status"] as Map<String, dynamic>) : null,
            subStatus: json["subStatus"] != null ? SubStatus.fromJson(json["subStatus"] as Map<String, dynamic>) : null,
            timeline: json["timeline"] != null ? Timeline.fromJson(json["timeline"] as Map<String, dynamic>) : null,
            currency: json["currency"] != null ? Currency.fromJson(json["currency"] as Map<String, dynamic>) : null,
            nominalAnnualInterestRate: json["nominalAnnualInterestRate"] as double?,
            interestCompoundingPeriodType: json["interestCompoundingPeriodType"] != null ? Type.fromJson(json["interestCompoundingPeriodType"] as Map<String, dynamic>) : null,
            interestPostingPeriodType: json["interestPostingPeriodType"] != null ? Type.fromJson(json["interestPostingPeriodType"] as Map<String, dynamic>) : null,
            interestCalculationType: json["interestCalculationType"] != null ? Type.fromJson(json["interestCalculationType"] as Map<String, dynamic>) : null,
            interestCalculationDaysInYearType: json["interestCalculationDaysInYearType"] != null ? Type.fromJson(json["interestCalculationDaysInYearType"] as Map<String, dynamic>) : null,
            lockinPeriodFrequency: json["lockinPeriodFrequency"] as int?,
            lockinPeriodFrequencyType: json["lockinPeriodFrequencyType"] != null ? Type.fromJson(json["lockinPeriodFrequencyType"] as Map<String, dynamic>) : null,
            withdrawalFeeForTransfers: json["withdrawalFeeForTransfers"] as bool?,
            allowOverdraft: json["allowOverdraft"] as bool?,
            minRequiredBalance: json["minRequiredBalance"] as double?,
            enforceMinRequiredBalance: json["enforceMinRequiredBalance"] as bool?,
            minBalanceForInterestCalculation: json["minBalanceForInterestCalculation"] as double?,
            withHoldTax: json["withHoldTax"] as bool?,
            taxGroup: json["taxGroup"] != null ? TaxGroup.fromJson(json["taxGroup"] as Map<String, dynamic>) : null,
            isDormancyTrackingActive: json["isDormancyTrackingActive"] as bool?,
            summary: json["summary"] != null ? Summary.fromJson(json["summary"] as Map<String, dynamic>) : null,
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

    factory Currency.fromJson(Map<String, dynamic>? json) {
        if (json == null) return Currency();
        return Currency(
            code: json["code"] as String?,
            name: json["name"] as String?,
            decimalPlaces: json["decimalPlaces"] as int?,
            inMultiplesOf: json["inMultiplesOf"] as int?,
            nameCode: json["nameCode"] as String?,
            displayLabel: json["displayLabel"] as String?,
        );
    }

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

    factory Type.fromJson(Map<String, dynamic>? json) {
        if (json == null) return Type();
        return Type(
            id: json["id"] as int?,
            code: json["code"] as String?,
            value: json["value"] as String?,
        );
    }

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

    factory Status.fromJson(Map<String, dynamic>? json) {
        if (json == null) return Status();
        return Status(
            id: json["id"] as int?,
            code: json["code"] as String?,
            value: json["value"] as String?,
            submittedAndPendingApproval: json["submittedAndPendingApproval"] as bool?,
            approved: json["approved"] as bool?,
            rejected: json["rejected"] as bool?,
            withdrawnByApplicant: json["withdrawnByApplicant"] as bool?,
            active: json["active"] as bool?,
            closed: json["closed"] as bool?,
            prematureClosed: json["prematureClosed"] as bool?,
            transferInProgress: json["transferInProgress"] as bool?,
            transferOnHold: json["transferOnHold"] as bool?,
            matured: json["matured"] as bool?,
        );
    }

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

    factory SubStatus.fromJson(Map<String, dynamic>? json) {
        if (json == null) return SubStatus();
        return SubStatus(
            id: json["id"] as int?,
            code: json["code"] as String?,
            value: json["value"] as String?,
            none: json["none"] as bool?,
            inactive: json["inactive"] as bool?,
            dormant: json["dormant"] as bool?,
            escheat: json["escheat"] as bool?,
            block: json["block"] as bool?,
            blockCredit: json["blockCredit"] as bool?,
            blockDebit: json["blockDebit"] as bool?,
        );
    }

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

    factory Summary.fromJson(Map<String, dynamic>? json) {
        if (json == null) return Summary();
        return Summary(
            currency: json["currency"] != null ? Currency.fromJson(json["currency"] as Map<String, dynamic>) : null,
            totalInterestPosted: json["totalInterestPosted"] as int?,
            accountBalance: json["accountBalance"] as double?,
            totalOverdraftInterestDerived: json["totalOverdraftInterestDerived"] as int?,
            interestNotPosted: json["interestNotPosted"] as int?,
            availableBalance: json["availableBalance"] as double?,
        );
    }

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

    factory TaxGroup.fromJson(Map<String, dynamic>? json) {
        if (json == null) return TaxGroup();
        return TaxGroup(
            id: json["id"] as int?,
            name: json["name"] as String?,
        );
    }

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
