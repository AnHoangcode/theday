// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

const coupleRole = 'COUPLE';
const supplierRole = 'SUPPLIER';

// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

class Account {
    int? accountId;
    String? token;
    String? name;
    int? balance;
    String? roleName;
    String? email;
    String? status;
    String? userId;

    Account({
        this.accountId,
        this.token,
        this.name,
        this.balance,
        this.roleName,
        this.email,
        this.status,
        this.userId,
    });

    Account copyWith({
        int? accountId,
        String? token,
        String? name,
        int? balance,
        String? roleName,
        String? email,
        String? status,
        String? userId,
    }) => 
        Account(
            accountId: accountId ?? this.accountId,
            token: token ?? this.token,
            name: name ?? this.name,
            balance: balance ?? this.balance,
            roleName: roleName ?? this.roleName,
            email: email ?? this.email,
            status: status ?? this.status,
            userId: userId ?? this.userId,
        );

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        accountId: json["accountId"],
        token: json["token"],
        name: json["name"],
        balance: json["balance"],
        roleName: json["roleName"],
        email: json["email"],
        status: json["status"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "token": token,
        "name": name,
        "balance": balance,
        "roleName": roleName,
        "email": email,
        "status": status,
        "userId": userId,
    };
}
