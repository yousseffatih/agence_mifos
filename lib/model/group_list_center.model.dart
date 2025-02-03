import 'dart:convert';

GroupListCenter groupListCenterFromJson(String str) => GroupListCenter.fromJson(json.decode(str));

String groupListCenterToJson(GroupListCenter data) => json.encode(data.toJson());

class GroupListCenter {
    int? id;
    String? accountNo;
    String? name;
    String? externalId;
    int? officeId;
    String? officeName;
    int? staffId;
    String? staffName;
    String? hierarchy;
    Status? status;
    bool? active;
    List<int>? activationDate;
    Timeline? timeline;
    List<GroupListCenter>? groupMembers;
    String? groupLevel;

    GroupListCenter({
        this.id,
        this.accountNo,
        this.name,
        this.externalId,
        this.officeId,
        this.officeName,
        this.staffId,
        this.staffName,
        this.hierarchy,
        this.status,
        this.active,
        this.activationDate,
        this.timeline,
        this.groupMembers,
        this.groupLevel,
    });

    factory GroupListCenter.fromJson(Map<String, dynamic> json) => GroupListCenter(
        id: json["id"],
        accountNo: json["accountNo"],
        name: json["name"],
        externalId: json["externalId"],
        officeId: json["officeId"],
        officeName: json["officeName"],
        staffId: json["staffId"],
        staffName: json["staffName"] ?? "",
        hierarchy: json["hierarchy"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        active: json["active"],
        activationDate: json["activationDate"] == null ? [] : List<int>.from(json["activationDate"]!.map((x) => x)),
        timeline: json["timeline"] == null ? null : Timeline.fromJson(json["timeline"]),
        groupMembers: json["groupMembers"] == null ? [] : List<GroupListCenter>.from(json["groupMembers"]!.map((x) => GroupListCenter.fromJson(x))),
        groupLevel: json["groupLevel"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "name": name,
        "externalId": externalId,
        "officeId": officeId,
        "officeName": officeName,
        "staffId": staffId,
        "staffName": staffName,
        "hierarchy": hierarchy,
        "status": status?.toJson(),
        "active": active,
        "activationDate": activationDate == null ? [] : List<dynamic>.from(activationDate!.map((x) => x)),
        "timeline": timeline?.toJson(),
        "groupMembers": groupMembers == null ? [] : List<dynamic>.from(groupMembers!.map((x) => x.toJson())),
        "groupLevel": groupLevel,
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
