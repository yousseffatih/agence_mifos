// To parse this JSON data, do
//
//     final savingProdTemplate = savingProdTemplateFromJson(jsonString);

import 'dart:convert';

SavingProdTemplate savingProdTemplateFromJson(String str) => SavingProdTemplate.fromJson(json.decode(str));

String savingProdTemplateToJson(SavingProdTemplate data) => json.encode(data.toJson());

class SavingProdTemplate {
    Currency? currency;
    AccountingRule? interestCompoundingPeriodType;
    AccountingRule? interestPostingPeriodType;
    AccountingRule? interestCalculationType;
    AccountingRule? interestCalculationDaysInYearType;
    bool? withdrawalFeeForTransfers;
    bool? allowOverdraft;
    bool? enforceMinRequiredBalance;
    bool? withHoldTax;
    AccountingRule? accountingRule;
    List<Currency>? currencyOptions;
    List<AccountingRule>? interestCompoundingPeriodTypeOptions;
    List<AccountingRule>? interestPostingPeriodTypeOptions;
    List<AccountingRule>? interestCalculationTypeOptions;
    List<AccountingRule>? interestCalculationDaysInYearTypeOptions;
    List<AccountingRule>? lockinPeriodFrequencyTypeOptions;
    List<AccountingRule>? withdrawalFeeTypeOptions;
    List<PaymentTypeOption>? paymentTypeOptions;
    List<AccountingRule>? accountingRuleOptions;
    AccountingMappingOptions? accountingMappingOptions;
    List<Option>? chargeOptions;
    List<Option>? penaltyOptions;
    List<TaxGroup>? taxGroupOptions;
    bool? isDormancyTrackingActive;

    SavingProdTemplate({
        this.currency,
        this.interestCompoundingPeriodType,
        this.interestPostingPeriodType,
        this.interestCalculationType,
        this.interestCalculationDaysInYearType,
        this.withdrawalFeeForTransfers,
        this.allowOverdraft,
        this.enforceMinRequiredBalance,
        this.withHoldTax,
        this.accountingRule,
        this.currencyOptions,
        this.interestCompoundingPeriodTypeOptions,
        this.interestPostingPeriodTypeOptions,
        this.interestCalculationTypeOptions,
        this.interestCalculationDaysInYearTypeOptions,
        this.lockinPeriodFrequencyTypeOptions,
        this.withdrawalFeeTypeOptions,
        this.paymentTypeOptions,
        this.accountingRuleOptions,
        this.accountingMappingOptions,
        this.chargeOptions,
        this.penaltyOptions,
        this.taxGroupOptions,
        this.isDormancyTrackingActive,
    });

