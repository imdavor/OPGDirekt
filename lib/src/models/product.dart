import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String vendorId,
    required String name,
    String? description,
    required double price,
    @Default('EUR') String currency,
    String? unit,
    @Default(<String>[]) List<String> tags,
    String? imageUrl,
    @Default(true) bool available,
    DateTime? updatedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
