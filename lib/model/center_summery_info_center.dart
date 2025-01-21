// To parse this JSON data, do
//
//     final centerSummeryInfo = centerSummeryInfoFromJson(jsonString);

import 'dart:convert';

List<CenterSummeryInfo> centerSummeryInfoFromJson(String str) => List<CenterSummeryInfo>.from(json.decode(str).map((x) => CenterSummeryInfo.fromJson(x)));

String centerSummeryInfoToJson(List<CenterSummeryInfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CenterSummeryInfo {
    int? activeClients;
    int? activeLoans;
    int? activeClientLoans;
    int? activeGroupLoans;
    int? activeBorrowers;
    int? activeClientBorrowers;
    int? activeGroupBorrowers;
    int? overdueLoans;
    int? overdueClientLoans;
    int? overdueGroupLoans;

    CenterSummeryInfo({
        this.activeClients,
        this.activeLoans,
        this.activeClientLoans,
        this.activeGroupLoans,
        this.activeBorrowers,
        this.activeClientBorrowers,
        this.activeGroupBorrowers,
        this.overdueLoans,
        this.overdueClientLoans,
        this.overdueGroupLoans,
    });

    factory CenterSummeryInfo.fromJson(Map<String, dynamic> json) => CenterSummeryInfo(
        activeClients: json["activeClients"],
        activeLoans: json["activeLoans"],
        activeClientLoans: json["activeClientLoans"],
        activeGroupLoans: json["activeGroupLoans"],
        activeBorrowers: json["activeBorrowers"],
        activeClientBorrowers: json["activeClientBorrowers"],
        activeGroupBorrowers: json["activeGroupBorrowers"],
        overdueLoans: json["overdueLoans"],
        overdueClientLoans: json["overdueClientLoans"],
        overdueGroupLoans: json["overdueGroupLoans"],
    );

    Map<String, dynamic> toJson() => {
        "activeClients": activeClients,
        "activeLoans": activeLoans,
        "activeClientLoans": activeClientLoans,
        "activeGroupLoans": activeGroupLoans,
        "activeBorrowers": activeBorrowers,
        "activeClientBorrowers": activeClientBorrowers,
        "activeGroupBorrowers": activeGroupBorrowers,
        "overdueLoans": overdueLoans,
        "overdueClientLoans": overdueClientLoans,
        "overdueGroupLoans": overdueGroupLoans,
    };
}