    factory SavingProdTemplate.fromJson(Map<String, dynamic> json) => SavingProdTemplate(
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        interestCompoundingPeriodType: json["interestCompoundingPeriodType"] == null ? null : AccountingRule.fromJson(json["interestCompoundingPeriodType"]),
        interestPostingPeriodType: json["interestPostingPeriodType"] == null ? null : AccountingRule.fromJson(json["interestPostingPeriodType"]),
        interestCalculationType: json["interestCalculationType"] == null ? null : AccountingRule.fromJson(json["interestCalculationType"]),
        interestCalculationDaysInYearType: json["interestCalculationDaysInYearType"] == null ? null : AccountingRule.fromJson(json["interestCalculationDaysInYearType"]),
        withdrawalFeeForTransfers: json["withdrawalFeeForTransfers"],
        allowOverdraft: json["allowOverdraft"],
        enforceMinRequiredBalance: json["enforceMinRequiredBalance"],
        withHoldTax: json["withHoldTax"],
        accountingRule: json["accountingRule"] == null ? null : AccountingRule.fromJson(json["accountingRule"]),
        currencyOptions: json["currencyOptions"] == null ? [] : List<Currency>.from(json["currencyOptions"]!.map((x) => Currency.fromJson(x))),
        interestCompoundingPeriodTypeOptions: json["interestCompoundingPeriodTypeOptions"] == null ? [] : List<AccountingRule>.from(json["interestCompoundingPeriodTypeOptions"]!.map((x) => AccountingRule.fromJson(x))),
        interestPostingPeriodTypeOptions: json["interestPostingPeriodTypeOptions"] == null ? [] : List<AccountingRule>.from(json["interestPostingPeriodTypeOptions"]!.map((x) => AccountingRule.fromJson(x))),
        interestCalculationTypeOptions: json["interestCalculationTypeOptions"] == null ? [] : List<AccountingRule>.from(json["interestCalculationTypeOptions"]!.map((x) => AccountingRule.fromJson(x))),
        interestCalculationDaysInYearTypeOptions: json["interestCalculationDaysInYearTypeOptions"] == null ? [] : List<AccountingRule>.from(json["interestCalculationDaysInYearTypeOptions"]!.map((x) => AccountingRule.fromJson(x))),
        lockinPeriodFrequencyTypeOptions: json["lockinPeriodFrequencyTypeOptions"] == null ? [] : List<AccountingRule>.from(json["lockinPeriodFrequencyTypeOptions"]!.map((x) => AccountingRule.fromJson(x))),
        withdrawalFeeTypeOptions: json["withdrawalFeeTypeOptions"] == null ? [] : List<AccountingRule>.from(json["withdrawalFeeTypeOptions"]!.map((x) => AccountingRule.fromJson(x))),
        paymentTypeOptions: json["paymentTypeOptions"] == null ? [] : List<PaymentTypeOption>.from(json["paymentTypeOptions"]!.map((x) => PaymentTypeOption.fromJson(x))),
        accountingRuleOptions: json["accountingRuleOptions"] == null ? [] : List<AccountingRule>.from(json["accountingRuleOptions"]!.map((x) => AccountingRule.fromJson(x))),
        accountingMappingOptions: json["accountingMappingOptions"] == null ? null : AccountingMappingOptions.fromJson(json["accountingMappingOptions"]),
        chargeOptions: json["chargeOptions"] == null ? [] : List<Option>.from(json["chargeOptions"]!.map((x) => Option.fromJson(x))),
        penaltyOptions: json["penaltyOptions"] == null ? [] : List<Option>.from(json["penaltyOptions"]!.map((x) => Option.fromJson(x))),
        taxGroupOptions: json["taxGroupOptions"] == null ? [] : List<TaxGroup>.from(json["taxGroupOptions"]!.map((x) => TaxGroup.fromJson(x))),
        isDormancyTrackingActive: json["isDormancyTrackingActive"],
    );

    Map<String, dynamic> toJson() => {
        "currency": currency?.toJson(),
        "interestCompoundingPeriodType": interestCompoundingPeriodType?.toJson(),
        "interestPostingPeriodType": interestPostingPeriodType?.toJson(),
        "interestCalculationType": interestCalculationType?.toJson(),
        "interestCalculationDaysInYearType": interestCalculationDaysInYearType?.toJson(),
        "withdrawalFeeForTransfers": withdrawalFeeForTransfers,
        "allowOverdraft": allowOverdraft,
        "enforceMinRequiredBalance": enforceMinRequiredBalance,
        "withHoldTax": withHoldTax,
        "accountingRule": accountingRule?.toJson(),
        "currencyOptions": currencyOptions == null ? [] : List<dynamic>.from(currencyOptions!.map((x) => x.toJson())),
        "interestCompoundingPeriodTypeOptions": interestCompoundingPeriodTypeOptions == null ? [] : List<dynamic>.from(interestCompoundingPeriodTypeOptions!.map((x) => x.toJson())),
        "interestPostingPeriodTypeOptions": interestPostingPeriodTypeOptions == null ? [] : List<dynamic>.from(interestPostingPeriodTypeOptions!.map((x) => x.toJson())),
        "interestCalculationTypeOptions": interestCalculationTypeOptions == null ? [] : List<dynamic>.from(interestCalculationTypeOptions!.map((x) => x.toJson())),
        "interestCalculationDaysInYearTypeOptions": interestCalculationDaysInYearTypeOptions == null ? [] : List<dynamic>.from(interestCalculationDaysInYearTypeOptions!.map((x) => x.toJson())),
        "lockinPeriodFrequencyTypeOptions": lockinPeriodFrequencyTypeOptions == null ? [] : List<dynamic>.from(lockinPeriodFrequencyTypeOptions!.map((x) => x.toJson())),
        "withdrawalFeeTypeOptions": withdrawalFeeTypeOptions == null ? [] : List<dynamic>.from(withdrawalFeeTypeOptions!.map((x) => x.toJson())),
        "paymentTypeOptions": paymentTypeOptions == null ? [] : List<dynamic>.from(paymentTypeOptions!.map((x) => x.toJson())),
        "accountingRuleOptions": accountingRuleOptions == null ? [] : List<dynamic>.from(accountingRuleOptions!.map((x) => x.toJson())),
        "accountingMappingOptions": accountingMappingOptions?.toJson(),
        "chargeOptions": chargeOptions == null ? [] : List<dynamic>.from(chargeOptions!.map((x) => x.toJson())),
        "penaltyOptions": penaltyOptions == null ? [] : List<dynamic>.from(penaltyOptions!.map((x) => x.toJson())),
        "taxGroupOptions": taxGroupOptions == null ? [] : List<dynamic>.from(taxGroupOptions!.map((x) => x.toJson())),
        "isDormancyTrackingActive": isDormancyTrackingActive,
    };
}

