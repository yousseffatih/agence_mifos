
import 'dart:convert';

LoanList loanListFromJson(String str) => LoanList.fromJson(json.decode(str));

String loanListToJson(LoanList data) => json.encode(data.toJson());

class LoanList {
    int? clientId;
    String? clientAccountNo;
    String? clientName;
    int? clientOfficeId;
    int? loanProductId;
    String? loanProductName;
    bool? isLoanProductLinkedToFloatingRate;
    Currency? currency;
    double? principal;
    double? approvedPrincipal;
    double? proposedPrincipal;
    int? termFrequency;
    AmortizationType? termPeriodFrequencyType;
    int? numberOfRepayments;
    int? repaymentEvery;
    AmortizationType? repaymentFrequencyType;
    double? interestRatePerPeriod;
    AmortizationType? interestRateFrequencyType;
    double? annualInterestRate;
    bool? isFloatingInterestRate;
    AmortizationType? amortizationType;
    AmortizationType? interestType;
    AmortizationType? interestCalculationPeriodType;
    bool? allowPartialPeriodInterestCalcualtion;
    int? transactionProcessingStrategyId;
    LoanListTimeline? timeline;
    List<dynamic>? charges;
    List<ProductOption>? productOptions;
    List<LoanOfficerOption>? loanOfficerOptions;
    List<LoanOption>? loanPurposeOptions;
    List<FundOption>? fundOptions;
    List<AmortizationType>? termFrequencyTypeOptions;
    List<AmortizationType>? repaymentFrequencyTypeOptions;
    List<AmortizationType>? repaymentFrequencyNthDayTypeOptions;
    List<AmortizationType>? repaymentFrequencyDaysOfWeekTypeOptions;
    List<AmortizationType>? interestRateFrequencyTypeOptions;
    List<AmortizationType>? amortizationTypeOptions;
    List<AmortizationType>? interestTypeOptions;
    List<AmortizationType>? interestCalculationPeriodTypeOptions;
    List<TransactionProcessingStrategyOption>? transactionProcessingStrategyOptions;
    List<ChargeOptions>? chargeOptions;
    List<LoanOption>? loanCollateralOptions;
    List<AccountLinkingOption>? accountLinkingOptions;
    bool? multiDisburseLoan;
    bool? canDefineInstallmentAmount;
    bool? canDisburse;
    List<ClientActiveLoanOption>? clientActiveLoanOptions;
    bool? canUseForTopup;
    bool? isTopup;
    Product? product;
    List<dynamic>? overdueCharges;
    AmortizationType? daysInMonthType;
    AmortizationType? daysInYearType;
    bool? isInterestRecalculationEnabled;
    InterestRecalculationData? interestRecalculationData;
    bool? isVariableInstallmentsAllowed;
    int? minimumGap;
    int? maximumGap;
    bool? isEqualAmortization;
    bool? isRatesEnabled;

    LoanList({
        this.clientId,
        this.clientAccountNo,
        this.clientName,
        this.clientOfficeId,
        this.loanProductId,
        this.loanProductName,
        this.isLoanProductLinkedToFloatingRate,
        this.currency,
        this.principal,
        this.approvedPrincipal,
        this.proposedPrincipal,
        this.termFrequency,
        this.termPeriodFrequencyType,
        this.numberOfRepayments,
        this.repaymentEvery,
        this.repaymentFrequencyType,
        this.interestRatePerPeriod,
        this.interestRateFrequencyType,
        this.annualInterestRate,
        this.isFloatingInterestRate,
        this.amortizationType,
        this.interestType,
        this.interestCalculationPeriodType,
        this.allowPartialPeriodInterestCalcualtion,
        this.transactionProcessingStrategyId,
        this.timeline,
        this.charges,
        this.productOptions,
        this.loanOfficerOptions,
        this.loanPurposeOptions,
        this.fundOptions,
        this.termFrequencyTypeOptions,
        this.repaymentFrequencyTypeOptions,
        this.repaymentFrequencyNthDayTypeOptions,
        this.repaymentFrequencyDaysOfWeekTypeOptions,
        this.interestRateFrequencyTypeOptions,
        this.amortizationTypeOptions,
        this.interestTypeOptions,
        this.interestCalculationPeriodTypeOptions,
        this.transactionProcessingStrategyOptions,
        this.chargeOptions,
        this.loanCollateralOptions,
        this.accountLinkingOptions,
        this.multiDisburseLoan,
        this.canDefineInstallmentAmount,
        this.canDisburse,
        this.clientActiveLoanOptions,
        this.canUseForTopup,
        this.isTopup,
        this.product,
        this.overdueCharges,
        this.daysInMonthType,
        this.daysInYearType,
        this.isInterestRecalculationEnabled,
        this.interestRecalculationData,
        this.isVariableInstallmentsAllowed,
        this.minimumGap,
        this.maximumGap,
        this.isEqualAmortization,
        this.isRatesEnabled,
    });

