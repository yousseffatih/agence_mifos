import 'dart:convert';

AddLoanBody addLoanBodyFromJson(String str) => AddLoanBody.fromJson(json.decode(str));

String addLoanBodyToJson(AddLoanBody data) => json.encode(data.toJson());

class AddLoanBody {
    bool? allowPartialPeriodInterestCalcualtion;
    int? amortizationType;
    int? clientId;
    String? dateFormat;
    String? expectedDisbursementDate;
    int? fundId;
    int? interestCalculationPeriodType;
    int? interestRatePerPeriod;
    int? interestType;
    int? linkAccountId;
    int? loanOfficerId;
    int? loanPurposeId;
    int? loanTermFrequency;
    int? loanTermFrequencyType;
    String? loanType;
    String? locale;
    int? numberOfRepayments;
    double? principal;
    int? productId;
    int? repaymentEvery;
    int? repaymentFrequencyDayOfWeekType;
    int? repaymentFrequencyNthDayType;
    int? repaymentFrequencyType;
    String? submittedOnDate;
    int? transactionProcessingStrategyId;

    AddLoanBody({
        this.allowPartialPeriodInterestCalcualtion,
        this.amortizationType,
        this.clientId,
        this.dateFormat,
        this.expectedDisbursementDate,
        this.fundId,
        this.interestCalculationPeriodType,
        this.interestRatePerPeriod,
        this.interestType,
        this.linkAccountId,
        this.loanOfficerId,
        this.loanPurposeId,
        this.loanTermFrequency,
        this.loanTermFrequencyType,
        this.loanType,
        this.locale,
        this.numberOfRepayments,
        this.principal,
        this.productId,
        this.repaymentEvery,
        this.repaymentFrequencyDayOfWeekType,
        this.repaymentFrequencyNthDayType,
        this.repaymentFrequencyType,
        this.submittedOnDate,
        this.transactionProcessingStrategyId,
    });

    factory AddLoanBody.fromJson(Map<String, dynamic> json) => AddLoanBody(
        allowPartialPeriodInterestCalcualtion: json["allowPartialPeriodInterestCalcualtion"],
        amortizationType: json["amortizationType"],
        clientId: json["clientId"],
        dateFormat: json["dateFormat"],
        expectedDisbursementDate: json["expectedDisbursementDate"],
        fundId: json["fundId"],
        interestCalculationPeriodType: json["interestCalculationPeriodType"],
        interestRatePerPeriod: json["interestRatePerPeriod"],
        interestType: json["interestType"],
        linkAccountId: json["linkAccountId"],
        loanOfficerId: json["loanOfficerId"],
        loanPurposeId: json["loanPurposeId"],
        loanTermFrequency: json["loanTermFrequency"],
        loanTermFrequencyType: json["loanTermFrequencyType"],
        loanType: json["loanType"],
        locale: json["locale"],
        numberOfRepayments: json["numberOfRepayments"],
        principal: json["principal"],
        productId: json["productId"],
        repaymentEvery: json["repaymentEvery"],
        repaymentFrequencyDayOfWeekType: json["repaymentFrequencyDayOfWeekType"],
        repaymentFrequencyNthDayType: json["repaymentFrequencyNthDayType"],
        repaymentFrequencyType: json["repaymentFrequencyType"],
        submittedOnDate: json["submittedOnDate"],
        transactionProcessingStrategyId: json["transactionProcessingStrategyId"],
    );

    Map<String, dynamic> toJson() => {
        "allowPartialPeriodInterestCalcualtion": allowPartialPeriodInterestCalcualtion,
        "amortizationType": amortizationType,
        "clientId": clientId,
        "dateFormat": dateFormat,
        "expectedDisbursementDate": expectedDisbursementDate,
        "fundId": fundId,
        "interestCalculationPeriodType": interestCalculationPeriodType,
        "interestRatePerPeriod": interestRatePerPeriod,
        "interestType": interestType,
        "linkAccountId": linkAccountId,
        "loanOfficerId": loanOfficerId,
        "loanPurposeId": loanPurposeId,
        "loanTermFrequency": loanTermFrequency,
        "loanTermFrequencyType": loanTermFrequencyType,
        "loanType": loanType,
        "locale": locale,
        "numberOfRepayments": numberOfRepayments,
        "principal": principal,
        "productId": productId,
        "repaymentEvery": repaymentEvery,
        "repaymentFrequencyDayOfWeekType": repaymentFrequencyDayOfWeekType,
        "repaymentFrequencyNthDayType": repaymentFrequencyNthDayType,
        "repaymentFrequencyType": repaymentFrequencyType,
        "submittedOnDate": submittedOnDate,
        "transactionProcessingStrategyId": transactionProcessingStrategyId,
    };
}
