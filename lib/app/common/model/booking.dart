// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

const pendingStatus = 'PENDING';
const cancelStatus = 'CANCEL';
const confirmStatus = 'CONFIRMED';
const completeSatus = 'COMPLETED';

//Status Serivce
// PENDING - APPROVED- CANCLE - REJECT - PROCESSING - COMPLETED
const pendingStatusService = 'PENDING';
const approvedStatusService = 'APPROVED';
const cancelStatusService = 'CANCELLED';
const rejectStatusService = 'REJECTED';
const processingStatusService = 'PROCESSING';
const completedStatusService = 'COMPLETED';




// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

class Booking {
  String? id;
  Couple? couple;
  List<ListBookingDetail>? listBookingDetail;
  String? note;
  double? totalPrice;
  DateTime? createdAt;
  String? status;

  Booking({
    this.id,
    this.couple,
    this.listBookingDetail,
    this.note,
    this.totalPrice,
    this.createdAt,
    this.status,
  });

  Booking copyWith({
    String? id,
    Couple? couple,
    List<ListBookingDetail>? listBookingDetail,
    String? note,
    double? totalPrice,
    DateTime? createdAt,
    String? status,
  }) =>
      Booking(
        id: id ?? this.id,
        couple: couple ?? this.couple,
        listBookingDetail: listBookingDetail ?? this.listBookingDetail,
        note: note ?? this.note,
        totalPrice: totalPrice ?? this.totalPrice,
        createdAt: createdAt ?? this.createdAt,
        status: status ?? this.status,
      );

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        couple: json["couple"] == null ? null : Couple.fromJson(json["couple"]),
        listBookingDetail: json["listBookingDetail"] == null
            ? []
            : List<ListBookingDetail>.from(json["listBookingDetail"]!
                .map((x) => ListBookingDetail.fromJson(x))),
        note: json["note"],
        totalPrice: json["totalPrice"]?.toDouble(),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "couple": couple?.toJson(),
        "listBookingDetail": listBookingDetail == null
            ? []
            : List<dynamic>.from(listBookingDetail!.map((x) => x.toJson())),
        "note": note,
        "totalPrice": totalPrice,
        "createdAt": createdAt?.toIso8601String(),
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
        weddingDate: json["weddingDate"] == null
            ? null
            : DateTime.parse(json["weddingDate"]),
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "partnerName1": partnerName1,
        "partnerName2": partnerName2,
        "status": status,
        "weddingDate":
            "${weddingDate!.year.toString().padLeft(4, '0')}-${weddingDate!.month.toString().padLeft(2, '0')}-${weddingDate!.day.toString().padLeft(2, '0')}",
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

class ListBookingDetail {
  ServiceSupplier? serviceSupplier;
  String? id;
  double? price;
  String? note;
  DateTime? completedDate;
  String? status;
  dynamic promotionServiceSupplier;

  ListBookingDetail({
    this.serviceSupplier,
    this.id,
    this.price,
    this.note,
    this.completedDate,
    this.status,
    this.promotionServiceSupplier,
  });

  ListBookingDetail copyWith({
    ServiceSupplier? serviceSupplier,
    String? id,
    double? price,
    String? note,
    DateTime? completedDate,
    String? status,
    dynamic promotionServiceSupplier,
  }) =>
      ListBookingDetail(
        serviceSupplier: serviceSupplier ?? this.serviceSupplier,
        id: id ?? this.id,
        price: price ?? this.price,
        note: note ?? this.note,
        completedDate: completedDate ?? this.completedDate,
        status: status ?? this.status,
        promotionServiceSupplier:
            promotionServiceSupplier ?? this.promotionServiceSupplier,
      );

  factory ListBookingDetail.fromJson(Map<String, dynamic> json) =>
      ListBookingDetail(
        serviceSupplier: json["serviceSupplier"] == null
            ? null
            : ServiceSupplier.fromJson(json["serviceSupplier"]),
        id: json["id"],
        price: json["price"]?.toDouble(),
        note: json["note"],
        completedDate: json["completedDate"] == null
            ? null
            : DateTime.parse(json["completedDate"]),
        status: json["status"],
        promotionServiceSupplier: json["promotionServiceSupplier"],
      );

  Map<String, dynamic> toJson() => {
        "serviceSupplier": serviceSupplier?.toJson(),
        "id": id,
        "price": price,
        "note": note,
        "completedDate":
            "${completedDate!.year.toString().padLeft(4, '0')}-${completedDate!.month.toString().padLeft(2, '0')}-${completedDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "promotionServiceSupplier": promotionServiceSupplier,
      };
}

class ServiceSupplier {
  String? id;
  String? name;
  String? description;
  double? rating;
  List<String>? listImages;
  String? type;
  DateTime? createAt;
  double? price;
  String? status;
  SupplierResponse? supplierResponse;
  ServiceResponse? serviceResponse;
  dynamic promotion;

  ServiceSupplier({
    this.id,
    this.name,
    this.description,
    this.rating,
    this.listImages,
    this.type,
    this.createAt,
    this.price,
    this.status,
    this.supplierResponse,
    this.serviceResponse,
    this.promotion,
  });