class AccountingMappingOptions {
    List<AccountOption>? liabilityAccountOptions;
    List<AccountOption>? expenseAccountOptions;
    List<AccountOption>? assetAccountOptions;
    List<AccountOption>? incomeAccountOptions;
    List<AccountOption>? equityAccountOptions;

    AccountingMappingOptions({
        this.liabilityAccountOptions,
        this.expenseAccountOptions,
        this.assetAccountOptions,
        this.incomeAccountOptions,
        this.equityAccountOptions,
    });

    factory AccountingMappingOptions.fromJson(Map<String, dynamic> json) => AccountingMappingOptions(
        liabilityAccountOptions: json["liabilityAccountOptions"] == null ? [] : List<AccountOption>.from(json["liabilityAccountOptions"]!.map((x) => AccountOption.fromJson(x))),
        expenseAccountOptions: json["expenseAccountOptions"] == null ? [] : List<AccountOption>.from(json["expenseAccountOptions"]!.map((x) => AccountOption.fromJson(x))),
        assetAccountOptions: json["assetAccountOptions"] == null ? [] : List<AccountOption>.from(json["assetAccountOptions"]!.map((x) => AccountOption.fromJson(x))),
        incomeAccountOptions: json["incomeAccountOptions"] == null ? [] : List<AccountOption>.from(json["incomeAccountOptions"]!.map((x) => AccountOption.fromJson(x))),
        equityAccountOptions: json["equityAccountOptions"] == null ? [] : List<AccountOption>.from(json["equityAccountOptions"]!.map((x) => AccountOption.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "liabilityAccountOptions": liabilityAccountOptions == null ? [] : List<dynamic>.from(liabilityAccountOptions!.map((x) => x.toJson())),
        "expenseAccountOptions": expenseAccountOptions == null ? [] : List<dynamic>.from(expenseAccountOptions!.map((x) => x.toJson())),
        "assetAccountOptions": assetAccountOptions == null ? [] : List<dynamic>.from(assetAccountOptions!.map((x) => x.toJson())),
        "incomeAccountOptions": incomeAccountOptions == null ? [] : List<dynamic>.from(incomeAccountOptions!.map((x) => x.toJson())),
        "equityAccountOptions": equityAccountOptions == null ? [] : List<dynamic>.from(equityAccountOptions!.map((x) => x.toJson())),
    };
}

class AccountOption {
    int? id;
    String? name;
    int? parentId;
    String? glCode;
    bool? disabled;
    bool? manualEntriesAllowed;
    AccountingRule? type;
    AccountingRule? usage;
    String? description;
    String? nameDecorated;
    TagId? tagId;

    AccountOption({
        this.id,
        this.name,
        this.parentId,
        this.glCode,
        this.disabled,
        this.manualEntriesAllowed,
        this.type,
        this.usage,
        this.description,
        this.nameDecorated,
        this.tagId,
    });

    factory AccountOption.fromJson(Map<String, dynamic> json) => AccountOption(
        id: json["id"],
        name: json["name"],
        parentId: json["parentId"],
        glCode: json["glCode"],
        disabled: json["disabled"],
        manualEntriesAllowed: json["manualEntriesAllowed"],
        type: json["type"] == null ? null : AccountingRule.fromJson(json["type"]),
        usage: json["usage"] == null ? null : AccountingRule.fromJson(json["usage"]),
        description: json["description"],
        nameDecorated: json["nameDecorated"],
        tagId: json["tagId"] == null ? null : TagId.fromJson(json["tagId"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parentId": parentId,
        "glCode": glCode,
        "disabled": disabled,
        "manualEntriesAllowed": manualEntriesAllowed,
        "type": type?.toJson(),
        "usage": usage?.toJson(),
        "description": description,
        "nameDecorated": nameDecorated,
        "tagId": tagId?.toJson(),
    };
}

class TagId {
    int? id;
    String? name;
    bool? active;
    bool? mandatory;

    TagId({
        this.id,
        this.name,
        this.active,
        this.mandatory,
    });

    factory TagId.fromJson(Map<String, dynamic> json) => TagId(
        id: json["id"],
        name: json["name"] ?? "",
        active: json["active"],
        mandatory: json["mandatory"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
        "mandatory": mandatory,
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

class Option {
    int? id;
    String? name;
    bool? active;
    bool? penalty;
    Currency? currency;
    double? amount;
    AccountingRule? chargeTimeType;
    AccountingRule? chargeAppliesTo;
    AccountingRule? chargeCalculationType;
    AccountingRule? chargePaymentMode;
    TaxGroup? taxGroup;
    List<int>? feeOnMonthDay;
    int? feeInterval;

    Option({
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
        this.taxGroup,
        this.feeOnMonthDay,
        this.feeInterval,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        penalty: json["penalty"],
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        amount: json["amount"],
        chargeTimeType: json["chargeTimeType"] == null ? null : AccountingRule.fromJson(json["chargeTimeType"]),
        chargeAppliesTo: json["chargeAppliesTo"] == null ? null : AccountingRule.fromJson(json["chargeAppliesTo"]),
        chargeCalculationType: json["chargeCalculationType"] == null ? null : AccountingRule.fromJson(json["chargeCalculationType"]),
        chargePaymentMode: json["chargePaymentMode"] == null ? null : AccountingRule.fromJson(json["chargePaymentMode"]),
        taxGroup: json["taxGroup"] == null ? null : TaxGroup.fromJson(json["taxGroup"]),
        feeOnMonthDay: json["feeOnMonthDay"] == null ? [] : List<int>.from(json["feeOnMonthDay"]!.map((x) => x)),
        feeInterval: json["feeInterval"],
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
        "taxGroup": taxGroup?.toJson(),
        "feeOnMonthDay": feeOnMonthDay == null ? [] : List<dynamic>.from(feeOnMonthDay!.map((x) => x)),
        "feeInterval": feeInterval,
    };
}

class Currency {
    String? code;
    String? name;
    int? decimalPlaces;
    String? displaySymbol;
    String? nameCode;
    String? displayLabel;
    int? inMultiplesOf;

    Currency({
        this.code,
        this.name,
        this.decimalPlaces,
        this.displaySymbol,
        this.nameCode,
        this.displayLabel,
        this.inMultiplesOf,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        decimalPlaces: json["decimalPlaces"],
        displaySymbol: json["displaySymbol"],
        nameCode: json["nameCode"],
        displayLabel: json["displayLabel"],
        inMultiplesOf: json["inMultiplesOf"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "decimalPlaces": decimalPlaces,
        "displaySymbol": displaySymbol,
        "nameCode": nameCode,
        "displayLabel": displayLabel,
        "inMultiplesOf": inMultiplesOf,
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

class PaymentTypeOption {
    int? id;
    String? name;
    String? description;
    bool? isCashPayment;
    int? position;

    PaymentTypeOption({
        this.id,
        this.name,
        this.description,
        this.isCashPayment,
        this.position,
    });

    factory PaymentTypeOption.fromJson(Map<String, dynamic> json) => PaymentTypeOption(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        isCashPayment: json["isCashPayment"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "isCashPayment": isCashPayment,
        "position": position,
    };
}

