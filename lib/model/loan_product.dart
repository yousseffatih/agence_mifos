class LoanProduct {
  final int? id;
  final String? name;
  final String? shortName;
  final String? description;
  final bool? includeInBorrowerCycle;
  final bool? useBorrowerCycle;
  final List<int>? startDate;
  final List<int>? closeDate;
  final String? status;
  final Currency? currency;
  final double? principal;
  final double? minPrincipal;
  final double? maxPrincipal;
  final int? numberOfRepayments;
  final int? minNumberOfRepayments;
  final int? maxNumberOfRepayments;
  final int? repaymentEvery;
  final RepaymentFrequencyType? repaymentFrequencyType;
  final double? interestRatePerPeriod;
  final double? minInterestRatePerPeriod;
  final double? maxInterestRatePerPeriod;
  final InterestRateFrequencyType? interestRateFrequencyType;
  final double? annualInterestRate;
  final bool? isLinkedToFloatingInterestRates;
  final bool? isFloatingInterestRateCalculationAllowed;
  final bool? allowVariableInstallments;
  final int? minimumGap;
  final int? maximumGap;
  final AmortizationType? amortizationType;
  final InterestType? interestType;
  final InterestCalculationPeriodType? interestCalculationPeriodType;
  final bool? allowPartialPeriodInterestCalcualtion;
  final int? transactionProcessingStrategyId;
  final String? transactionProcessingStrategyName;
  final int? graceOnPrincipalPayment;
  final int? graceOnInterestPayment;
  final int? graceOnInterestCharged;
  final int? graceOnArrearsAgeing;
  final int? overdueDaysForNPA;
  final DaysInMonthType? daysInMonthType;
  final DaysInYearType? daysInYearType;
  final bool? isInterestRecalculationEnabled;
  final int? minimumDaysBetweenDisbursalAndFirstRepayment;
  final bool? canDefineInstallmentAmount;
  final int? installmentAmountInMultiplesOf;
  final List<dynamic>? principalVariationsForBorrowerCycle;
  final List<dynamic>? interestRateVariationsForBorrowerCycle;
  final List<dynamic>? numberOfRepaymentVariationsForBorrowerCycle;
  final AccountingRule? accountingRule;
  final bool? canUseForTopup;
  final bool? isRatesEnabled;
  final bool? multiDisburseLoan;
  final int? maxTrancheCount;
  final double? outstandingLoanBalance;
  final double? principalThresholdForLastInstallment;
  final bool? holdGuaranteeFunds;
  final ProductGuaranteeData? productGuaranteeData;
  final bool? accountMovesOutOfNPAOnlyOnArrearsCompletion;
  final AllowAttributeOverrides? allowAttributeOverrides;
  final bool? syncExpectedWithDisbursementDate;
  final bool? isEqualAmortization;
  final InterestRecalculationData? interestRecalculationData;

  LoanProduct({
    this.id,
    this.name,
    this.shortName,
    this.description,
    this.includeInBorrowerCycle,
    this.useBorrowerCycle,
    this.startDate,
    this.closeDate,
    this.status,
    this.currency,
    this.principal,
    this.minPrincipal,
    this.maxPrincipal,
    this.numberOfRepayments,
    this.minNumberOfRepayments,
    this.maxNumberOfRepayments,
    this.repaymentEvery,
    this.repaymentFrequencyType,
    this.interestRatePerPeriod,
    this.minInterestRatePerPeriod,
    this.maxInterestRatePerPeriod,
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
    this.graceOnPrincipalPayment,
    this.graceOnInterestPayment,
    this.graceOnInterestCharged,
    this.graceOnArrearsAgeing,
    this.overdueDaysForNPA,
    this.daysInMonthType,
    this.daysInYearType,
    this.isInterestRecalculationEnabled,
    this.minimumDaysBetweenDisbursalAndFirstRepayment,
    this.canDefineInstallmentAmount,
    this.installmentAmountInMultiplesOf,
    this.principalVariationsForBorrowerCycle,
    this.interestRateVariationsForBorrowerCycle,
    this.numberOfRepaymentVariationsForBorrowerCycle,
    this.accountingRule,
    this.canUseForTopup,
    this.isRatesEnabled,
    this.multiDisburseLoan,
    this.maxTrancheCount,
    this.outstandingLoanBalance,
    this.principalThresholdForLastInstallment,
    this.holdGuaranteeFunds,
    this.productGuaranteeData,
    this.accountMovesOutOfNPAOnlyOnArrearsCompletion,
    this.allowAttributeOverrides,
    this.syncExpectedWithDisbursementDate,
    this.isEqualAmortization,
    this.interestRecalculationData,
  });

  factory LoanProduct.fromJson(Map<String, dynamic> json) {
    return LoanProduct(
      id: json['id'] as int?,
      name: json['name'] as String?,
      shortName: json['shortName'] as String?,
      description: json['description'] as String?,
      includeInBorrowerCycle: json['includeInBorrowerCycle'] as bool?,
      useBorrowerCycle: json['useBorrowerCycle'] as bool?,
      startDate: (json['startDate'] as List<dynamic>?)?.cast<int>(),
      closeDate: (json['closeDate'] as List<dynamic>?)?.cast<int>(),
      status: json['status'] as String?,
      currency: json['currency'] != null
          ? Currency.fromJson(json['currency'])
          : null,
      principal: json['principal'] as double?,
      minPrincipal: json['minPrincipal'] as double?,
      maxPrincipal: json['maxPrincipal'] as double?,
      numberOfRepayments: json['numberOfRepayments'] as int?,
      minNumberOfRepayments: json['minNumberOfRepayments'] as int?,
      maxNumberOfRepayments: json['maxNumberOfRepayments'] as int?,
      repaymentEvery: json['repaymentEvery'] as int?,
      repaymentFrequencyType: json['repaymentFrequencyType'] != null
          ? RepaymentFrequencyType.fromJson(json['repaymentFrequencyType'])
          : null,
      interestRatePerPeriod: json['interestRatePerPeriod'] as double?,
      minInterestRatePerPeriod: json['minInterestRatePerPeriod'] as double?,
      maxInterestRatePerPeriod: json['maxInterestRatePerPeriod'] as double?,
      interestRateFrequencyType: json['interestRateFrequencyType'] != null
          ? InterestRateFrequencyType.fromJson(json['interestRateFrequencyType'])
          : null,
      annualInterestRate: json['annualInterestRate'] as double?,
      isLinkedToFloatingInterestRates:
          json['isLinkedToFloatingInterestRates'] as bool?,
      isFloatingInterestRateCalculationAllowed:
          json['isFloatingInterestRateCalculationAllowed'] as bool?,
      allowVariableInstallments: json['allowVariableInstallments'] as bool?,
      minimumGap: json['minimumGap'] as int?,
      maximumGap: json['maximumGap'] as int?,
      amortizationType: json['amortizationType'] != null
          ? AmortizationType.fromJson(json['amortizationType'])
          : null,
      interestType: json['interestType'] != null
          ? InterestType.fromJson(json['interestType'])
          : null,
      interestCalculationPeriodType: json['interestCalculationPeriodType'] != null
          ? InterestCalculationPeriodType.fromJson(json['interestCalculationPeriodType'])
          : null,
      allowPartialPeriodInterestCalcualtion:
          json['allowPartialPeriodInterestCalcualtion'] as bool?,
      transactionProcessingStrategyId:
          json['transactionProcessingStrategyId'] as int?,
      transactionProcessingStrategyName:
          json['transactionProcessingStrategyName'] as String?,
      graceOnPrincipalPayment: json['graceOnPrincipalPayment'] as int?,
      graceOnInterestPayment: json['graceOnInterestPayment'] as int?,
      graceOnInterestCharged: json['graceOnInterestCharged'] as int?,
      graceOnArrearsAgeing: json['graceOnArrearsAgeing'] as int?,
      overdueDaysForNPA: json['overdueDaysForNPA'] as int?,
      daysInMonthType: json['daysInMonthType'] != null
          ? DaysInMonthType.fromJson(json['daysInMonthType'])
          : null,
      daysInYearType: json['daysInYearType'] != null
          ? DaysInYearType.fromJson(json['daysInYearType'])
          : null,
      isInterestRecalculationEnabled:
          json['isInterestRecalculationEnabled'] as bool?,
      minimumDaysBetweenDisbursalAndFirstRepayment:
          json['minimumDaysBetweenDisbursalAndFirstRepayment'] as int?,
      canDefineInstallmentAmount: json['canDefineInstallmentAmount'] as bool?,
      installmentAmountInMultiplesOf:
          json['installmentAmountInMultiplesOf'] as int?,
      principalVariationsForBorrowerCycle:
          json['principalVariationsForBorrowerCycle'] as List<dynamic>?,
      interestRateVariationsForBorrowerCycle:
          json['interestRateVariationsForBorrowerCycle'] as List<dynamic>?,
      numberOfRepaymentVariationsForBorrowerCycle:
          json['numberOfRepaymentVariationsForBorrowerCycle'] as List<dynamic>?,
      accountingRule: json['accountingRule'] != null
          ? AccountingRule.fromJson(json['accountingRule'])
          : null,
      canUseForTopup: json['canUseForTopup'] as bool?,
      isRatesEnabled: json['isRatesEnabled'] as bool?,
      multiDisburseLoan: json['multiDisburseLoan'] as bool?,
      maxTrancheCount: json['maxTrancheCount'] as int?,
      outstandingLoanBalance: json['outstandingLoanBalance'] as double?,
      principalThresholdForLastInstallment:
          json['principalThresholdForLastInstallment'] as double?,
      holdGuaranteeFunds: json['holdGuaranteeFunds'] as bool?,
      productGuaranteeData: json['productGuaranteeData'] != null
          ? ProductGuaranteeData.fromJson(json['productGuaranteeData'])
          : null,
      accountMovesOutOfNPAOnlyOnArrearsCompletion:
          json['accountMovesOutOfNPAOnlyOnArrearsCompletion'] as bool?,
      allowAttributeOverrides: json['allowAttributeOverrides'] != null
          ? AllowAttributeOverrides.fromJson(json['allowAttributeOverrides'])
          : null,
      syncExpectedWithDisbursementDate:
          json['syncExpectedWithDisbursementDate'] as bool?,
      isEqualAmortization: json['isEqualAmortization'] as bool?,
      interestRecalculationData: json['interestRecalculationData'] != null
          ? InterestRecalculationData.fromJson(json['interestRecalculationData'])
          : null,
    );
  }
}