  ServiceSupplier copyWith({
    String? id,
    String? name,
    String? description,
    double? rating,
    List<String>? listImages,
    String? type,
    DateTime? createAt,
    double? price,
    String? status,
    SupplierResponse? supplierResponse,
    ServiceResponse? serviceResponse,
    dynamic promotion,
  }) =>
      ServiceSupplier(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        rating: rating ?? this.rating,
        listImages: listImages ?? this.listImages,
        type: type ?? this.type,
        createAt: createAt ?? this.createAt,
        price: price ?? this.price,
        status: status ?? this.status,
        supplierResponse: supplierResponse ?? this.supplierResponse,
        serviceResponse: serviceResponse ?? this.serviceResponse,
        promotion: promotion ?? this.promotion,
      );

  factory ServiceSupplier.fromJson(Map<String, dynamic> json) =>
      ServiceSupplier(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        listImages: json["listImages"] == null
            ? []
            : List<String>.from(json["listImages"]!.map((x) => x)),
        type: json["type"],
        createAt:
            json["createAt"] == null ? null : DateTime.parse(json["createAt"]),
        price: json["price"]?.toDouble(),
        status: json["status"],
        supplierResponse: json["supplierResponse"] == null
            ? null
            : SupplierResponse.fromJson(json["supplierResponse"]),
        serviceResponse: json["serviceResponse"] == null
            ? null
            : ServiceResponse.fromJson(json["serviceResponse"]),
        promotion: json["promotion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "rating": rating,
        "listImages": listImages == null
            ? []
            : List<dynamic>.from(listImages!.map((x) => x)),
        "type": type,
        "createAt": createAt?.toIso8601String(),
        "price": price,
        "status": status,
        "supplierResponse": supplierResponse?.toJson(),
        "serviceResponse": serviceResponse?.toJson(),
        "promotion": promotion,
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

  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      ServiceResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createAt:
            json["createAt"] == null ? null : DateTime.parse(json["createAt"]),
        listImages: json["listImages"] == null
            ? []
            : List<String>.from(json["listImages"]!.map((x) => x)),
        categoryResponse: json["categoryResponse"] == null
            ? null
            : CategoryResponse.fromJson(json["categoryResponse"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createAt": createAt?.toIso8601String(),
        "listImages": listImages == null
            ? []
            : List<dynamic>.from(listImages!.map((x) => x)),
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

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
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

class SupplierResponse {
  String? supplierId;
  dynamic image;
  String? supplierName;
  String? contactPersonName;
  String? contactPhone;
  String? contactEmail;
  Area? area;

  SupplierResponse({
    this.supplierId,
    this.image,
    this.supplierName,
    this.contactPersonName,
    this.contactPhone,
    this.contactEmail,
    this.area,
  });

  SupplierResponse copyWith({
    String? supplierId,
    dynamic image,
    String? supplierName,
    String? contactPersonName,
    String? contactPhone,
    String? contactEmail,
    Area? area,
  }) =>
      SupplierResponse(
        supplierId: supplierId ?? this.supplierId,
        image: image ?? this.image,
        supplierName: supplierName ?? this.supplierName,
        contactPersonName: contactPersonName ?? this.contactPersonName,
        contactPhone: contactPhone ?? this.contactPhone,
        contactEmail: contactEmail ?? this.contactEmail,
        area: area ?? this.area,
      );

  factory SupplierResponse.fromJson(Map<String, dynamic> json) =>
      SupplierResponse(
        supplierId: json["supplierId"],
        image: json["image"],
        supplierName: json["supplierName"],
        contactPersonName: json["contactPersonName"],
        contactPhone: json["contactPhone"],
        contactEmail: json["contactEmail"],
        area: json["area"] == null ? null : Area.fromJson(json["area"]),
      );

  Map<String, dynamic> toJson() => {
        "supplierId": supplierId,
        "image": image,
        "supplierName": supplierName,
        "contactPersonName": contactPersonName,
        "contactPhone": contactPhone,
        "contactEmail": contactEmail,
        "area": area?.toJson(),
      };
}

class Area {
  String? id;
  String? province;
  String? district;
  String? ward;
  String? apartmentNumber;
  String? status;

  Area({
    this.id,
    this.province,
    this.district,
    this.ward,
    this.apartmentNumber,
    this.status,
  });

  Area copyWith({
    String? id,
    String? province,
    String? district,
    String? ward,
    String? apartmentNumber,
    String? status,
  }) =>
      Area(
        id: id ?? this.id,
        province: province ?? this.province,
        district: district ?? this.district,
        ward: ward ?? this.ward,
        apartmentNumber: apartmentNumber ?? this.apartmentNumber,
        status: status ?? this.status,
      );

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        province: json["province"],
        district: json["district"],
        ward: json["ward"],
        apartmentNumber: json["apartmentNumber"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province": province,
        "district": district,
        "ward": ward,
        "apartmentNumber": apartmentNumber,
        "status": status,
      };
}
