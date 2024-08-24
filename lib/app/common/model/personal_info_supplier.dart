// To parse this JSON data, do
//
//     final personalInforSupplier = personalInforSupplierFromJson(jsonString);

import 'dart:convert';

PersonalInforSupplier personalInforSupplierFromJson(String str) => PersonalInforSupplier.fromJson(json.decode(str));

String personalInforSupplierToJson(PersonalInforSupplier data) => json.encode(data.toJson());

class PersonalInforSupplier {
    String? supplierId;
    dynamic image;
    String? supplierName;
    String? contactPersonName;
    String? contactPhone;
    String? contactEmail;
    Area? area;

    PersonalInforSupplier({
        this.supplierId,
        this.image,
        this.supplierName,
        this.contactPersonName,
        this.contactPhone,
        this.contactEmail,
        this.area,
    });

    PersonalInforSupplier copyWith({
        String? supplierId,
        dynamic image,
        String? supplierName,
        String? contactPersonName,
        String? contactPhone,
        String? contactEmail,
        Area? area,
    }) => 
        PersonalInforSupplier(
            supplierId: supplierId ?? this.supplierId,
            image: image ?? this.image,
            supplierName: supplierName ?? this.supplierName,
            contactPersonName: contactPersonName ?? this.contactPersonName,
            contactPhone: contactPhone ?? this.contactPhone,
            contactEmail: contactEmail ?? this.contactEmail,
            area: area ?? this.area,
        );

    factory PersonalInforSupplier.fromJson(Map<String, dynamic> json) => PersonalInforSupplier(
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
    String? fullAddress;

    Area({
        this.id,
        this.province,
        this.district,
        this.ward,
        this.apartmentNumber,
        this.status,
        this.fullAddress
    });

    Area copyWith({
        String? id,
        String? province,
        String? district,
        String? ward,
        String? apartmentNumber,
        String? status,
        String? fullAddress
    }) => 
        Area(
            id: id ?? this.id,
            province: province ?? this.province,
            district: district ?? this.district,
            ward: ward ?? this.ward,
            apartmentNumber: apartmentNumber ?? this.apartmentNumber,
            status: status ?? this.status,
            fullAddress: ''
        );

    factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        province: json["province"],
        district: json["district"],
        ward: json["ward"],
        apartmentNumber: json["apartmentNumber"],
        status: json["status"],
        fullAddress: '${json["apartmentNumber"]}, ${json["ward"]}, ${json["district"]}, ${json["province"]}'
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
