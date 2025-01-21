// To parse this JSON data, do
//
//     final centerInfo = centerInfoFromJson(jsonString);

import 'dart:convert';

CenterInfo centerInfoFromJson(String str) => CenterInfo.fromJson(json.decode(str));

String centerInfoToJson(CenterInfo data) => json.encode(data.toJson());

class CenterInfo {
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
    List<CenterInfo>? groupMembers;
    CollectionMeetingCalendar? collectionMeetingCalendar;
    String? groupLevel;

    CenterInfo({
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
        this.groupMembers,
        this.collectionMeetingCalendar,
        this.groupLevel,
    });

    factory CenterInfo.fromJson(Map<String, dynamic> json) => CenterInfo(
        id: json["id"] ?? 0,
        accountNo: json["accountNo"] ?? "-",
        name: json["name"] ?? "-",
        officeId: json["officeId"] ?? 0,
        officeName: json["officeName"] ?? "-",
        staffId: json["staffId"] ?? 0,
        staffName: json["staffName"] ?? "-",
        hierarchy: json["hierarchy"] ?? "-",
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        active: json["active"] ?? false,
        activationDate: json["activationDate"] == null ? [] : List<int>.from(json["activationDate"]!.map((x) => x)),
        timeline: json["timeline"] == null ? null : Timeline.fromJson(json["timeline"]),
        groupMembers: json["groupMembers"] == null ? [] : List<CenterInfo>.from(json["groupMembers"]!.map((x) => CenterInfo.fromJson(x))),
        collectionMeetingCalendar: json["collectionMeetingCalendar"] == null ? null : CollectionMeetingCalendar.fromJson(json["collectionMeetingCalendar"]),
        groupLevel: json["groupLevel"] ?? "-",
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
        "activationDate": activationDate == null ? [] : List<dynamic>.from(activationDate!.map((x) => x)),
        "timeline": timeline?.toJson(),
        "groupMembers": groupMembers == null ? [] : List<dynamic>.from(groupMembers!.map((x) => x.toJson())),
        "collectionMeetingCalendar": collectionMeetingCalendar?.toJson(),
        "groupLevel": groupLevel,
    };
}

class CollectionMeetingCalendar {
    int? id;
    int? calendarInstanceId;
    int? entityId;
    Status? entityType;
    String? title;
    List<int>? startDate;
    int? duration;
    Status? type;
    bool? repeating;
    String? recurrence;
    Status? frequency;
    int? interval;
    Status? repeatsOnDay;
    Status? repeatsOnNthDayOfMonth;
    int? firstReminder;
    int? secondReminder;
    List<List<int>>? recurringDates;
    List<List<int>>? nextTenRecurringDates;
    String? humanReadable;
    List<int>? recentEligibleMeetingDate;
    List<int>? createdDate;
    List<int>? lastUpdatedDate;
    int? createdByUserId;
    String? createdByUsername;
    int? lastUpdatedByUserId;
    String? lastUpdatedByUsername;

    CollectionMeetingCalendar({
        this.id,
        this.calendarInstanceId,
        this.entityId,
        this.entityType,
        this.title,
        this.startDate,
        this.duration,
        this.type,
        this.repeating,
        this.recurrence,
        this.frequency,
        this.interval,
        this.repeatsOnDay,
        this.repeatsOnNthDayOfMonth,
        this.firstReminder,
        this.secondReminder,
        this.recurringDates,
        this.nextTenRecurringDates,
        this.humanReadable,
        this.recentEligibleMeetingDate,
        this.createdDate,
        this.lastUpdatedDate,
        this.createdByUserId,
        this.createdByUsername,
        this.lastUpdatedByUserId,
        this.lastUpdatedByUsername,
    });