class Currency {
  final String? code;
  final String? name;
  final int? decimalPlaces;
  final int? inMultiplesOf;
  final String? displaySymbol;
  final String? nameCode;
  final String? displayLabel;

  Currency({
    this.code,
    this.name,
    this.decimalPlaces,
    this.inMultiplesOf,
    this.displaySymbol,
    this.nameCode,
    this.displayLabel,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] as String?,
      name: json['name'] as String?,
      decimalPlaces: json['decimalPlaces'] as int?,
      inMultiplesOf: json['inMultiplesOf'] as int?,
      displaySymbol: json['displaySymbol'] as String?,
      nameCode: json['nameCode'] as String?,
      displayLabel: json['displayLabel'] as String?,
    );
  }
}

class RepaymentFrequencyType {
  final int? id;
  final String? code;
  final String? value;

  RepaymentFrequencyType({
    this.id,
    this.code,
    this.value,
  });

  factory RepaymentFrequencyType.fromJson(Map<String, dynamic> json) {
    return RepaymentFrequencyType(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}

class InterestRateFrequencyType {
  final int? id;
  final String? code;
  final String? value;

  InterestRateFrequencyType({
    this.id,
    this.code,
    this.value,
  });

  factory InterestRateFrequencyType.fromJson(Map<String, dynamic> json) {
    return InterestRateFrequencyType(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}

class AmortizationType {
  final int? id;
  final String? code;
  final String? value;

  AmortizationType({
    this.id,
    this.code,
    this.value,
  });

  factory AmortizationType.fromJson(Map<String, dynamic> json) {
    return AmortizationType(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}

class InterestType {
  final int? id;
  final String? code;
  final String? value;

  InterestType({
    this.id,
    this.code,
    this.value,
  });

  factory InterestType.fromJson(Map<String, dynamic> json) {
    return InterestType(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}

class InterestCalculationPeriodType {
  final int? id;
  final String? code;
  final String? value;

  InterestCalculationPeriodType({
    this.id,
    this.code,
    this.value,
  });

  factory InterestCalculationPeriodType.fromJson(Map<String, dynamic> json) {
    return InterestCalculationPeriodType(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}

class DaysInMonthType {
  final int? id;
  final String? code;
  final String? value;

  DaysInMonthType({
    this.id,
    this.code,
    this.value,
  });

  factory DaysInMonthType.fromJson(Map<String, dynamic> json) {
    return DaysInMonthType(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}

class DaysInYearType {
  final int? id;
  final String? code;
  final String? value;

  DaysInYearType({
    this.id,
    this.code,
    this.value,
  });

  factory DaysInYearType.fromJson(Map<String, dynamic> json) {
    return DaysInYearType(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}

class AccountingRule {
  final int? id;
  final String? code;
  final String? value;

  AccountingRule({
    this.id,
    this.code,
    this.value,
  });

  factory AccountingRule.fromJson(Map<String, dynamic> json) {
    return AccountingRule(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}

class ProductGuaranteeData {
  final int? id;
  final int? productId;
  final double? mandatoryGuarantee;
  final double? minimumGuaranteeFromOwnFunds;
  final double? minimumGuaranteeFromGuarantor;

  ProductGuaranteeData({
    this.id,
    this.productId,
    this.mandatoryGuarantee,
    this.minimumGuaranteeFromOwnFunds,
    this.minimumGuaranteeFromGuarantor,
  });

  factory ProductGuaranteeData.fromJson(Map<String, dynamic> json) {
    return ProductGuaranteeData(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      mandatoryGuarantee: json['mandatoryGuarantee'] as double?,
      minimumGuaranteeFromOwnFunds: json['minimumGuaranteeFromOwnFunds'] as double?,
      minimumGuaranteeFromGuarantor: json['minimumGuaranteeFromGuarantor'] as double?,
    );
  }
}

class AllowAttributeOverrides {
  final bool? amortizationType;
  final bool? interestType;
  final bool? transactionProcessingStrategyId;
  final bool? interestCalculationPeriodType;
  final bool? inArrearsTolerance;
  final bool? repaymentEvery;
  final bool? graceOnPrincipalAndInterestPayment;
  final bool? graceOnArrearsAgeing;

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

  factory AllowAttributeOverrides.fromJson(Map<String, dynamic> json) {
    return AllowAttributeOverrides(
      amortizationType: json['amortizationType'] as bool?,
      interestType: json['interestType'] as bool?,
      transactionProcessingStrategyId:
          json['transactionProcessingStrategyId'] as bool?,
      interestCalculationPeriodType:
          json['interestCalculationPeriodType'] as bool?,
      inArrearsTolerance: json['inArrearsTolerance'] as bool?,
      repaymentEvery: json['repaymentEvery'] as bool?,
      graceOnPrincipalAndInterestPayment:
          json['graceOnPrincipalAndInterestPayment'] as bool?,
      graceOnArrearsAgeing: json['graceOnArrearsAgeing'] as bool?,
    );
  }
}

class InterestRecalculationData {
  final int? id;
  final int? productId;
  final InterestRecalculationCompoundingType? interestRecalculationCompoundingType;
  final RescheduleStrategyType? rescheduleStrategyType;
  final InterestRecalculationFrequencyType? recalculationRestFrequencyType;
  final int? recalculationRestFrequencyInterval;
  final bool? isArrearsBasedOnOriginalSchedule;
  final bool? isCompoundingToBePostedAsTransaction;
  final PreClosureInterestCalculationStrategy? preClosureInterestCalculationStrategy;
  final bool? allowCompoundingOnEod;

  InterestRecalculationData({
    this.id,
    this.productId,
    this.interestRecalculationCompoundingType,
    this.rescheduleStrategyType,
    this.recalculationRestFrequencyType,
    this.recalculationRestFrequencyInterval,
    this.isArrearsBasedOnOriginalSchedule,
    this.isCompoundingToBePostedAsTransaction,
    this.preClosureInterestCalculationStrategy,
    this.allowCompoundingOnEod,
  });

  factory InterestRecalculationData.fromJson(Map<String, dynamic> json) {
    return InterestRecalculationData(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      interestRecalculationCompoundingType:
          json['interestRecalculationCompoundingType'] != null
              ? InterestRecalculationCompoundingType.fromJson(
                  json['interestRecalculationCompoundingType'])
              : null,
      rescheduleStrategyType: json['rescheduleStrategyType'] != null
          ? RescheduleStrategyType.fromJson(json['rescheduleStrategyType'])
          : null,
      recalculationRestFrequencyType:
          json['recalculationRestFrequencyType'] != null
              ? InterestRecalculationFrequencyType.fromJson(
                  json['recalculationRestFrequencyType'])
              : null,
      recalculationRestFrequencyInterval:
          json['recalculationRestFrequencyInterval'] as int?,
      isArrearsBasedOnOriginalSchedule:
          json['isArrearsBasedOnOriginalSchedule'] as bool?,
      isCompoundingToBePostedAsTransaction:
          json['isCompoundingToBePostedAsTransaction'] as bool?,
      preClosureInterestCalculationStrategy:
          json['preClosureInterestCalculationStrategy'] != null
              ? PreClosureInterestCalculationStrategy.fromJson(
                  json['preClosureInterestCalculationStrategy'])
              : null,
      allowCompoundingOnEod: json['allowCompoundingOnEod'] as bool?,
    );
  }
}

class InterestRecalculationCompoundingType {
  final int? id;
  final String? code;
  final String? value;

  InterestRecalculationCompoundingType({
    this.id,
    this.code,
    this.value,
  });

  factory InterestRecalculationCompoundingType.fromJson(
      Map<String, dynamic> json) {
    return InterestRecalculationCompoundingType(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}

class RescheduleStrategyType {
  final int? id;
  final String? code;
  final String? value;

  RescheduleStrategyType({
    this.id,
    this.code,
    this.value,
  });

  factory RescheduleStrategyType.fromJson(Map<String, dynamic> json) {
    return RescheduleStrategyType(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}

class InterestRecalculationFrequencyType {
  final int? id;
  final String? code;
  final String? value;

  InterestRecalculationFrequencyType({
    this.id,
    this.code,
    this.value,
  });

  factory InterestRecalculationFrequencyType.fromJson(
      Map<String, dynamic> json) {
    return InterestRecalculationFrequencyType(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}

class PreClosureInterestCalculationStrategy {
  final int? id;
  final String? code;
  final String? value;

  PreClosureInterestCalculationStrategy({
    this.id,
    this.code,
    this.value,
  });

  factory PreClosureInterestCalculationStrategy.fromJson(
      Map<String, dynamic> json) {
    return PreClosureInterestCalculationStrategy(
      id: json['id'] as int?,
      code: json['code'] as String?,
      value: json['value'] as String?,
    );
  }
}