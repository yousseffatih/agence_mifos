import 'dart:convert';

List<Search> searchFromJson(String str) => List<Search>.from(json.decode(str).map((x) => Search.fromJson(x)));

String searchToJson(List<Search> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Search {
    int? entityId;
    String? entityAccountNo;
    String? entityExternalId;
    String? entityName;
    String? entityType;
    int? parentId;
    String? parentName;
    String? entityMobileNo;
    EntityStatus? entityStatus;

    Search({
        this.entityId,
        this.entityAccountNo,
        this.entityExternalId,
        this.entityName,
        this.entityType,
        this.parentId,
        this.parentName,
        this.entityMobileNo,
        this.entityStatus,
    });

    factory Search.fromJson(Map<String, dynamic> json) => Search(
        entityId: json["entityId"],
        entityAccountNo: json["entityAccountNo"],
        entityExternalId: json["entityExternalId"],
        entityName: json["entityName"],
        entityType: json["entityType"],
        parentId: json["parentId"],
        parentName: json["parentName"],
        entityMobileNo: json["entityMobileNo"],
        entityStatus: json["entityStatus"] == null ? null : EntityStatus.fromJson(json["entityStatus"]),
    );

    Map<String, dynamic> toJson() => {
        "entityId": entityId,
        "entityAccountNo": entityAccountNo,
        "entityExternalId": entityExternalId,
        "entityName": entityName,
        "entityType": entityType,
        "parentId": parentId,
        "parentName": parentName,
        "entityMobileNo": entityMobileNo,
        "entityStatus": entityStatus?.toJson(),
    };
}

class EntityStatus {
    int? id;
    String? code;
    String? value;

    EntityStatus({
        this.id,
        this.code,
        this.value,
    });

    factory EntityStatus.fromJson(Map<String, dynamic> json) => EntityStatus(
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
