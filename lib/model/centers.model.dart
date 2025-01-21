import 'dart:convert';

Centers centersFromJson(String str) => Centers.fromJson(json.decode(str));

String centersToJson(Centers data) => json.encode(data.toJson());

class Centers {
  int? totalFilteredRecords;
  List<PageItem>? pageItems;

  Centers({
    this.totalFilteredRecords,
    this.pageItems,
  });

  factory Centers.fromJson(Map<String, dynamic> json) => Centers(
        totalFilteredRecords: json["totalFilteredRecords"],
        pageItems: json["pageItems"] == null
            ? null
            : List<PageItem>.from(json["pageItems"].map((x) => PageItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalFilteredRecords": totalFilteredRecords,
        "pageItems": pageItems == null
            ? null
            : List<dynamic>.from(pageItems!.map((x) => x.toJson())),
      };
}

class PageItem {
  int? id;
  String? accountNo;
  String? name;
  int? officeId;
  String? officeName;
  int? staffId;
  String? staffName;
  String? hierarchy;
  Status? status;
  bool? active;
  List<int>? activationDate;
  Timeline? timeline;
  String? externalId;

  PageItem({
    this.id,
    this.accountNo,
    this.name,
    this.officeId,
    this.officeName,
    this.staffId,
    this.staffName,
    this.hierarchy,
    this.status,
    this.active,
    this.activationDate,
    this.timeline,
    this.externalId,
  });

  factory PageItem.fromJson(Map<String, dynamic> json) => PageItem(
        id: json["id"],
        accountNo: json["accountNo"],
        name: json["name"],
        officeId: json["officeId"],
        officeName: json["officeName"],
        staffId: json["staffId"],
        staffName: json["staffName"],
        hierarchy: json["hierarchy"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        active: json["active"],
        activationDate: json["activationDate"] == null
            ? null
            : List<int>.from(json["activationDate"]!.map((x) => x)),
        timeline: json["timeline"] == null ? null : Timeline.fromJson(json["timeline"]),
        externalId: json["externalId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "name": name,
        "officeId": officeId,
        "officeName": officeName,
        "staffId": staffId,
        "staffName": staffName,
        "hierarchy": hierarchy,
        "status": status?.toJson(),
        "active": active,
        "activationDate": activationDate == null
            ? null
            : List<dynamic>.from(activationDate!.map((x) => x)),
        "timeline": timeline?.toJson(),
        "externalId": externalId,
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
            : List<int>.from(json["activatedOnDate"]!.map((x) => x)),
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
