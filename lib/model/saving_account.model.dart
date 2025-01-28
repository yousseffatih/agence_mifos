import 'dart:convert';

List<SavingsProduct> savingsProductFromJson(String str) => List<SavingsProduct>.from(json.decode(str).map((x) => SavingsProduct.fromJson(x)));

String savingsProductToJson(List<SavingsProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SavingsProduct {
    int? id;
    String? name;
    String? shortName;
    String? description;
    Currency? currency;
    double? nominalAnnualInterestRate;
    AccountingRule? interestCompoundingPeriodType;
    AccountingRule? interestPostingPeriodType;
    AccountingRule? interestCalculationType;
    AccountingRule? interestCalculationDaysInYearType;
    double? minRequiredOpeningBalance;
    int? lockinPeriodFrequency;
    AccountingRule? lockinPeriodFrequencyType;
    bool? withdrawalFeeForTransfers;
    bool? allowOverdraft;
    double? overdraftLimit;
    double? minRequiredBalance;
    bool? enforceMinRequiredBalance;
    double? minBalanceForInterestCalculation;
    double? nominalAnnualInterestRateOverdraft;
    double? minOverdraftForInterestCalculation;
    bool? withHoldTax;
    TaxGroup? taxGroup;
    AccountingRule? accountingRule;
    bool? isDormancyTrackingActive;
    int? daysToInactive;
    int? daysToDormancy;
    int? daysToEscheat;

    SavingsProduct({
        this.id,
        this.name,
        this.shortName,
        this.description,
        this.currency,
        this.nominalAnnualInterestRate,
        this.interestCompoundingPeriodType,
        this.interestPostingPeriodType,
        this.interestCalculationType,
        this.interestCalculationDaysInYearType,
        this.minRequiredOpeningBalance,
        this.lockinPeriodFrequency,
        this.lockinPeriodFrequencyType,
        this.withdrawalFeeForTransfers,
        this.allowOverdraft,
        this.overdraftLimit,
        this.minRequiredBalance,
        this.enforceMinRequiredBalance,
        this.minBalanceForInterestCalculation,
        this.nominalAnnualInterestRateOverdraft,
        this.minOverdraftForInterestCalculation,
        this.withHoldTax,
        this.taxGroup,
        this.accountingRule,
        this.isDormancyTrackingActive,
        this.daysToInactive,
        this.daysToDormancy,
        this.daysToEscheat,
    });

    factory SavingsProduct.fromJson(Map<String, dynamic> json) => SavingsProduct(
        id: json["id"],
        name: json["name"],
        shortName: json["shortName"],
        description: json["description"],
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        nominalAnnualInterestRate: json["nominalAnnualInterestRate"]?.toDouble(),
        interestCompoundingPeriodType: json["interestCompoundingPeriodType"] == null ? null : AccountingRule.fromJson(json["interestCompoundingPeriodType"]),
        interestPostingPeriodType: json["interestPostingPeriodType"] == null ? null : AccountingRule.fromJson(json["interestPostingPeriodType"]),
        interestCalculationType: json["interestCalculationType"] == null ? null : AccountingRule.fromJson(json["interestCalculationType"]),
        interestCalculationDaysInYearType: json["interestCalculationDaysInYearType"] == null ? null : AccountingRule.fromJson(json["interestCalculationDaysInYearType"]),
        minRequiredOpeningBalance: json["minRequiredOpeningBalance"],
        lockinPeriodFrequency: json["lockinPeriodFrequency"],
        lockinPeriodFrequencyType: json["lockinPeriodFrequencyType"] == null ? null : AccountingRule.fromJson(json["lockinPeriodFrequencyType"]),
        withdrawalFeeForTransfers: json["withdrawalFeeForTransfers"],
        allowOverdraft: json["allowOverdraft"],
        overdraftLimit: json["overdraftLimit"],
        minRequiredBalance: json["minRequiredBalance"],
        enforceMinRequiredBalance: json["enforceMinRequiredBalance"],
        minBalanceForInterestCalculation: json["minBalanceForInterestCalculation"],
        nominalAnnualInterestRateOverdraft: json["nominalAnnualInterestRateOverdraft"],
        minOverdraftForInterestCalculation: json["minOverdraftForInterestCalculation"],
        withHoldTax: json["withHoldTax"],
        taxGroup: json["taxGroup"] == null ? null : TaxGroup.fromJson(json["taxGroup"]),
        accountingRule: json["accountingRule"] == null ? null : AccountingRule.fromJson(json["accountingRule"]),
        isDormancyTrackingActive: json["isDormancyTrackingActive"],
        daysToInactive: json["daysToInactive"],
        daysToDormancy: json["daysToDormancy"],
        daysToEscheat: json["daysToEscheat"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortName": shortName,
        "description": description,
        "currency": currency?.toJson(),
        "nominalAnnualInterestRate": nominalAnnualInterestRate,
        "interestCompoundingPeriodType": interestCompoundingPeriodType?.toJson(),
        "interestPostingPeriodType": interestPostingPeriodType?.toJson(),
        "interestCalculationType": interestCalculationType?.toJson(),
        "interestCalculationDaysInYearType": interestCalculationDaysInYearType?.toJson(),
        "minRequiredOpeningBalance": minRequiredOpeningBalance,
        "lockinPeriodFrequency": lockinPeriodFrequency,
        "lockinPeriodFrequencyType": lockinPeriodFrequencyType?.toJson(),
        "withdrawalFeeForTransfers": withdrawalFeeForTransfers,
        "allowOverdraft": allowOverdraft,
        "overdraftLimit": overdraftLimit,
        "minRequiredBalance": minRequiredBalance,
        "enforceMinRequiredBalance": enforceMinRequiredBalance,
        "minBalanceForInterestCalculation": minBalanceForInterestCalculation,
        "nominalAnnualInterestRateOverdraft": nominalAnnualInterestRateOverdraft,
        "minOverdraftForInterestCalculation": minOverdraftForInterestCalculation,
        "withHoldTax": withHoldTax,
        "taxGroup": taxGroup?.toJson(),
        "accountingRule": accountingRule?.toJson(),
        "isDormancyTrackingActive": isDormancyTrackingActive,
        "daysToInactive": daysToInactive,
        "daysToDormancy": daysToDormancy,
        "daysToEscheat": daysToEscheat,
    };
}

class AccountingRule {
    int? id;
    String? code;
    String? value;

    AccountingRule({
        this.id,
        this.code,
        this.value,
    });

    factory AccountingRule.fromJson(Map<String, dynamic> json) => AccountingRule(
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
    String? nameCode;
    String? displayLabel;
    String? displaySymbol;

    Currency({
        this.code,
        this.name,
        this.decimalPlaces,
        this.inMultiplesOf,
        this.nameCode,
        this.displayLabel,
        this.displaySymbol,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        decimalPlaces: json["decimalPlaces"],
        inMultiplesOf: json["inMultiplesOf"],
        nameCode: json["nameCode"],
        displayLabel: json["displayLabel"],
        displaySymbol: json["displaySymbol"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "decimalPlaces": decimalPlaces,
        "inMultiplesOf": inMultiplesOf,
        "nameCode": nameCode,
        "displayLabel": displayLabel,
        "displaySymbol": displaySymbol,
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
