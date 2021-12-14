// To parse this JSON data, do
//
//     final myOrderModel = myOrderModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class FoodModel {
  FoodModel({
    required this.success,
    required this.pagination,
    required this.data,
  });

  bool success;
  Pagination pagination;
  Data data;

  factory FoodModel.fromJson(String str) => FoodModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FoodModel.fromMap(Map<String, dynamic> json) => FoodModel(
        success: json["success"],
        pagination: Pagination.fromMap(json["pagination"]),
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "pagination": pagination.toMap(),
        "data": data.toMap(),
      };
}

class Data {
  Data({
    required this.branch,
    required this.restaurant,
  });

  Branch branch;
  List<Restaurant> restaurant;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        branch: Branch.fromMap(json["branch"]),
        restaurant: List<Restaurant>.from(
            json["restaurant"].map((x) => Restaurant.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "branch": branch.toMap(),
        "restaurant": List<dynamic>.from(restaurant.map((x) => x.toMap())),
      };
}

class Branch {
  Branch({
    required this.id,
    required this.location,
    required this.status,
    required this.name,
    required this.supportNumber,
    required this.offers,
    required this.branchBanner,
    required this.category,
    required this.distance,
  });

  String id;
  BranchLocation location;
  bool status;
  String name;
  int supportNumber;
  List<dynamic> offers;
  List<dynamic> branchBanner;
  List<Category> category;
  double distance;

  factory Branch.fromJson(String str) => Branch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Branch.fromMap(Map<String, dynamic> json) => Branch(
        id: json["_id"],
        location: BranchLocation.fromMap(json["location"]),
        status: json["status"],
        name: json["name"],
        supportNumber: json["supportNumber"],
        offers: List<dynamic>.from(json["offers"].map((x) => x)),
        branchBanner: List<dynamic>.from(json["branchBanner"].map((x) => x)),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromMap(x))),
        distance: json["distance"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "location": location.toMap(),
        "status": status,
        "name": name,
        "supportNumber": supportNumber,
        "offers": List<dynamic>.from(offers.map((x) => x)),
        "branchBanner": List<dynamic>.from(branchBanner.map((x) => x)),
        "category": List<dynamic>.from(category.map((x) => x.toMap())),
        "distance": distance,
      };
}

class Category {
  Category({
    required this.status,
    required this.id,
    required this.category,
    required this.position,
    required this.image,
    required this.bannerImage,
    required this.name,
    required this.v,
  });

  bool status;
  String id;
  String category;
  int position;
  StoreBg image;
  StoreBg bannerImage;
  String name;
  int v;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        status: json["status"],
        id: json["_id"],
        category: json["category"],
        position: json["position"],
        image: StoreBg.fromMap(json["image"]),
        bannerImage: StoreBg.fromMap(json["bannerImage"]),
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "_id": id,
        "category": category,
        "position": position,
        "image": image.toMap(),
        "bannerImage": bannerImage.toMap(),
        "name": name,
        "__v": v,
      };
}

class StoreBg {
  StoreBg({
    required this.key,
    required this.location,
  });

  String key;
  String location;

  factory StoreBg.fromJson(String str) => StoreBg.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoreBg.fromMap(Map<String, dynamic> json) => StoreBg(
        key: json["key"],
        location: json["location"],
      );

  Map<String, dynamic> toMap() => {
        "key": key,
        "location": location,
      };
}

class BranchLocation {
  BranchLocation({
    required this.type,
    required this.coordinates,
    required this.address,
  });

  String type;
  List<double> coordinates;
  String address;

  factory BranchLocation.fromJson(String str) =>
      BranchLocation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BranchLocation.fromMap(Map<String, dynamic> json) => BranchLocation(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "address": address,
      };
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.location,
    required this.storeStatus,
    required this.name,
    required this.branch,
    required this.storeBg,
    required this.openTime,
    required this.closeTime,
    required this.cuisine,
    required this.selfPickup,
    required this.sortOrder,
    required this.avgPersonAmt,
    required this.distance,
  });

  String id;
  RestaurantLocation location;
  bool storeStatus;
  String name;
  String branch;
  StoreBg storeBg;
  String openTime;
  String closeTime;
  String cuisine;
  bool selfPickup;
  int sortOrder;
  dynamic avgPersonAmt;
  double distance;

  factory Restaurant.fromJson(String str) =>
      Restaurant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        id: json["_id"],
        location: RestaurantLocation.fromMap(json["location"]),
        storeStatus: json["storeStatus"],
        name: json["name"],
        branch: json["branch"],
        storeBg: StoreBg.fromMap(json["storeBg"]),
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        cuisine: json["cuisine"],
        selfPickup: json["selfPickup"],
        sortOrder: json["sortOrder"],
        avgPersonAmt:
            json["avgPersonAmt"] == null ? null : json["avgPersonAmt"],
        distance: json["distance"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "location": location.toMap(),
        "storeStatus": storeStatus,
        "name": name,
        "branch": branch,
        "storeBg": storeBg.toMap(),
        "openTime": openTime,
        "closeTime": closeTime,
        "cuisine": cuisine,
        "selfPickup": selfPickup,
        "sortOrder": sortOrder,
        "avgPersonAmt": avgPersonAmt == null ? null : avgPersonAmt,
        "distance": distance,
      };
}

class RestaurantLocation {
  RestaurantLocation({
    required this.address,
  });

  String address;

  factory RestaurantLocation.fromJson(String str) =>
      RestaurantLocation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantLocation.fromMap(Map<String, dynamic> json) =>
      RestaurantLocation(
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "address": address,
      };
}

class Pagination {
  Pagination();

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination();

  Map<String, dynamic> toMap() => {};
}
