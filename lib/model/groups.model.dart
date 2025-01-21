

import 'dart:convert';

Groups groupsFromJson(String str) => Groups.fromJson(json.decode(str));

String groupsToJson(Groups data) => json.encode(data.toJson());

class Groups {
    int? totalFilteredRecords;
    List<PageItem>? pageItems;

    Groups({
        this.totalFilteredRecords,
        this.pageItems,
    });

    factory Groups.fromJson(Map<String, dynamic> json) => Groups(
        totalFilteredRecords: json["totalFilteredRecords"],
        pageItems: json["pageItems"] == null ? [] : List<PageItem>.from(json["pageItems"]!.map((x) => PageItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalFilteredRecords": totalFilteredRecords,
        "pageItems": pageItems == null ? [] : List<dynamic>.from(pageItems!.map((x) => x.toJson())),
    };
}

class PageItem {
    int? id;
    String? accountNo;
    String? name;
    Status? status;
    bool? active;
    List<int>? activationDate;
    int? officeId;
    String? officeName;
    int? staffId;
    String? staffName;
    String? hierarchy;
    String? groupLevel;
    Timeline? timeline;
    String? externalId;
    int? centerId;
    String? centerName;

    PageItem({
        this.id,
        this.accountNo,
        this.name,
        this.status,
        this.active,
        this.activationDate,
        this.officeId,
        this.officeName,
        this.staffId,
        this.staffName,
        this.hierarchy,
        this.groupLevel,
        this.timeline,
        this.externalId,
        this.centerId,
        this.centerName,
    });

    factory PageItem.fromJson(Map<String, dynamic> json) => PageItem(
        id: json["id"],
        accountNo: json["accountNo"],
        name: json["name"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        active: json["active"],
        activationDate: json["activationDate"] == null ? [] : List<int>.from(json["activationDate"]!.map((x) => x)),
        officeId: json["officeId"],
        officeName: json["officeName"],
        staffId: json["staffId"],
        staffName: json["staffName"],
        hierarchy: json["hierarchy"],
        groupLevel: json["groupLevel"],
        timeline: json["timeline"] == null ? null : Timeline.fromJson(json["timeline"]),
        externalId: json["externalId"],
        centerId: json["centerId"],
        centerName: json["centerName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "name": name,
        "status": status?.toJson(),
        "active": active,
        "activationDate": activationDate == null ? [] : List<dynamic>.from(activationDate!.map((x) => x)),
        "officeId": officeId,
        "officeName": officeName,
        "staffId": staffId,
        "staffName": staffName,
        "hierarchy": hierarchy,
        "groupLevel": groupLevel,
        "timeline": timeline?.toJson(),
        "externalId": externalId,
        "centerId": centerId,
        "centerName": centerName,
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