    factory CollectionMeetingCalendar.fromJson(Map<String, dynamic> json) => CollectionMeetingCalendar(
        id: json["id"] ?? 0,
        calendarInstanceId: json["calendarInstanceId"] ?? 0,
        entityId: json["entityId"] ?? 0,
        entityType: json["entityType"] == null ? null : Status.fromJson(json["entityType"]),
        title: json["title"] ?? "-",
        startDate: json["startDate"] == null ? [] : List<int>.from(json["startDate"]!.map((x) => x)),
        duration: json["duration"] ?? 0,
        type: json["type"] == null ? null : Status.fromJson(json["type"]),
        repeating: json["repeating"] ?? false,
        recurrence: json["recurrence"] ?? "-",
        frequency: json["frequency"] == null ? null : Status.fromJson(json["frequency"]),
        interval: json["interval"] ?? 0,
        repeatsOnDay: json["repeatsOnDay"] == null ? null : Status.fromJson(json["repeatsOnDay"]),
        repeatsOnNthDayOfMonth: json["repeatsOnNthDayOfMonth"] == null ? null : Status.fromJson(json["repeatsOnNthDayOfMonth"]),
        firstReminder: json["firstReminder"] ?? 0,
        secondReminder: json["secondReminder"] ?? 0,
        recurringDates: json["recurringDates"] == null ? [] : List<List<int>>.from(json["recurringDates"]!.map((x) => List<int>.from(x.map((x) => x)))),
        nextTenRecurringDates: json["nextTenRecurringDates"] == null ? [] : List<List<int>>.from(json["nextTenRecurringDates"]!.map((x) => List<int>.from(x.map((x) => x)))),
        humanReadable: json["humanReadable"] ?? "-",
        recentEligibleMeetingDate: json["recentEligibleMeetingDate"] == null ? [] : List<int>.from(json["recentEligibleMeetingDate"]!.map((x) => x)),
        createdDate: json["createdDate"] == null ? [] : List<int>.from(json["createdDate"]!.map((x) => x)),
        lastUpdatedDate: json["lastUpdatedDate"] == null ? [] : List<int>.from(json["lastUpdatedDate"]!.map((x) => x)),
        createdByUserId: json["createdByUserId"] ?? 0,
        createdByUsername: json["createdByUsername"] ?? "-",
        lastUpdatedByUserId: json["lastUpdatedByUserId"] ?? 0,
        lastUpdatedByUsername: json["lastUpdatedByUsername"] ?? "-",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "calendarInstanceId": calendarInstanceId,
        "entityId": entityId,
        "entityType": entityType?.toJson(),
        "title": title,
        "startDate": startDate == null ? [] : List<dynamic>.from(startDate!.map((x) => x)),
        "duration": duration,
        "type": type?.toJson(),
        "repeating": repeating,
        "recurrence": recurrence,
        "frequency": frequency?.toJson(),
        "interval": interval,
        "repeatsOnDay": repeatsOnDay?.toJson(),
        "repeatsOnNthDayOfMonth": repeatsOnNthDayOfMonth?.toJson(),
        "firstReminder": firstReminder,
        "secondReminder": secondReminder,
        "recurringDates": recurringDates == null ? [] : List<dynamic>.from(recurringDates!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "nextTenRecurringDates": nextTenRecurringDates == null ? [] : List<dynamic>.from(nextTenRecurringDates!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "humanReadable": humanReadable,
        "recentEligibleMeetingDate": recentEligibleMeetingDate == null ? [] : List<dynamic>.from(recentEligibleMeetingDate!.map((x) => x)),
        "createdDate": createdDate == null ? [] : List<dynamic>.from(createdDate!.map((x) => x)),
        "lastUpdatedDate": lastUpdatedDate == null ? [] : List<dynamic>.from(lastUpdatedDate!.map((x) => x)),
        "createdByUserId": createdByUserId,
        "createdByUsername": createdByUsername,
        "lastUpdatedByUserId": lastUpdatedByUserId,
        "lastUpdatedByUsername": lastUpdatedByUsername,
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
        id: json["id"] ?? 0,
        code: json["code"] ?? "-",
        value: json["value"] ?? "-",
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
        submittedByUsername: json["submittedByUsername"] ?? "-",
        submittedByFirstname: json["submittedByFirstname"] ?? "-",
        submittedByLastname: json["submittedByLastname"] ?? "-",
        activatedOnDate: json["activatedOnDate"] == null ? [] : List<int>.from(json["activatedOnDate"]!.map((x) => x)),
        activatedByUsername: json["activatedByUsername"] ?? "-",
        activatedByFirstname: json["activatedByFirstname"] ?? "-",
        activatedByLastname: json["activatedByLastname"] ?? "-",
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