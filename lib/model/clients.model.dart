// To parse this JSON data, do
//
//     final clients = clientsFromJson(jsonString);

import 'dart:convert';

Clients clientsFromJson(String str) => Clients.fromJson(json.decode(str));

String clientsToJson(Clients data) => json.encode(data.toJson());

class Clients {
    int? totalFilteredRecords;
    List<PageItem>? pageItems;

    Clients({
        this.totalFilteredRecords,
        this.pageItems,
    });

    factory Clients.fromJson(Map<String, dynamic> json) => Clients(
        totalFilteredRecords: json["totalFilteredRecords"],
        pageItems: json["pageItems"] == null
            ? null
            : List<PageItem>.from(json["pageItems"].map((x) => PageItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalFilteredRecords": totalFilteredRecords,
        "pageItems": pageItems == null ? null : List<dynamic>.from(pageItems!.map((x) => x.toJson())),
    };
}

class PageItem {
    int? id;
    String? accountNo;
    String? externalId;
    Status? status;
    SubStatus? subStatus;
    bool? active;
    String? firstname;
    String? lastname;
    String? displayName;
    String? mobileNo;
    List<int>? dateOfBirth;
    ClientClassification? gender;
    ClientClassification? clientType;
    ClientClassification? clientClassification;
    bool? isStaff;
    int? officeId;
    String? officeName;
    Timeline? timeline;
    int? savingsProductId;
    String? savingsProductName;
    Status? legalForm;
    ClientNonPersonDetails? clientNonPersonDetails;
    List<int>? activationDate;
    int? staffId;
    String? staffName;
    int? savingsAccountId;
    int? transferToOfficeId;
    String? transferToOfficeName;
    String? fullname;

    PageItem({
        this.id,
        this.accountNo,
        this.externalId,
        this.status,
        this.subStatus,
        this.active,
        this.firstname,
        this.lastname,
        this.displayName,
        this.mobileNo,
        this.dateOfBirth,
        this.gender,
        this.clientType,
        this.clientClassification,
        this.isStaff,
        this.officeId,
        this.officeName,
        this.timeline,
        this.savingsProductId,
        this.savingsProductName,
        this.legalForm,
        this.clientNonPersonDetails,
        this.activationDate,
        this.staffId,
        this.staffName,
        this.savingsAccountId,
        this.transferToOfficeId,
        this.transferToOfficeName,
        this.fullname,
    });

    factory PageItem.fromJson(Map<String, dynamic> json) => PageItem(
        id: json["id"],
        accountNo: json["accountNo"],
        externalId: json["externalId"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        subStatus: json["subStatus"] == null ? null : SubStatus.fromJson(json["subStatus"]),
        active: json["active"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        displayName: json["displayName"],
        mobileNo: json["mobileNo"],
        dateOfBirth: json["dateOfBirth"] == null ? null : List<int>.from(json["dateOfBirth"].map((x) => x)),
        gender: json["gender"] == null ? null : ClientClassification.fromJson(json["gender"]),
        clientType: json["clientType"] == null ? null : ClientClassification.fromJson(json["clientType"]),
        clientClassification: json["clientClassification"] == null ? null : ClientClassification.fromJson(json["clientClassification"]),
        isStaff: json["isStaff"],
        officeId: json["officeId"],
        officeName: json["officeName"],
        timeline: json["timeline"] == null ? null : Timeline.fromJson(json["timeline"]),
        savingsProductId: json["savingsProductId"],
        savingsProductName: json["savingsProductName"],
        legalForm: json["legalForm"] == null ? null : Status.fromJson(json["legalForm"]),
        clientNonPersonDetails: json["clientNonPersonDetails"] == null ? null : ClientNonPersonDetails.fromJson(json["clientNonPersonDetails"]),
        activationDate: json["activationDate"] == null ? null : List<int>.from(json["activationDate"].map((x) => x)),
        staffId: json["staffId"],
        staffName: json["staffName"],
        savingsAccountId: json["savingsAccountId"],
        transferToOfficeId: json["transferToOfficeId"],
        transferToOfficeName: json["transferToOfficeName"],
        fullname: json["fullname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "externalId": externalId,
        "status": status?.toJson(),
        "subStatus": subStatus?.toJson(),
        "active": active,
        "firstname": firstname,
        "lastname": lastname,
        "displayName": displayName,
        "mobileNo": mobileNo,
        "dateOfBirth": dateOfBirth == null ? null : List<dynamic>.from(dateOfBirth!.map((x) => x)),
        "gender": gender?.toJson(),
        "clientType": clientType?.toJson(),
        "clientClassification": clientClassification?.toJson(),
        "isStaff": isStaff,
        "officeId": officeId,
        "officeName": officeName,
        "timeline": timeline?.toJson(),
        "savingsProductId": savingsProductId,
        "savingsProductName": savingsProductName,
        "legalForm": legalForm?.toJson(),
        "clientNonPersonDetails": clientNonPersonDetails?.toJson(),
        "activationDate": activationDate == null ? null : List<dynamic>.from(activationDate!.map((x) => x)),
        "staffId": staffId,
        "staffName": staffName,
        "savingsAccountId": savingsAccountId,
        "transferToOfficeId": transferToOfficeId,
        "transferToOfficeName": transferToOfficeName,
        "fullname": fullname,
    };
}

class ClientClassification {
    int? id;
    String? name;
    bool? active;
    bool? mandatory;

    ClientClassification({
        this.id,
        this.name,
        this.active,
        this.mandatory,
    });

    factory ClientClassification.fromJson(Map<String, dynamic> json) => ClientClassification(
        id: json["id"],
        name: json["name"],
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

class ClientNonPersonDetails {
    SubStatus? constitution;
    SubStatus? mainBusinessLine;

    ClientNonPersonDetails({
        this.constitution,
        this.mainBusinessLine,
    });

    factory ClientNonPersonDetails.fromJson(Map<String, dynamic> json) => ClientNonPersonDetails(
        constitution: json["constitution"] == null ? null : SubStatus.fromJson(json["constitution"]),
        mainBusinessLine: json["mainBusinessLine"] == null ? null : SubStatus.fromJson(json["mainBusinessLine"]),
    );

    Map<String, dynamic> toJson() => {
        "constitution": constitution?.toJson(),
        "mainBusinessLine": mainBusinessLine?.toJson(),
    };
}
class SubStatus {
  bool? active;
  bool? mandatory;

  SubStatus({
    this.active,
    this.mandatory,
  });

  factory SubStatus.fromJson(Map<String, dynamic> json) => SubStatus(
        active: json["active"],
        mandatory: json["mandatory"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "mandatory": mandatory,
      };
}

class Status {
  int? id;
  String? code;
  String? value;

  Status({
    this.id,
    this.code,
    this.value,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
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

class Timeline {
  List<int>? submittedOnDate;
  String? submittedByUsername;
  String? submittedByFirstname;
  String? submittedByLastname;
  List<int>? activatedOnDate;
  String? activatedByUsername;
  String? activatedByFirstname;
  String? activatedByLastname;

  Timeline({
    this.submittedOnDate,
    this.submittedByUsername,
    this.submittedByFirstname,
    this.submittedByLastname,
    this.activatedOnDate,
    this.activatedByUsername,
    this.activatedByFirstname,
    this.activatedByLastname,
  });

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        submittedOnDate: json["submittedOnDate"] == null
            ? null
            : List<int>.from(json["submittedOnDate"].map((x) => x)),
        submittedByUsername: json["submittedByUsername"],
        submittedByFirstname: json["submittedByFirstname"],
        submittedByLastname: json["submittedByLastname"],
        activatedOnDate: json["activatedOnDate"] == null
            ? null
            : List<int>.from(json["activatedOnDate"].map((x) => x)),
        activatedByUsername: json["activatedByUsername"],
        activatedByFirstname: json["activatedByFirstname"],
        activatedByLastname: json["activatedByLastname"],
      );

  Map<String, dynamic> toJson() => {
        "submittedOnDate": submittedOnDate == null
            ? null
            : List<dynamic>.from(submittedOnDate!.map((x) => x)),
        "submittedByUsername": submittedByUsername,
        "submittedByFirstname": submittedByFirstname,
        "submittedByLastname": submittedByLastname,
        "activatedOnDate": activatedOnDate == null
            ? null
            : List<dynamic>.from(activatedOnDate!.map((x) => x)),
        "activatedByUsername": activatedByUsername,
        "activatedByFirstname": activatedByFirstname,
        "activatedByLastname": activatedByLastname,
      };
}

