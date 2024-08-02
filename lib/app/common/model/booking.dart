// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
    String? id;
    Couple? couple;
    DateTime? createdAt;
    DateTime? completedDate;
    List<ServiceBooking>? serviceBookings;
    int? totalPrice;
    String? status;

    Booking({
        this.id,
        this.couple,
        this.createdAt,
        this.completedDate,
        this.serviceBookings,
        this.totalPrice,
        this.status,
    });

    Booking copyWith({
        String? id,
        Couple? couple,
        DateTime? createdAt,
        DateTime? completedDate,
        List<ServiceBooking>? serviceBookings,
        int? totalPrice,
        String? status,
    }) => 
        Booking(
            id: id ?? this.id,
            couple: couple ?? this.couple,
            createdAt: createdAt ?? this.createdAt,
            completedDate: completedDate ?? this.completedDate,
            serviceBookings: serviceBookings ?? this.serviceBookings,
            totalPrice: totalPrice ?? this.totalPrice,
            status: status ?? this.status,
        );

    factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        couple: json["couple"] == null ? null : Couple.fromJson(json["couple"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        completedDate: json["completedDate"] == null ? null : DateTime.parse(json["completedDate"]),
        serviceBookings: json["serviceBookings"] == null ? [] : List<ServiceBooking>.from(json["serviceBookings"]!.map((x) => ServiceBooking.fromJson(x))),
        totalPrice: json["totalPrice"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "couple": couple?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "completedDate": "${completedDate!.year.toString().padLeft(4, '0')}-${completedDate!.month.toString().padLeft(2, '0')}-${completedDate!.day.toString().padLeft(2, '0')}",
        "serviceBookings": serviceBookings == null ? [] : List<dynamic>.from(serviceBookings!.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "status": status,
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

class ServiceBooking {
    Service? service;
    int? bookingPrice;

    ServiceBooking({
        this.service,
        this.bookingPrice,
    });

    ServiceBooking copyWith({
        Service? service,
        int? bookingPrice,
    }) => 
        ServiceBooking(
            service: service ?? this.service,
            bookingPrice: bookingPrice ?? this.bookingPrice,
        );

    factory ServiceBooking.fromJson(Map<String, dynamic> json) => ServiceBooking(
        service: json["service"] == null ? null : Service.fromJson(json["service"]),
        bookingPrice: json["bookingPrice"],
    );

    Map<String, dynamic> toJson() => {
        "service": service?.toJson(),
        "bookingPrice": bookingPrice,
    };
}

class Service {
    String? id;
    String? name;
    String? description;
    String? type;
    int? price;
    List<dynamic>? listImages;
    String? status;
    CategoryResponse? categoryResponse;
    ServiceSupplierResponse? serviceSupplierResponse;
    dynamic promotionService;

    Service({
        this.id,
        this.name,
        this.description,
        this.type,
        this.price,
        this.listImages,
        this.status,
        this.categoryResponse,
        this.serviceSupplierResponse,
        this.promotionService,
    });

    Service copyWith({
        String? id,
        String? name,
        String? description,
        String? type,
        int? price,
        List<dynamic>? listImages,
        String? status,
        CategoryResponse? categoryResponse,
        ServiceSupplierResponse? serviceSupplierResponse,
        dynamic promotionService,
    }) => 
        Service(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            type: type ?? this.type,
            price: price ?? this.price,
            listImages: listImages ?? this.listImages,
            status: status ?? this.status,
            categoryResponse: categoryResponse ?? this.categoryResponse,
            serviceSupplierResponse: serviceSupplierResponse ?? this.serviceSupplierResponse,
            promotionService: promotionService ?? this.promotionService,
        );

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        price: json["price"],
        listImages: json["listImages"] == null ? [] : List<dynamic>.from(json["listImages"]!.map((x) => x)),
        status: json["status"],
        categoryResponse: json["categoryResponse"] == null ? null : CategoryResponse.fromJson(json["categoryResponse"]),
        serviceSupplierResponse: json["serviceSupplierResponse"] == null ? null : ServiceSupplierResponse.fromJson(json["serviceSupplierResponse"]),
        promotionService: json["promotionService"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
        "price": price,
        "listImages": listImages == null ? [] : List<dynamic>.from(listImages!.map((x) => x)),
        "status": status,
        "categoryResponse": categoryResponse?.toJson(),
        "serviceSupplierResponse": serviceSupplierResponse?.toJson(),
        "promotionService": promotionService,
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

class ServiceSupplierResponse {
    String? id;
    String? supplierName;
    String? contactPersonName;
    String? contactPhone;
    String? contactEmail;
    String? status;

    ServiceSupplierResponse({
        this.id,
        this.supplierName,
        this.contactPersonName,
        this.contactPhone,
        this.contactEmail,
        this.status,
    });

    ServiceSupplierResponse copyWith({
        String? id,
        String? supplierName,
        String? contactPersonName,
        String? contactPhone,
        String? contactEmail,
        String? status,
    }) => 
        ServiceSupplierResponse(
            id: id ?? this.id,
            supplierName: supplierName ?? this.supplierName,
            contactPersonName: contactPersonName ?? this.contactPersonName,
            contactPhone: contactPhone ?? this.contactPhone,
            contactEmail: contactEmail ?? this.contactEmail,
            status: status ?? this.status,
        );

    factory ServiceSupplierResponse.fromJson(Map<String, dynamic> json) => ServiceSupplierResponse(
        id: json["id"],
        supplierName: json["supplierName"],
        contactPersonName: json["contactPersonName"],
        contactPhone: json["contactPhone"],
        contactEmail: json["contactEmail"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "supplierName": supplierName,
        "contactPersonName": contactPersonName,
        "contactPhone": contactPhone,
        "contactEmail": contactEmail,
        "status": status,
    };
}
