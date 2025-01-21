// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
    int? id;
    String? accountNo;
    String? externalId;
    String? mobileNo;
    LegalForm? status;
    ClientClassification? subStatus;
    bool? active;
    List<int>? activationDate;
    String? firstname;
    String? lastname;
    String? displayName;
    ClientClassification? gender;
    ClientClassification? clientType;
    ClientClassification? clientClassification;
    bool? isStaff;
    int? officeId;
    String? officeName;
    int? staffId;
    String? staffName;
    Timeline? timeline;
    LegalForm? legalForm;
    List<Group>? groups;
    ClientNonPersonDetails? clientNonPersonDetails;

    Client({
        this.id,
        this.accountNo,
        this.externalId,
        this.mobileNo,
        this.status,
        this.subStatus,
        this.active,
        this.activationDate,
        this.firstname,
        this.lastname,
        this.displayName,
        this.gender,
        this.clientType,
        this.clientClassification,
        this.isStaff,
        this.officeId,
        this.officeName,
        this.staffId,
        this.staffName,
        this.timeline,
        this.legalForm,
        this.groups,
        this.clientNonPersonDetails,
    });

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        accountNo: json["accountNo"],
        externalId: json["externalId"],
        mobileNo: json["mobileNo"],
        status: json["status"] == null ? null : LegalForm.fromJson(json["status"]),
        subStatus: json["subStatus"] == null ? null : ClientClassification.fromJson(json["subStatus"]),
        active: json["active"],
        activationDate: json["activationDate"] == null ? [] : List<int>.from(json["activationDate"]!.map((x) => x)),
        firstname: json["firstname"],
        lastname: json["lastname"],
        displayName: json["displayName"],
        gender: json["gender"] == null ? null : ClientClassification.fromJson(json["gender"]),
        clientType: json["clientType"] == null ? null : ClientClassification.fromJson(json["clientType"]),
        clientClassification: json["clientClassification"] == null ? null : ClientClassification.fromJson(json["clientClassification"]),
        isStaff: json["isStaff"],
        officeId: json["officeId"],
        officeName: json["officeName"],
        staffId: json["staffId"],
        staffName: json["staffName"],
        timeline: json["timeline"] == null ? null : Timeline.fromJson(json["timeline"]),
        legalForm: json["legalForm"] == null ? null : LegalForm.fromJson(json["legalForm"]),
        groups: json["groups"] == null ? [] : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
        clientNonPersonDetails: json["clientNonPersonDetails"] == null ? null : ClientNonPersonDetails.fromJson(json["clientNonPersonDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "externalId": externalId,
        "mobileNo": mobileNo,
        "status": status?.toJson(),
        "subStatus": subStatus?.toJson(),
        "active": active,
        "activationDate": activationDate == null ? [] : List<dynamic>.from(activationDate!.map((x) => x)),
        "firstname": firstname,
        "lastname": lastname,
        "displayName": displayName,
        "gender": gender?.toJson(),
        "clientType": clientType?.toJson(),
        "clientClassification": clientClassification?.toJson(),
        "isStaff": isStaff,
        "officeId": officeId,
        "officeName": officeName,
        "staffId": staffId,
        "staffName": staffName,
        "timeline": timeline?.toJson(),
        "legalForm": legalForm?.toJson(),
        "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x.toJson())),
        "clientNonPersonDetails": clientNonPersonDetails?.toJson(),
    };
}

class ClientClassification {
    bool? active;
    bool? mandatory;

    ClientClassification({
        this.active,
        this.mandatory,
    });

    factory ClientClassification.fromJson(Map<String, dynamic> json) => ClientClassification(
        active: json["active"],
        mandatory: json["mandatory"],
    );

    Map<String, dynamic> toJson() => {
        "active": active,
        "mandatory": mandatory,
    };
}

class ClientNonPersonDetails {
    ClientClassification? constitution;
    ClientClassification? mainBusinessLine;

    ClientNonPersonDetails({
        this.constitution,
        this.mainBusinessLine,
    });

    factory ClientNonPersonDetails.fromJson(Map<String, dynamic> json) => ClientNonPersonDetails(
        constitution: json["constitution"] == null ? null : ClientClassification.fromJson(json["constitution"]),
        mainBusinessLine: json["mainBusinessLine"] == null ? null : ClientClassification.fromJson(json["mainBusinessLine"]),
    );

    Map<String, dynamic> toJson() => {
        "constitution": constitution?.toJson(),
        "mainBusinessLine": mainBusinessLine?.toJson(),
    };
}

class Group {
    int? id;
    String? accountNo;
    String? name;

    Group({
        this.id,
        this.accountNo,
        this.name,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        accountNo: json["accountNo"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "name": name,
    };
}

class LegalForm {
    int? id;
    String? code;
    String? value;

    LegalForm({
        this.id,
        this.code,
        this.value,
    });

    factory LegalForm.fromJson(Map<String, dynamic> json) => LegalForm(
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
        submittedOnDate: json["submittedOnDate"] == null ? [] : List<int>.from(json["submittedOnDate"]!.map((x) => x)),
        submittedByUsername: json["submittedByUsername"],
        submittedByFirstname: json["submittedByFirstname"],
        submittedByLastname: json["submittedByLastname"],
        activatedOnDate: json["activatedOnDate"] == null ? [] : List<int>.from(json["activatedOnDate"]!.map((x) => x)),
        activatedByUsername: json["activatedByUsername"],
        activatedByFirstname: json["activatedByFirstname"],
        activatedByLastname: json["activatedByLastname"],
    );

    Map<String, dynamic> toJson() => {
        "submittedOnDate": submittedOnDate == null ? [] : List<dynamic>.from(submittedOnDate!.map((x) => x)),
        "submittedByUsername": submittedByUsername,
        "submittedByFirstname": submittedByFirstname,
        "submittedByLastname": submittedByLastname,
        "activatedOnDate": activatedOnDate == null ? [] : List<dynamic>.from(activatedOnDate!.map((x) => x)),
        "activatedByUsername": activatedByUsername,
        "activatedByFirstname": activatedByFirstname,
        "activatedByLastname": activatedByLastname,
    };
}
