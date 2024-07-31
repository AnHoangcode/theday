// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

const ROLE_COUPLE = 'COUPLE';

class Account {
    int? accountId;
    String? token;
    String? roleName;
    String? email;
    String? status;

    Account({
        this.accountId,
        this.token,
        this.roleName,
        this.email,
        this.status,
    });

    Account copyWith({
        int? accountId,
        String? token,
        String? roleName,
        String? email,
        String? status,
    }) => 
        Account(
            accountId: accountId ?? this.accountId,
            token: token ?? this.token,
            roleName: roleName ?? this.roleName,
            email: email ?? this.email,
            status: status ?? this.status,
        );

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        accountId: json["accountId"],
        token: json["token"],
        roleName: json["roleName"],
        email: json["email"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "token": token,
        "roleName": roleName,
        "email": email,
        "status": status,
    };
}
