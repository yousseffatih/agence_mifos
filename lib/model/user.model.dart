// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String username;
    int userId;
    String base64EncodedAuthenticationKey;
    bool authenticated;
    int officeId;
    String officeName;
    List<Role> roles;
    List<String> permissions;
    bool shouldRenewPassword;
    bool isTwoFactorAuthenticationRequired;

    User({
        required this.username,
        required this.userId,
        required this.base64EncodedAuthenticationKey,
        required this.authenticated,
        required this.officeId,
        required this.officeName,
        required this.roles,
        required this.permissions,
        required this.shouldRenewPassword,
        required this.isTwoFactorAuthenticationRequired,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        userId: json["userId"],
        base64EncodedAuthenticationKey: json["base64EncodedAuthenticationKey"],
        authenticated: json["authenticated"],
        officeId: json["officeId"],
        officeName: json["officeName"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        permissions: List<String>.from(json["permissions"].map((x) => x)),
        shouldRenewPassword: json["shouldRenewPassword"],
        isTwoFactorAuthenticationRequired: json["isTwoFactorAuthenticationRequired"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "userId": userId,
        "base64EncodedAuthenticationKey": base64EncodedAuthenticationKey,
        "authenticated": authenticated,
        "officeId": officeId,
        "officeName": officeName,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
        "shouldRenewPassword": shouldRenewPassword,
        "isTwoFactorAuthenticationRequired": isTwoFactorAuthenticationRequired,
    };
}

class Role {
    int id;
    String name;
    String description;
    bool disabled;

    Role({
        required this.id,
        required this.name,
        required this.description,
        required this.disabled,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        disabled: json["disabled"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "disabled": disabled,
    };
}

