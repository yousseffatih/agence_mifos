// To parse this JSON data, do
//
//     final surveysClient = surveysClientFromJson(jsonString);

import 'dart:convert';

List<SurveysClient> surveysClientFromJson(String str) => List<SurveysClient>.from(json.decode(str).map((x) => SurveysClient.fromJson(x)));

String surveysClientToJson(List<SurveysClient> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurveysClient {
    int? id;
    List<dynamic>? componentDatas;
    List<QuestionData>? questionDatas;
    String? key;
    String? name;
    String? description;
    String? countryCode;
    int? validFrom;
    int? validTo;

    SurveysClient({
        this.id,
        this.componentDatas,
        this.questionDatas,
        this.key,
        this.name,
        this.description,
        this.countryCode,
        this.validFrom,
        this.validTo,
    });

    factory SurveysClient.fromJson(Map<String, dynamic> json) => SurveysClient(
        id: json["id"],
        componentDatas: json["componentDatas"] == null ? [] : List<dynamic>.from(json["componentDatas"]!.map((x) => x)),
        questionDatas: json["questionDatas"] == null ? [] : List<QuestionData>.from(json["questionDatas"]!.map((x) => QuestionData.fromJson(x))),
        key: json["key"],
        name: json["name"],
        description: json["description"] ?? "",
        countryCode: json["countryCode"],
        validFrom: json["validFrom"],
        validTo: json["validTo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "componentDatas": componentDatas == null ? [] : List<dynamic>.from(componentDatas!.map((x) => x)),
        "questionDatas": questionDatas == null ? [] : List<dynamic>.from(questionDatas!.map((x) => x.toJson())),
        "key": key,
        "name": name,
        "description": description,
        "countryCode": countryCode,
        "validFrom": validFrom,
        "validTo": validTo,
    };
}

class QuestionData {
    int? id;
    List<ResponseData>? responseDatas;
    dynamic componentKey;
    String? key;
    String? text;
    dynamic description;
    int? sequenceNo;

    QuestionData({
        this.id,
        this.responseDatas,
        this.componentKey,
        this.key,
        this.text,
        this.description,
        this.sequenceNo,
    });

    factory QuestionData.fromJson(Map<String, dynamic> json) => QuestionData(
        id: json["id"],
        responseDatas: json["responseDatas"] == null ? [] : List<ResponseData>.from(json["responseDatas"]!.map((x) => ResponseData.fromJson(x))),
        componentKey: json["componentKey"],
        key: json["key"],
        text: json["text"],
        description: json["description"],
        sequenceNo: json["sequenceNo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "responseDatas": responseDatas == null ? [] : List<dynamic>.from(responseDatas!.map((x) => x.toJson())),
        "componentKey": componentKey,
        "key": key,
        "text": text,
        "description": description,
        "sequenceNo": sequenceNo,
    };
}

class ResponseData {
    int? id;
    String? text;
    int? value;
    int? sequenceNo;

    ResponseData({
        this.id,
        this.text,
        this.value,
        this.sequenceNo,
    });

    factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        id: json["id"],
        text: json["text"],
        value: json["value"],
        sequenceNo: json["sequenceNo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "value": value,
        "sequenceNo": sequenceNo,
    };
}
