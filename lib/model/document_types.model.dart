// To parse this JSON data, do
//
//     final documentTypes = documentTypesFromJson(jsonString);

import 'dart:convert';

DocumentTypes documentTypesFromJson(String str) => DocumentTypes.fromJson(json.decode(str));

String documentTypesToJson(DocumentTypes data) => json.encode(data.toJson());

class DocumentTypes {
    List<AllowedDocumentType>? allowedDocumentTypes;

    DocumentTypes({
        this.allowedDocumentTypes,
    });

    factory DocumentTypes.fromJson(Map<String, dynamic> json) => DocumentTypes(
        allowedDocumentTypes: json["allowedDocumentTypes"] == null ? [] : List<AllowedDocumentType>.from(json["allowedDocumentTypes"]!.map((x) => AllowedDocumentType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "allowedDocumentTypes": allowedDocumentTypes == null ? [] : List<dynamic>.from(allowedDocumentTypes!.map((x) => x.toJson())),
    };
}

class AllowedDocumentType {
    int? id;
    String? name;
    int? position;
    bool? active;
    bool? mandatory;
    String? description;

    AllowedDocumentType({
        this.id,
        this.name,
        this.position,
        this.active,
        this.mandatory,
        this.description,
    });

    factory AllowedDocumentType.fromJson(Map<String, dynamic> json) => AllowedDocumentType(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        active: json["active"],
        mandatory: json["mandatory"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "active": active,
        "mandatory": mandatory,
        "description": description,
    };
}
