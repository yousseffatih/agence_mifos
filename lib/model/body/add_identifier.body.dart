// To parse this JSON data, do
//
//     final addIdentifierBody = addIdentifierBodyFromJson(jsonString);

import 'dart:convert';

AddIdentifierBody addIdentifierBodyFromJson(String str) => AddIdentifierBody.fromJson(json.decode(str));

String addIdentifierBodyToJson(AddIdentifierBody data) => json.encode(data.toJson());

class AddIdentifierBody {
    String? description;
    String? documentKey;
    int? documentTypeId;
    String? status;

    AddIdentifierBody({
        this.description,
        this.documentKey,
        this.documentTypeId,
        this.status,
    });

    factory AddIdentifierBody.fromJson(Map<String, dynamic> json) => AddIdentifierBody(
        description: json["description"],
        documentKey: json["documentKey"],
        documentTypeId: json["documentTypeId"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "documentKey": documentKey,
        "documentTypeId": documentTypeId,
        "status": status,
    };
}
