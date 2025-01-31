// To parse this JSON data, do
//
//     final identifiersClient = identifiersClientFromJson(jsonString);

import 'dart:convert';

List<IdentifiersClient> identifiersClientFromJson(String str) => List<IdentifiersClient>.from(json.decode(str).map((x) => IdentifiersClient.fromJson(x)));

String identifiersClientToJson(List<IdentifiersClient> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IdentifiersClient {
    int? id;
    int? clientId;
    DocumentType? documentType;
    String? documentKey;
    String? description;
    String? status;

    IdentifiersClient({
        this.id,
        this.clientId,
        this.documentType,
        this.documentKey,
        this.description,
        this.status,
    });

    factory IdentifiersClient.fromJson(Map<String, dynamic> json) => IdentifiersClient(
        id: json["id"],
        clientId: json["clientId"],
        documentType: json["documentType"] == null ? null : DocumentType.fromJson(json["documentType"]),
        documentKey: json["documentKey"],
        description: json["description"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "documentType": documentType?.toJson(),
        "documentKey": documentKey,
        "description": description,
        "status": status,
    };
}

class DocumentType {
    int? id;
    String? name;
    bool? active;
    bool? mandatory;

    DocumentType({
        this.id,
        this.name,
        this.active,
        this.mandatory,
    });

    factory DocumentType.fromJson(Map<String, dynamic> json) => DocumentType(
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