    factory LoanList.fromJson(Map<String, dynamic> json) => LoanList(
        clientId: json["clientId"],
        clientAccountNo: json["clientAccountNo"],
        clientName: json["clientName"],
        clientOfficeId: json["clientOfficeId"],
        loanProductId: json["loanProductId"],
        loanProductName: json["loanProductName"],
        isLoanProductLinkedToFloatingRate: json["isLoanProductLinkedToFloatingRate"],
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        principal: json["principal"],
        approvedPrincipal: json["approvedPrincipal"],
        proposedPrincipal: json["proposedPrincipal"],
        termFrequency: json["termFrequency"],
        termPeriodFrequencyType: json["termPeriodFrequencyType"] == null ? null : AmortizationType.fromJson(json["termPeriodFrequencyType"]),
        numberOfRepayments: json["numberOfRepayments"],
        repaymentEvery: json["repaymentEvery"], 
        repaymentFrequencyType: json["repaymentFrequencyType"] == null ? null : AmortizationType.fromJson(json["repaymentFrequencyType"]),
        interestRatePerPeriod: json["interestRatePerPeriod"],
        interestRateFrequencyType: json["interestRateFrequencyType"] == null ? null : AmortizationType.fromJson(json["interestRateFrequencyType"]),
        annualInterestRate: json["annualInterestRate"],
        isFloatingInterestRate: json["isFloatingInterestRate"],
        amortizationType: json["amortizationType"] == null ? null : AmortizationType.fromJson(json["amortizationType"]),
        interestType: json["interestType"] == null ? null : AmortizationType.fromJson(json["interestType"]),
        interestCalculationPeriodType: json["interestCalculationPeriodType"] == null ? null : AmortizationType.fromJson(json["interestCalculationPeriodType"]),
        allowPartialPeriodInterestCalcualtion: json["allowPartialPeriodInterestCalcualtion"],
        transactionProcessingStrategyId: json["transactionProcessingStrategyId"],
        timeline: json["timeline"] == null ? null : LoanListTimeline.fromJson(json["timeline"]),
        charges: json["charges"] == null ? [] : List<dynamic>.from(json["charges"]!.map((x) => x)),
        productOptions: json["productOptions"] == null ? [] : List<ProductOption>.from(json["productOptions"]!.map((x) => ProductOption.fromJson(x))),
        loanOfficerOptions: json["loanOfficerOptions"] == null ? [] : List<LoanOfficerOption>.from(json["loanOfficerOptions"]!.map((x) => LoanOfficerOption.fromJson(x))),
        loanPurposeOptions: json["loanPurposeOptions"] == null ? [] : List<LoanOption>.from(json["loanPurposeOptions"]!.map((x) => LoanOption.fromJson(x))),
        fundOptions: json["fundOptions"] == null ? [] : List<FundOption>.from(json["fundOptions"]!.map((x) => FundOption.fromJson(x))),
        termFrequencyTypeOptions: json["termFrequencyTypeOptions"] == null ? [] : List<AmortizationType>.from(json["termFrequencyTypeOptions"]!.map((x) => AmortizationType.fromJson(x))),
        repaymentFrequencyTypeOptions: json["repaymentFrequencyTypeOptions"] == null ? [] : List<AmortizationType>.from(json["repaymentFrequencyTypeOptions"]!.map((x) => AmortizationType.fromJson(x))),
        repaymentFrequencyNthDayTypeOptions: json["repaymentFrequencyNthDayTypeOptions"] == null ? [] : List<AmortizationType>.from(json["repaymentFrequencyNthDayTypeOptions"]!.map((x) => AmortizationType.fromJson(x))),
        repaymentFrequencyDaysOfWeekTypeOptions: json["repaymentFrequencyDaysOfWeekTypeOptions"] == null ? [] : List<AmortizationType>.from(json["repaymentFrequencyDaysOfWeekTypeOptions"]!.map((x) => AmortizationType.fromJson(x))),
        interestRateFrequencyTypeOptions: json["interestRateFrequencyTypeOptions"] == null ? [] : List<AmortizationType>.from(json["interestRateFrequencyTypeOptions"]!.map((x) => AmortizationType.fromJson(x))),
        amortizationTypeOptions: json["amortizationTypeOptions"] == null ? [] : List<AmortizationType>.from(json["amortizationTypeOptions"]!.map((x) => AmortizationType.fromJson(x))),
        interestTypeOptions: json["interestTypeOptions"] == null ? [] : List<AmortizationType>.from(json["interestTypeOptions"]!.map((x) => AmortizationType.fromJson(x))),
        interestCalculationPeriodTypeOptions: json["interestCalculationPeriodTypeOptions"] == null ? [] : List<AmortizationType>.from(json["interestCalculationPeriodTypeOptions"]!.map((x) => AmortizationType.fromJson(x))),
        transactionProcessingStrategyOptions: json["transactionProcessingStrategyOptions"] == null ? [] : List<TransactionProcessingStrategyOption>.from(json["transactionProcessingStrategyOptions"]!.map((x) => TransactionProcessingStrategyOption.fromJson(x))),
        chargeOptions: json["chargeOptions"] == null ? [] : List<ChargeOptions>.from(json["chargeOptions"]!.map((x) => ChargeOptions.fromJson(x))),//
        loanCollateralOptions: json["loanCollateralOptions"] == null ? [] : List<LoanOption>.from(json["loanCollateralOptions"]!.map((x) => LoanOption.fromJson(x))),
        accountLinkingOptions: json["accountLinkingOptions"] == null ? [] : List<AccountLinkingOption>.from(json["accountLinkingOptions"]!.map((x) => AccountLinkingOption.fromJson(x))),
        multiDisburseLoan: json["multiDisburseLoan"],
        canDefineInstallmentAmount: json["canDefineInstallmentAmount"],
        canDisburse: json["canDisburse"],
        clientActiveLoanOptions: json["clientActiveLoanOptions"] == null ? [] : List<ClientActiveLoanOption>.from(json["clientActiveLoanOptions"]!.map((x) => ClientActiveLoanOption.fromJson(x))),
        canUseForTopup: json["canUseForTopup"],//
        isTopup: json["isTopup"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        overdueCharges: json["overdueCharges"] == null ? [] : List<dynamic>.from(json["overdueCharges"]!.map((x) => x)),
        daysInMonthType: json["daysInMonthType"] == null ? null : AmortizationType.fromJson(json["daysInMonthType"]),
        daysInYearType: json["daysInYearType"] == null ? null : AmortizationType.fromJson(json["daysInYearType"]),
        isInterestRecalculationEnabled: json["isInterestRecalculationEnabled"],
        interestRecalculationData: json["interestRecalculationData"] == null ? null : InterestRecalculationData.fromJson(json["interestRecalculationData"]),
        isVariableInstallmentsAllowed: json["isVariableInstallmentsAllowed"],
        minimumGap: json["minimumGap"],
        maximumGap: json["maximumGap"],
        isEqualAmortization: json["isEqualAmortization"],
        isRatesEnabled: json["isRatesEnabled"],
    );

    Map<String, dynamic> toJson() => {
        "clientId": clientId,
        "clientAccountNo": clientAccountNo,
        "clientName": clientName,
        "clientOfficeId": clientOfficeId,
        "loanProductId": loanProductId,
        "loanProductName": loanProductName,
        "isLoanProductLinkedToFloatingRate": isLoanProductLinkedToFloatingRate,
        "currency": currency?.toJson(),
        "principal": principal,
        "approvedPrincipal": approvedPrincipal,
        "proposedPrincipal": proposedPrincipal,
        "termFrequency": termFrequency,
        "termPeriodFrequencyType": termPeriodFrequencyType?.toJson(),
        "numberOfRepayments": numberOfRepayments,
        "repaymentEvery": repaymentEvery,
        "repaymentFrequencyType": repaymentFrequencyType?.toJson(),
        "interestRatePerPeriod": interestRatePerPeriod,
        "interestRateFrequencyType": interestRateFrequencyType?.toJson(),
        "annualInterestRate": annualInterestRate,
        "isFloatingInterestRate": isFloatingInterestRate,
        "amortizationType": amortizationType?.toJson(),
        "interestType": interestType?.toJson(),
        "interestCalculationPeriodType": interestCalculationPeriodType?.toJson(),
        "allowPartialPeriodInterestCalcualtion": allowPartialPeriodInterestCalcualtion,
        "transactionProcessingStrategyId": transactionProcessingStrategyId,
        "timeline": timeline?.toJson(),
        "charges": charges == null ? [] : List<dynamic>.from(charges!.map((x) => x)),
        "productOptions": productOptions == null ? [] : List<dynamic>.from(productOptions!.map((x) => x.toJson())),
        "loanOfficerOptions": loanOfficerOptions == null ? [] : List<dynamic>.from(loanOfficerOptions!.map((x) => x.toJson())),
        "loanPurposeOptions": loanPurposeOptions == null ? [] : List<dynamic>.from(loanPurposeOptions!.map((x) => x.toJson())),
        "fundOptions": fundOptions == null ? [] : List<dynamic>.from(fundOptions!.map((x) => x.toJson())),
        "termFrequencyTypeOptions": termFrequencyTypeOptions == null ? [] : List<dynamic>.from(termFrequencyTypeOptions!.map((x) => x.toJson())),
        "repaymentFrequencyTypeOptions": repaymentFrequencyTypeOptions == null ? [] : List<dynamic>.from(repaymentFrequencyTypeOptions!.map((x) => x.toJson())),
        "repaymentFrequencyNthDayTypeOptions": repaymentFrequencyNthDayTypeOptions == null ? [] : List<dynamic>.from(repaymentFrequencyNthDayTypeOptions!.map((x) => x.toJson())),
        "repaymentFrequencyDaysOfWeekTypeOptions": repaymentFrequencyDaysOfWeekTypeOptions == null ? [] : List<dynamic>.from(repaymentFrequencyDaysOfWeekTypeOptions!.map((x) => x.toJson())),
        "interestRateFrequencyTypeOptions": interestRateFrequencyTypeOptions == null ? [] : List<dynamic>.from(interestRateFrequencyTypeOptions!.map((x) => x.toJson())),
        "amortizationTypeOptions": amortizationTypeOptions == null ? [] : List<dynamic>.from(amortizationTypeOptions!.map((x) => x.toJson())),
        "interestTypeOptions": interestTypeOptions == null ? [] : List<dynamic>.from(interestTypeOptions!.map((x) => x.toJson())),
        "interestCalculationPeriodTypeOptions": interestCalculationPeriodTypeOptions == null ? [] : List<dynamic>.from(interestCalculationPeriodTypeOptions!.map((x) => x.toJson())),
        "transactionProcessingStrategyOptions": transactionProcessingStrategyOptions == null ? [] : List<dynamic>.from(transactionProcessingStrategyOptions!.map((x) => x.toJson())),
        "chargeOptions": chargeOptions == null ? [] : List<dynamic>.from(chargeOptions!.map((x) => x.toJson())),
        "loanCollateralOptions": loanCollateralOptions == null ? [] : List<dynamic>.from(loanCollateralOptions!.map((x) => x.toJson())),
        "accountLinkingOptions": accountLinkingOptions == null ? [] : List<dynamic>.from(accountLinkingOptions!.map((x) => x.toJson())),
        "multiDisburseLoan": multiDisburseLoan,
        "canDefineInstallmentAmount": canDefineInstallmentAmount,
        "canDisburse": canDisburse,
        "clientActiveLoanOptions": clientActiveLoanOptions == null ? [] : List<dynamic>.from(clientActiveLoanOptions!.map((x) => x.toJson())),
        "canUseForTopup": canUseForTopup,
        "isTopup": isTopup,
        "product": product?.toJson(),
        "overdueCharges": overdueCharges == null ? [] : List<dynamic>.from(overdueCharges!.map((x) => x)),
        "daysInMonthType": daysInMonthType?.toJson(),
        "daysInYearType": daysInYearType?.toJson(),
        "isInterestRecalculationEnabled": isInterestRecalculationEnabled,
        "interestRecalculationData": interestRecalculationData?.toJson(),
        "isVariableInstallmentsAllowed": isVariableInstallmentsAllowed,
        "minimumGap": minimumGap,
        "maximumGap": maximumGap,
        "isEqualAmortization": isEqualAmortization,
        "isRatesEnabled": isRatesEnabled,
    };
}

class AccountLinkingOption {
    int? id;
    String? accountNo;
    int? clientId;
    String? clientName;
    int? productId;
    String? productName;
    int? fieldOfficerId;
    Currency? currency;

