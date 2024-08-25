// To parse this JSON data, do
//
//     final personalnfoCouple = personalnfoCoupleFromJson(jsonString);

import 'dart:convert';

PersonalnfoCouple personalnfoCoupleFromJson(String str) => PersonalnfoCouple.fromJson(json.decode(str));

String personalnfoCoupleToJson(PersonalnfoCouple data) => json.encode(data.toJson());

class PersonalnfoCouple {
    String? id;
    String? partnerName1;
    String? partnerName2;
    String? status;
    DateTime? weddingDate;
    AccountInfo? account;

    PersonalnfoCouple({
        this.id,
        this.partnerName1,
        this.partnerName2,
        this.status,
        this.weddingDate,
        this.account,
    });

    PersonalnfoCouple copyWith({
        String? id,
        String? partnerName1,
        String? partnerName2,
        String? status,
        DateTime? weddingDate,
        AccountInfo? account,
    }) => 
        PersonalnfoCouple(
            id: id ?? this.id,
            partnerName1: partnerName1 ?? this.partnerName1,
            partnerName2: partnerName2 ?? this.partnerName2,
            status: status ?? this.status,
            weddingDate: weddingDate ?? this.weddingDate,
            account: account ?? this.account,
        );

    factory PersonalnfoCouple.fromJson(Map<String, dynamic> json) => PersonalnfoCouple(
        id: json["id"],
        partnerName1: json["partnerName1"],
        partnerName2: json["partnerName2"],
        status: json["status"],
        weddingDate: json["weddingDate"] == null ? null : DateTime.parse(json["weddingDate"]),
        account: json["account"] == null ? null : AccountInfo.fromJson(json["account"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "partnerName1": partnerName1,
        "partnerName2": partnerName2,
        "status": status,
        "weddingDate": "${weddingDate!.year.toString().padLeft(4, '0')}-${weddingDate!.month.toString().padLeft(2, '0')}-${weddingDate!.day.toString().padLeft(2, '0')}",
        "account": account?.toJson(),
    };
}

class AccountInfo {
    int? id;
    String? email;
    String? name;
    String? image;
    String? phoneNumber;
    String? address;
    String? status;
    String? provider;
    Role? role;

    AccountInfo({
        this.id,
        this.email,
        this.name,
        this.image,
        this.phoneNumber,
        this.address,
        this.status,
        this.provider,
        this.role,
    });

    AccountInfo copyWith({
        int? id,
        String? email,
        String? name,
        String? image,
        String? phoneNumber,
        String? address,
        String? status,
        String? provider,
        Role? role,
    }) => 
        AccountInfo(
            id: id ?? this.id,
            email: email ?? this.email,
            name: name ?? this.name,
            image: image ?? this.image,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            address: address ?? this.address,
            status: status ?? this.status,
            provider: provider ?? this.provider,
            role: role ?? this.role,
        );

    factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        image: json["image"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        status: json["status"],
        provider: json["provider"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "image": image,
        "phoneNumber": phoneNumber,
        "address": address,
        "status": status,
        "provider": provider,
        "role": role?.toJson(),
    };
}

class Role {
    int? id;
    String? name;

    Role({
        this.id,
        this.name,
    });

    Role copyWith({
        int? id,
        String? name,
    }) => 
        Role(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
