// To parse this JSON data, do
//
//     final serviceSupplier = serviceSupplierFromJson(jsonString);

import 'dart:convert';

ServiceSupplierModel serviceSupplierFromJson(String str) => ServiceSupplierModel.fromJson(json.decode(str));

String serviceSupplierToJson(ServiceSupplierModel data) => json.encode(data.toJson());

class ServiceSupplierModel {
    Couple? couple;
    String? bookingDetailId;
    ServiceSupplierResponse? serviceSupplierResponse;
    double? price;
    String? note;
    DateTime? createAt;
    DateTime? completedDate;
    String? status;
    dynamic promotionResponse;

    ServiceSupplierModel({
        this.couple,
        this.bookingDetailId,
        this.serviceSupplierResponse,
        this.price,
        this.note,
        this.createAt,
        this.completedDate,
        this.status,
        this.promotionResponse,
    });

    ServiceSupplierModel copyWith({
        Couple? couple,
        String? bookingDetailId,
        ServiceSupplierResponse? serviceSupplierResponse,
        double? price,
        String? note,
        DateTime? createAt,
        DateTime? completedDate,
        String? status,
        dynamic promotionResponse,
    }) => 
        ServiceSupplierModel(
            couple: couple ?? this.couple,
            bookingDetailId: bookingDetailId ?? this.bookingDetailId,
            serviceSupplierResponse: serviceSupplierResponse ?? this.serviceSupplierResponse,
            price: price ?? this.price,
            note: note ?? this.note,
            createAt: createAt ?? this.createAt,
            completedDate: completedDate ?? this.completedDate,
            status: status ?? this.status,
            promotionResponse: promotionResponse ?? this.promotionResponse,
        );

    factory ServiceSupplierModel.fromJson(Map<String, dynamic> json) => ServiceSupplierModel(
        couple: json["couple"] == null ? null : Couple.fromJson(json["couple"]),
        bookingDetailId: json["bookingDetailId"],
        serviceSupplierResponse: json["serviceSupplierResponse"] == null ? null : ServiceSupplierResponse.fromJson(json["serviceSupplierResponse"]),
        price: json["price"]?.toDouble(),
        note: json["note"],
        createAt: json["createAt"] == null ? null : DateTime.parse(json["createAt"]),
        completedDate: json["completedDate"] == null ? null : DateTime.parse(json["completedDate"]),
        status: json["status"],
        promotionResponse: json["promotionResponse"],
    );

    Map<String, dynamic> toJson() => {
        "couple": couple?.toJson(),
        "bookingDetailId": bookingDetailId,
        "serviceSupplierResponse": serviceSupplierResponse?.toJson(),
        "price": price,
        "note": note,
        "createAt": createAt?.toIso8601String(),
        "completedDate": "${completedDate!.year.toString().padLeft(4, '0')}-${completedDate!.month.toString().padLeft(2, '0')}-${completedDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "promotionResponse": promotionResponse,
    };
}

class Couple {
    String? id;
    String? partnerName1;
    String? partnerName2;
    String? status;
    DateTime? weddingDate;
    Account? account;

    Couple({
        this.id,
        this.partnerName1,
        this.partnerName2,
        this.status,
        this.weddingDate,
        this.account,
    });

    Couple copyWith({
        String? id,
        String? partnerName1,
        String? partnerName2,
        String? status,
        DateTime? weddingDate,
        Account? account,
    }) => 
        Couple(
            id: id ?? this.id,
            partnerName1: partnerName1 ?? this.partnerName1,
            partnerName2: partnerName2 ?? this.partnerName2,
            status: status ?? this.status,
            weddingDate: weddingDate ?? this.weddingDate,
            account: account ?? this.account,
        );

    factory Couple.fromJson(Map<String, dynamic> json) => Couple(
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
    dynamic image;
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
        dynamic image,
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

class ServiceSupplierResponse {
    String? id;
    String? name;
    String? description;
    double? rating;
    List<String>? listImages;
    String? type;
    DateTime? createAt;
    double? price;
    String? status;
    ServiceResponse? serviceResponse;

    ServiceSupplierResponse({
        this.id,
        this.name,
        this.description,
        this.rating,
        this.listImages,
        this.type,
        this.createAt,
        this.price,
        this.status,
        this.serviceResponse,
    });

    ServiceSupplierResponse copyWith({
        String? id,
        String? name,
        String? description,
        double? rating,
        List<String>? listImages,
        String? type,
        DateTime? createAt,
        double? price,
        String? status,
        ServiceResponse? serviceResponse,
    }) => 
        ServiceSupplierResponse(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            rating: rating ?? this.rating,
            listImages: listImages ?? this.listImages,
            type: type ?? this.type,
            createAt: createAt ?? this.createAt,
            price: price ?? this.price,
            status: status ?? this.status,
            serviceResponse: serviceResponse ?? this.serviceResponse,
        );

    factory ServiceSupplierResponse.fromJson(Map<String, dynamic> json) => ServiceSupplierResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        listImages: json["listImages"] == null ? [] : List<String>.from(json["listImages"]!.map((x) => x)),
        type: json["type"],
        createAt: json["createAt"] == null ? null : DateTime.parse(json["createAt"]),
        price: json["price"]?.toDouble(),
        status: json["status"],
        serviceResponse: json["serviceResponse"] == null ? null : ServiceResponse.fromJson(json["serviceResponse"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "rating": rating,
        "listImages": listImages == null ? [] : List<dynamic>.from(listImages!.map((x) => x)),
        "type": type,
        "createAt": createAt?.toIso8601String(),
        "price": price,
        "status": status,
        "serviceResponse": serviceResponse?.toJson(),
    };
}

class ServiceResponse {
    String? id;
    String? name;
    String? description;
    DateTime? createAt;
    List<String>? listImages;
    CategoryResponse? categoryResponse;

    ServiceResponse({
        this.id,
        this.name,
        this.description,
        this.createAt,
        this.listImages,
        this.categoryResponse,
    });

    ServiceResponse copyWith({
        String? id,
        String? name,
        String? description,
        DateTime? createAt,
        List<String>? listImages,
        CategoryResponse? categoryResponse,
    }) => 
        ServiceResponse(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            createAt: createAt ?? this.createAt,
            listImages: listImages ?? this.listImages,
            categoryResponse: categoryResponse ?? this.categoryResponse,
        );

    factory ServiceResponse.fromJson(Map<String, dynamic> json) => ServiceResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createAt: json["createAt"] == null ? null : DateTime.parse(json["createAt"]),
        listImages: json["listImages"] == null ? [] : List<String>.from(json["listImages"]!.map((x) => x)),
        categoryResponse: json["categoryResponse"] == null ? null : CategoryResponse.fromJson(json["categoryResponse"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createAt": createAt?.toIso8601String(),
        "listImages": listImages == null ? [] : List<dynamic>.from(listImages!.map((x) => x)),
        "categoryResponse": categoryResponse?.toJson(),
    };
}

class CategoryResponse {
    String? id;
    String? categoryName;
    String? status;

    CategoryResponse({
        this.id,
        this.categoryName,
        this.status,
    });

    CategoryResponse copyWith({
        String? id,
        String? categoryName,
        String? status,
    }) => 
        CategoryResponse(
            id: id ?? this.id,
            categoryName: categoryName ?? this.categoryName,
            status: status ?? this.status,
        );

    factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
        id: json["id"],
        categoryName: json["categoryName"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "status": status,
    };
}