    AccountLinkingOption({
        this.id,
        this.accountNo,
        this.clientId,
        this.clientName,
        this.productId,
        this.productName,
        this.fieldOfficerId,
        this.currency,
    });

    factory AccountLinkingOption.fromJson(Map<String, dynamic> json) => AccountLinkingOption(
        id: json["id"],
        accountNo: json["accountNo"],
        clientId: json["clientId"],
        clientName: json["clientName"],
        productId: json["productId"],
        productName: json["productName"],
        fieldOfficerId: json["fieldOfficerId"],
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "clientId": clientId,
        "clientName": clientName,
        "productId": productId,
        "productName": productName,
        "fieldOfficerId": fieldOfficerId,
        "currency": currency?.toJson(),
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

class AmortizationType {
    int? id;
    String? code;
    String? value;

    AmortizationType({
        this.id,
        this.code,
        this.value,
    });

    factory AmortizationType.fromJson(Map<String, dynamic> json) => AmortizationType(
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

class ChargeOptions {
    int? id;
    String? name;
    bool? active;
    bool? penalty;
    Currency? currency;
    double? amount;
    AmortizationType? chargeTimeType;
    AmortizationType? chargeAppliesTo;
    AmortizationType? chargeCalculationType;
    AmortizationType? chargePaymentMode;
    TaxGroup? taxGroup;

    ChargeOptions({
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
    });

    factory ChargeOptions.fromJson(Map<String, dynamic> json) => ChargeOptions(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        penalty: json["penalty"],
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        amount: json["amount"],
        chargeTimeType: json["chargeTimeType"] == null ? null : AmortizationType.fromJson(json["chargeTimeType"]),
        chargeAppliesTo: json["chargeAppliesTo"] == null ? null : AmortizationType.fromJson(json["chargeAppliesTo"]),
        chargeCalculationType: json["chargeCalculationType"] == null ? null : AmortizationType.fromJson(json["chargeCalculationType"]),
        chargePaymentMode: json["chargePaymentMode"] == null ? null : AmortizationType.fromJson(json["chargePaymentMode"]),
        taxGroup: json["taxGroup"] == null ? null : TaxGroup.fromJson(json["taxGroup"]),
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

class ClientActiveLoanOption {
    int? id;
    String? accountNo;
    int? productId;
    String? productName;
    String? shortProductName;
    Status? status;
    AmortizationType? loanType;
    int? loanCycle;
    ClientActiveLoanOptionTimeline? timeline;
    bool? inArrears;
    double? originalLoan;
    double? loanBalance;

    ClientActiveLoanOption({
        this.id,
        this.accountNo,
        this.productId,
        this.productName,
        this.shortProductName,
        this.status,
        this.loanType,
        this.loanCycle,
        this.timeline,
        this.inArrears,
        this.originalLoan,
        this.loanBalance,
    });

    factory ClientActiveLoanOption.fromJson(Map<String, dynamic> json) => ClientActiveLoanOption(
        id: json["id"],
        accountNo: json["accountNo"],
        productId: json["productId"],
        productName: json["productName"],
        shortProductName: json["shortProductName"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        loanType: json["loanType"] == null ? null : AmortizationType.fromJson(json["loanType"]),
        loanCycle: json["loanCycle"],
        timeline: json["timeline"] == null ? null : ClientActiveLoanOptionTimeline.fromJson(json["timeline"]),
        inArrears: json["inArrears"],
        originalLoan: json["originalLoan"],
        loanBalance: json["loanBalance"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "productId": productId,
        "productName": productName,
        "shortProductName": shortProductName,
        "status": status?.toJson(),
        "loanType": loanType?.toJson(),
        "loanCycle": loanCycle,
        "timeline": timeline?.toJson(),
        "inArrears": inArrears,
        "originalLoan": originalLoan,
        "loanBalance": loanBalance,
    };
}

class Status {
    int? id;
    String? code;
    String? value;
    bool? pendingApproval;
    bool? waitingForDisbursal;
    bool? active;
    bool? closedObligationsMet;
    bool? closedWrittenOff;
    bool? closedRescheduled;
    bool? closed;
    bool? overpaid;

    Status({
        this.id,
        this.code,
        this.value,
        this.pendingApproval,
        this.waitingForDisbursal,
        this.active,
        this.closedObligationsMet,
        this.closedWrittenOff,
        this.closedRescheduled,
        this.closed,
        this.overpaid,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        code: json["code"],
        value: json["value"],
        pendingApproval: json["pendingApproval"],
        waitingForDisbursal: json["waitingForDisbursal"],
        active: json["active"],
        closedObligationsMet: json["closedObligationsMet"],
        closedWrittenOff: json["closedWrittenOff"],
        closedRescheduled: json["closedRescheduled"],
        closed: json["closed"],
        overpaid: json["overpaid"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
        "pendingApproval": pendingApproval,
        "waitingForDisbursal": waitingForDisbursal,
        "active": active,
        "closedObligationsMet": closedObligationsMet,
        "closedWrittenOff": closedWrittenOff,
        "closedRescheduled": closedRescheduled,
        "closed": closed,
        "overpaid": overpaid,
    };
}

class ClientActiveLoanOptionTimeline {
    List<int>? submittedOnDate;
    String? submittedByUsername;
    String? submittedByFirstname;
    String? submittedByLastname;
    List<int>? approvedOnDate;
    String? approvedByUsername;
    String? approvedByFirstname;
    String? approvedByLastname;
    List<int>? expectedDisbursementDate;
    List<int>? actualDisbursementDate;
    String? disbursedByUsername;
    String? disbursedByFirstname;
    String? disbursedByLastname;
    List<int>? expectedMaturityDate;

    ClientActiveLoanOptionTimeline({
        this.submittedOnDate,
        this.submittedByUsername,
        this.submittedByFirstname,
        this.submittedByLastname,
        this.approvedOnDate,
        this.approvedByUsername,
        this.approvedByFirstname,
        this.approvedByLastname,
        this.expectedDisbursementDate,
        this.actualDisbursementDate,
        this.disbursedByUsername,
        this.disbursedByFirstname,
        this.disbursedByLastname,
        this.expectedMaturityDate,
    });

    factory ClientActiveLoanOptionTimeline.fromJson(Map<String, dynamic> json) => ClientActiveLoanOptionTimeline(
        submittedOnDate: json["submittedOnDate"] == null ? [] : List<int>.from(json["submittedOnDate"]!.map((x) => x)),
        submittedByUsername: json["submittedByUsername"],
        submittedByFirstname: json["submittedByFirstname"],
        submittedByLastname: json["submittedByLastname"],
        approvedOnDate: json["approvedOnDate"] == null ? [] : List<int>.from(json["approvedOnDate"]!.map((x) => x)),
        approvedByUsername: json["approvedByUsername"],
        approvedByFirstname: json["approvedByFirstname"],
        approvedByLastname: json["approvedByLastname"],
        expectedDisbursementDate: json["expectedDisbursementDate"] == null ? [] : List<int>.from(json["expectedDisbursementDate"]!.map((x) => x)),
        actualDisbursementDate: json["actualDisbursementDate"] == null ? [] : List<int>.from(json["actualDisbursementDate"]!.map((x) => x)),
        disbursedByUsername: json["disbursedByUsername"],
        disbursedByFirstname: json["disbursedByFirstname"],
        disbursedByLastname: json["disbursedByLastname"],
        expectedMaturityDate: json["expectedMaturityDate"] == null ? [] : List<int>.from(json["expectedMaturityDate"]!.map((x) => x)),
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
        "expectedDisbursementDate": expectedDisbursementDate == null ? [] : List<dynamic>.from(expectedDisbursementDate!.map((x) => x)),
        "actualDisbursementDate": actualDisbursementDate == null ? [] : List<dynamic>.from(actualDisbursementDate!.map((x) => x)),
        "disbursedByUsername": disbursedByUsername,
        "disbursedByFirstname": disbursedByFirstname,
        "disbursedByLastname": disbursedByLastname,
        "expectedMaturityDate": expectedMaturityDate == null ? [] : List<dynamic>.from(expectedMaturityDate!.map((x) => x)),
    };
}

class FundOption {
    int? id;
    String? name;
    String? externalId;

    FundOption({
        this.id,
        this.name,
        this.externalId,
    });

    factory FundOption.fromJson(Map<String, dynamic> json) => FundOption(
        id: json["id"],
        name: json["name"],
        externalId: json["externalId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "externalId": externalId,
    };
}

class InterestRecalculationData {
    InterestRecalculationData();

    factory InterestRecalculationData.fromJson(Map<String, dynamic> json) => InterestRecalculationData(
    );

    Map<String, dynamic> toJson() => {
    };
}

class LoanOption {
    int? id;
    String? name;
    int? position;
    String? description;
    bool? active;
    bool? mandatory;

    LoanOption({
        this.id,
        this.name,
        this.position,
        this.description,
        this.active,
        this.mandatory,
    });

    factory LoanOption.fromJson(Map<String, dynamic> json) => LoanOption(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        description: json["description"],
        active: json["active"],
        mandatory: json["mandatory"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "description": description,
        "active": active,
        "mandatory": mandatory,
    };
}

class LoanOfficerOption {
    int? id;
    String? firstname;
    String? lastname;
    String? displayName;
    int? officeId;
    String? officeName;
    bool? isLoanOfficer;
    bool? isActive;
    List<int>? joiningDate;
    String? mobileNo;

    LoanOfficerOption({
        this.id,
        this.firstname,
        this.lastname,
        this.displayName,
        this.officeId,
        this.officeName,
        this.isLoanOfficer,
        this.isActive,
        this.joiningDate,
        this.mobileNo,
    });

    factory LoanOfficerOption.fromJson(Map<String, dynamic> json) => LoanOfficerOption(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        displayName: json["displayName"],
        officeId: json["officeId"],
        officeName: json["officeName"],
        isLoanOfficer: json["isLoanOfficer"],
        isActive: json["isActive"],
        joiningDate: json["joiningDate"] == null ? [] : List<int>.from(json["joiningDate"]!.map((x) => x)),
        mobileNo: json["mobileNo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "displayName": displayName,
        "officeId": officeId,
        "officeName": officeName,
        "isLoanOfficer": isLoanOfficer,
        "isActive": isActive,
        "joiningDate": joiningDate == null ? [] : List<dynamic>.from(joiningDate!.map((x) => x)),
        "mobileNo": mobileNo,
    };
}

class Product {
    int? id;
    String? name;
    String? shortName;
    bool? includeInBorrowerCycle;
    bool? useBorrowerCycle;
    String? status;
    Currency? currency;
    double? principal;
    int? numberOfRepayments;
    int? repaymentEvery;
    AmortizationType? repaymentFrequencyType;
    double? interestRatePerPeriod;
    AmortizationType? interestRateFrequencyType;
    double? annualInterestRate;
    bool? isLinkedToFloatingInterestRates;
    bool? isFloatingInterestRateCalculationAllowed;
    bool? allowVariableInstallments;
    int? minimumGap;
    int? maximumGap;
    AmortizationType? amortizationType;
    AmortizationType? interestType;
    AmortizationType? interestCalculationPeriodType;
    bool? allowPartialPeriodInterestCalcualtion;
    int? transactionProcessingStrategyId;
    String? transactionProcessingStrategyName;
    AmortizationType? daysInMonthType;
    AmortizationType? daysInYearType;
    bool? isInterestRecalculationEnabled;
    bool? canDefineInstallmentAmount;
    int? installmentAmountInMultiplesOf;
    List<dynamic>? charges;
    List<dynamic>? principalVariationsForBorrowerCycle;
    List<dynamic>? interestRateVariationsForBorrowerCycle;
    List<dynamic>? numberOfRepaymentVariationsForBorrowerCycle;
    AmortizationType? accountingRule;
    bool? canUseForTopup;
    bool? isRatesEnabled;
    List<dynamic>? rates;
    bool? multiDisburseLoan;
    int? maxTrancheCount;
    double? principalThresholdForLastInstallment;
    bool? holdGuaranteeFunds;
    bool? accountMovesOutOfNpaOnlyOnArrearsCompletion;
    AllowAttributeOverrides? allowAttributeOverrides;
    bool? syncExpectedWithDisbursementDate;
    bool? isEqualAmortization;

    Product({
        this.id,
        this.name,
        this.shortName,
        this.includeInBorrowerCycle,
        this.useBorrowerCycle,
        this.status,
        this.currency,
        this.principal,
        this.numberOfRepayments,
        this.repaymentEvery,
        this.repaymentFrequencyType,
        this.interestRatePerPeriod,
        this.interestRateFrequencyType,
        this.annualInterestRate,
        this.isLinkedToFloatingInterestRates,
        this.isFloatingInterestRateCalculationAllowed,
        this.allowVariableInstallments,
        this.minimumGap,
        this.maximumGap,
        this.amortizationType,
        this.interestType,
        this.interestCalculationPeriodType,
        this.allowPartialPeriodInterestCalcualtion,
        this.transactionProcessingStrategyId,
        this.transactionProcessingStrategyName,
        this.daysInMonthType,
        this.daysInYearType,
        this.isInterestRecalculationEnabled,
        this.canDefineInstallmentAmount,
        this.installmentAmountInMultiplesOf,
        this.charges,
        this.principalVariationsForBorrowerCycle,
        this.interestRateVariationsForBorrowerCycle,
        this.numberOfRepaymentVariationsForBorrowerCycle,
        this.accountingRule,
        this.canUseForTopup,
        this.isRatesEnabled,
        this.rates,
        this.multiDisburseLoan,
        this.maxTrancheCount,
        this.principalThresholdForLastInstallment,
        this.holdGuaranteeFunds,
        this.accountMovesOutOfNpaOnlyOnArrearsCompletion,
        this.allowAttributeOverrides,
        this.syncExpectedWithDisbursementDate,
        this.isEqualAmortization,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        shortName: json["shortName"],
        includeInBorrowerCycle: json["includeInBorrowerCycle"],
        useBorrowerCycle: json["useBorrowerCycle"],
        status: json["status"],
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        principal: json["principal"],
        numberOfRepayments: json["numberOfRepayments"],
        repaymentEvery: json["repaymentEvery"],
        repaymentFrequencyType: json["repaymentFrequencyType"] == null ? null : AmortizationType.fromJson(json["repaymentFrequencyType"]),
        interestRatePerPeriod: json["interestRatePerPeriod"],
        interestRateFrequencyType: json["interestRateFrequencyType"] == null ? null : AmortizationType.fromJson(json["interestRateFrequencyType"]),
        annualInterestRate: json["annualInterestRate"],
        isLinkedToFloatingInterestRates: json["isLinkedToFloatingInterestRates"],
        isFloatingInterestRateCalculationAllowed: json["isFloatingInterestRateCalculationAllowed"],
        allowVariableInstallments: json["allowVariableInstallments"],
        minimumGap: json["minimumGap"],
        maximumGap: json["maximumGap"],
        amortizationType: json["amortizationType"] == null ? null : AmortizationType.fromJson(json["amortizationType"]),
        interestType: json["interestType"] == null ? null : AmortizationType.fromJson(json["interestType"]),
        interestCalculationPeriodType: json["interestCalculationPeriodType"] == null ? null : AmortizationType.fromJson(json["interestCalculationPeriodType"]),
        allowPartialPeriodInterestCalcualtion: json["allowPartialPeriodInterestCalcualtion"],
        transactionProcessingStrategyId: json["transactionProcessingStrategyId"],
        transactionProcessingStrategyName: json["transactionProcessingStrategyName"],
        daysInMonthType: json["daysInMonthType"] == null ? null : AmortizationType.fromJson(json["daysInMonthType"]),
        daysInYearType: json["daysInYearType"] == null ? null : AmortizationType.fromJson(json["daysInYearType"]),
        isInterestRecalculationEnabled: json["isInterestRecalculationEnabled"],
        canDefineInstallmentAmount: json["canDefineInstallmentAmount"],
        installmentAmountInMultiplesOf: json["installmentAmountInMultiplesOf"],
        charges: json["charges"] == null ? [] : List<dynamic>.from(json["charges"]!.map((x) => x)),
        principalVariationsForBorrowerCycle: json["principalVariationsForBorrowerCycle"] == null ? [] : List<dynamic>.from(json["principalVariationsForBorrowerCycle"]!.map((x) => x)),
        interestRateVariationsForBorrowerCycle: json["interestRateVariationsForBorrowerCycle"] == null ? [] : List<dynamic>.from(json["interestRateVariationsForBorrowerCycle"]!.map((x) => x)),
        numberOfRepaymentVariationsForBorrowerCycle: json["numberOfRepaymentVariationsForBorrowerCycle"] == null ? [] : List<dynamic>.from(json["numberOfRepaymentVariationsForBorrowerCycle"]!.map((x) => x)),
        accountingRule: json["accountingRule"] == null ? null : AmortizationType.fromJson(json["accountingRule"]),
        canUseForTopup: json["canUseForTopup"],
        isRatesEnabled: json["isRatesEnabled"],
        rates: json["rates"] == null ? [] : List<dynamic>.from(json["rates"]!.map((x) => x)),
        multiDisburseLoan: json["multiDisburseLoan"],
        maxTrancheCount: json["maxTrancheCount"],
        principalThresholdForLastInstallment: json["principalThresholdForLastInstallment"],
        holdGuaranteeFunds: json["holdGuaranteeFunds"],
        accountMovesOutOfNpaOnlyOnArrearsCompletion: json["accountMovesOutOfNPAOnlyOnArrearsCompletion"],
        allowAttributeOverrides: json["allowAttributeOverrides"] == null ? null : AllowAttributeOverrides.fromJson(json["allowAttributeOverrides"]),
        syncExpectedWithDisbursementDate: json["syncExpectedWithDisbursementDate"],
        isEqualAmortization: json["isEqualAmortization"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortName": shortName,
        "includeInBorrowerCycle": includeInBorrowerCycle,
        "useBorrowerCycle": useBorrowerCycle,
        "status": status,
        "currency": currency?.toJson(),
        "principal": principal,
        "numberOfRepayments": numberOfRepayments,
        "repaymentEvery": repaymentEvery,
        "repaymentFrequencyType": repaymentFrequencyType?.toJson(),
        "interestRatePerPeriod": interestRatePerPeriod,
        "interestRateFrequencyType": interestRateFrequencyType?.toJson(),
        "annualInterestRate": annualInterestRate,
        "isLinkedToFloatingInterestRates": isLinkedToFloatingInterestRates,
        "isFloatingInterestRateCalculationAllowed": isFloatingInterestRateCalculationAllowed,
        "allowVariableInstallments": allowVariableInstallments,
        "minimumGap": minimumGap,
        "maximumGap": maximumGap,
        "amortizationType": amortizationType?.toJson(),
        "interestType": interestType?.toJson(),
        "interestCalculationPeriodType": interestCalculationPeriodType?.toJson(),
        "allowPartialPeriodInterestCalcualtion": allowPartialPeriodInterestCalcualtion,
        "transactionProcessingStrategyId": transactionProcessingStrategyId,
        "transactionProcessingStrategyName": transactionProcessingStrategyName,
        "daysInMonthType": daysInMonthType?.toJson(),
        "daysInYearType": daysInYearType?.toJson(),
        "isInterestRecalculationEnabled": isInterestRecalculationEnabled,
        "canDefineInstallmentAmount": canDefineInstallmentAmount,
        "installmentAmountInMultiplesOf": installmentAmountInMultiplesOf,
        "charges": charges == null ? [] : List<dynamic>.from(charges!.map((x) => x)),
        "principalVariationsForBorrowerCycle": principalVariationsForBorrowerCycle == null ? [] : List<dynamic>.from(principalVariationsForBorrowerCycle!.map((x) => x)),
        "interestRateVariationsForBorrowerCycle": interestRateVariationsForBorrowerCycle == null ? [] : List<dynamic>.from(interestRateVariationsForBorrowerCycle!.map((x) => x)),
        "numberOfRepaymentVariationsForBorrowerCycle": numberOfRepaymentVariationsForBorrowerCycle == null ? [] : List<dynamic>.from(numberOfRepaymentVariationsForBorrowerCycle!.map((x) => x)),
        "accountingRule": accountingRule?.toJson(),
        "canUseForTopup": canUseForTopup,
        "isRatesEnabled": isRatesEnabled,
        "rates": rates == null ? [] : List<dynamic>.from(rates!.map((x) => x)),
        "multiDisburseLoan": multiDisburseLoan,
        "maxTrancheCount": maxTrancheCount,
        "principalThresholdForLastInstallment": principalThresholdForLastInstallment,
        "holdGuaranteeFunds": holdGuaranteeFunds,
        "accountMovesOutOfNPAOnlyOnArrearsCompletion": accountMovesOutOfNpaOnlyOnArrearsCompletion,
        "allowAttributeOverrides": allowAttributeOverrides?.toJson(),
        "syncExpectedWithDisbursementDate": syncExpectedWithDisbursementDate,
        "isEqualAmortization": isEqualAmortization,
    };
}

class AllowAttributeOverrides {
    bool? amortizationType;
    bool? interestType;
    bool? transactionProcessingStrategyId;
    bool? interestCalculationPeriodType;
    bool? inArrearsTolerance;
    bool? repaymentEvery;
    bool? graceOnPrincipalAndInterestPayment;
    bool? graceOnArrearsAgeing;

    AllowAttributeOverrides({
        this.amortizationType,
        this.interestType,
        this.transactionProcessingStrategyId,
        this.interestCalculationPeriodType,
        this.inArrearsTolerance,
        this.repaymentEvery,
        this.graceOnPrincipalAndInterestPayment,
        this.graceOnArrearsAgeing,
    });

    factory AllowAttributeOverrides.fromJson(Map<String, dynamic> json) => AllowAttributeOverrides(
        amortizationType: json["amortizationType"],
        interestType: json["interestType"],
        transactionProcessingStrategyId: json["transactionProcessingStrategyId"],
        interestCalculationPeriodType: json["interestCalculationPeriodType"],
        inArrearsTolerance: json["inArrearsTolerance"],
        repaymentEvery: json["repaymentEvery"],
        graceOnPrincipalAndInterestPayment: json["graceOnPrincipalAndInterestPayment"],
        graceOnArrearsAgeing: json["graceOnArrearsAgeing"],
    );

    Map<String, dynamic> toJson() => {
        "amortizationType": amortizationType,
        "interestType": interestType,
        "transactionProcessingStrategyId": transactionProcessingStrategyId,
        "interestCalculationPeriodType": interestCalculationPeriodType,
        "inArrearsTolerance": inArrearsTolerance,
        "repaymentEvery": repaymentEvery,
        "graceOnPrincipalAndInterestPayment": graceOnPrincipalAndInterestPayment,
        "graceOnArrearsAgeing": graceOnArrearsAgeing,
    };
}

class ProductOption {
    int? id;
    String? name;
    bool? includeInBorrowerCycle;
    bool? useBorrowerCycle;
    bool? isLinkedToFloatingInterestRates;
    bool? isFloatingInterestRateCalculationAllowed;
    bool? allowVariableInstallments;
    bool? isInterestRecalculationEnabled;
    bool? canDefineInstallmentAmount;
    List<dynamic>? principalVariationsForBorrowerCycle;
    List<dynamic>? interestRateVariationsForBorrowerCycle;
    List<dynamic>? numberOfRepaymentVariationsForBorrowerCycle;
    bool? canUseForTopup;
    bool? isRatesEnabled;
    bool? multiDisburseLoan;
    bool? holdGuaranteeFunds;
    bool? accountMovesOutOfNpaOnlyOnArrearsCompletion;
    bool? syncExpectedWithDisbursementDate;
    bool? isEqualAmortization;

    ProductOption({
        this.id,
        this.name,
        this.includeInBorrowerCycle,
        this.useBorrowerCycle,
        this.isLinkedToFloatingInterestRates,
        this.isFloatingInterestRateCalculationAllowed,
        this.allowVariableInstallments,
        this.isInterestRecalculationEnabled,
        this.canDefineInstallmentAmount,
        this.principalVariationsForBorrowerCycle,
        this.interestRateVariationsForBorrowerCycle,
        this.numberOfRepaymentVariationsForBorrowerCycle,
        this.canUseForTopup,
        this.isRatesEnabled,
        this.multiDisburseLoan,
        this.holdGuaranteeFunds,
        this.accountMovesOutOfNpaOnlyOnArrearsCompletion,
        this.syncExpectedWithDisbursementDate,
        this.isEqualAmortization,
    });

    factory ProductOption.fromJson(Map<String, dynamic> json) => ProductOption(
        id: json["id"],
        name: json["name"],
        includeInBorrowerCycle: json["includeInBorrowerCycle"],
        useBorrowerCycle: json["useBorrowerCycle"],
        isLinkedToFloatingInterestRates: json["isLinkedToFloatingInterestRates"],
        isFloatingInterestRateCalculationAllowed: json["isFloatingInterestRateCalculationAllowed"],
        allowVariableInstallments: json["allowVariableInstallments"],
        isInterestRecalculationEnabled: json["isInterestRecalculationEnabled"],
        canDefineInstallmentAmount: json["canDefineInstallmentAmount"],
        principalVariationsForBorrowerCycle: json["principalVariationsForBorrowerCycle"] == null ? [] : List<dynamic>.from(json["principalVariationsForBorrowerCycle"]!.map((x) => x)),
        interestRateVariationsForBorrowerCycle: json["interestRateVariationsForBorrowerCycle"] == null ? [] : List<dynamic>.from(json["interestRateVariationsForBorrowerCycle"]!.map((x) => x)),
        numberOfRepaymentVariationsForBorrowerCycle: json["numberOfRepaymentVariationsForBorrowerCycle"] == null ? [] : List<dynamic>.from(json["numberOfRepaymentVariationsForBorrowerCycle"]!.map((x) => x)),
        canUseForTopup: json["canUseForTopup"],
        isRatesEnabled: json["isRatesEnabled"],
        multiDisburseLoan: json["multiDisburseLoan"],
        holdGuaranteeFunds: json["holdGuaranteeFunds"],
        accountMovesOutOfNpaOnlyOnArrearsCompletion: json["accountMovesOutOfNPAOnlyOnArrearsCompletion"],
        syncExpectedWithDisbursementDate: json["syncExpectedWithDisbursementDate"],
        isEqualAmortization: json["isEqualAmortization"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "includeInBorrowerCycle": includeInBorrowerCycle,
        "useBorrowerCycle": useBorrowerCycle,
        "isLinkedToFloatingInterestRates": isLinkedToFloatingInterestRates,
        "isFloatingInterestRateCalculationAllowed": isFloatingInterestRateCalculationAllowed,
        "allowVariableInstallments": allowVariableInstallments,
        "isInterestRecalculationEnabled": isInterestRecalculationEnabled,
        "canDefineInstallmentAmount": canDefineInstallmentAmount,
        "principalVariationsForBorrowerCycle": principalVariationsForBorrowerCycle == null ? [] : List<dynamic>.from(principalVariationsForBorrowerCycle!.map((x) => x)),
        "interestRateVariationsForBorrowerCycle": interestRateVariationsForBorrowerCycle == null ? [] : List<dynamic>.from(interestRateVariationsForBorrowerCycle!.map((x) => x)),
        "numberOfRepaymentVariationsForBorrowerCycle": numberOfRepaymentVariationsForBorrowerCycle == null ? [] : List<dynamic>.from(numberOfRepaymentVariationsForBorrowerCycle!.map((x) => x)),
        "canUseForTopup": canUseForTopup,
        "isRatesEnabled": isRatesEnabled,
        "multiDisburseLoan": multiDisburseLoan,
        "holdGuaranteeFunds": holdGuaranteeFunds,
        "accountMovesOutOfNPAOnlyOnArrearsCompletion": accountMovesOutOfNpaOnlyOnArrearsCompletion,
        "syncExpectedWithDisbursementDate": syncExpectedWithDisbursementDate,
        "isEqualAmortization": isEqualAmortization,
    };
}

class LoanListTimeline {
    List<int>? expectedDisbursementDate;

    LoanListTimeline({
        this.expectedDisbursementDate,
    });

    factory LoanListTimeline.fromJson(Map<String, dynamic> json) => LoanListTimeline(
        expectedDisbursementDate: json["expectedDisbursementDate"] == null ? [] : List<int>.from(json["expectedDisbursementDate"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "expectedDisbursementDate": expectedDisbursementDate == null ? [] : List<dynamic>.from(expectedDisbursementDate!.map((x) => x)),
    };
}

class TransactionProcessingStrategyOption {
    int? id;
    String? code;
    String? name;

    TransactionProcessingStrategyOption({
        this.id,
        this.code,
        this.name,
    });

    factory TransactionProcessingStrategyOption.fromJson(Map<String, dynamic> json) => TransactionProcessingStrategyOption(
        id: json["id"],
        code: json["code"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
    };
}
