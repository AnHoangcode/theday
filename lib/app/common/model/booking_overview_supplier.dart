// To parse this JSON data, do
//
//     final bookingOverViewSupplier = bookingOverViewSupplierFromJson(jsonString);

import 'dart:convert';

BookingOverViewSupplier bookingOverViewSupplierFromJson(String str) => BookingOverViewSupplier.fromJson(json.decode(str));

String bookingOverViewSupplierToJson(BookingOverViewSupplier data) => json.encode(data.toJson());

class BookingOverViewSupplier {
    String? id;
    dynamic note;
    double? totalPrice;
    DateTime? weddingDate;
    DateTime? createdAt;
    String? status;
    CoupleResponse? coupleResponse;

    BookingOverViewSupplier({
        this.id,
        this.note,
        this.totalPrice,
        this.weddingDate,
        this.createdAt,
        this.status,
        this.coupleResponse,
    });

    BookingOverViewSupplier copyWith({
        String? id,
        dynamic note,
        double? totalPrice,
        DateTime? weddingDate,
        DateTime? createdAt,
        String? status,
        CoupleResponse? coupleResponse,
    }) => 
        BookingOverViewSupplier(
            id: id ?? this.id,
            note: note ?? this.note,
            totalPrice: totalPrice ?? this.totalPrice,
            weddingDate: weddingDate ?? this.weddingDate,
            createdAt: createdAt ?? this.createdAt,
            status: status ?? this.status,
            coupleResponse: coupleResponse ?? this.coupleResponse,
        );

    factory BookingOverViewSupplier.fromJson(Map<String, dynamic> json) => BookingOverViewSupplier(
        id: json["id"],
        note: json["note"],
        totalPrice: json["totalPrice"]?.toDouble(),
        weddingDate: json["weddingDate"] == null ? null : DateTime.parse(json["weddingDate"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        status: json["status"],
        coupleResponse: json["coupleResponse"] == null ? null : CoupleResponse.fromJson(json["coupleResponse"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "note": note,
        "totalPrice": totalPrice,
        "weddingDate": "${weddingDate!.year.toString().padLeft(4, '0')}-${weddingDate!.month.toString().padLeft(2, '0')}-${weddingDate!.day.toString().padLeft(2, '0')}",
        "createdAt": createdAt?.toIso8601String(),
        "status": status,
        "coupleResponse": coupleResponse?.toJson(),
    };
}

class CoupleResponse {
    String? id;
    String? partnerName1;
    String? partnerName2;
    String? status;
    DateTime? weddingDate;
    Account? account;

    CoupleResponse({
        this.id,
        this.partnerName1,
        this.partnerName2,
        this.status,
        this.weddingDate,
        this.account,
    });

    CoupleResponse copyWith({
        String? id,
        String? partnerName1,
        String? partnerName2,
        String? status,
        DateTime? weddingDate,
        Account? account,
    }) => 
        CoupleResponse(
            id: id ?? this.id,
            partnerName1: partnerName1 ?? this.partnerName1,
            partnerName2: partnerName2 ?? this.partnerName2,
            status: status ?? this.status,
            weddingDate: weddingDate ?? this.weddingDate,
            account: account ?? this.account,
        );

    factory CoupleResponse.fromJson(Map<String, dynamic> json) => CoupleResponse(
        id: json["id"],
        partnerName1: json["partnerName1"],
        partnerName2: json["partnerName2"],
        status: json["status"],
        weddingDate: json["weddingDate"] == null ? null : DateTime.parse(json["weddingDate"]),
        account: json["account"] == null ? null : Account.fromJson(json["account"]),
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

class Account {
    int? id;
    String? email;
    String? name;
    String? image;
    String? phoneNumber;
    String? address;
    String? status;
    String? provider;
    Role? role;

    Account({
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

    Account copyWith({
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
        Account(
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

    factory Account.fromJson(Map<String, dynamic> json) => Account(
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
