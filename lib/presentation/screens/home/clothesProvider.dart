import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'homeScreen.dart';
part 'clothesProvider.g.dart';

List<WearableItem> getFakeWearableItems() {
  return [
    WearableItem(
      imagePath: "https://hourscollection.com/cdn/shop/files/DropShoulderT-shirt-RoyalBlue-product_700x.jpg?v=1762198064",
      name: "Drop Shoulder T-Shirt",
      description: "Lightweight running shoes designed for maximum comfort and performance.",
      price: 39.99,
      type: WearType.tShirt,
      rate: 3,
      reviewsCount: 150,
      size: "S"
    ),
    WearableItem(
      imagePath: "https://hourscollection.com/cdn/shop/files/DropShoulderHoodie-VintageBlack-ClipTag2_700x.png?v=1762199711",
      name: "Drop Shoulder Hoodie",
      description: "A timeless blue t-shirt made from breathable cotton for everyday wear.",
      price: 69.99,
      type: WearType.hoodie,
      rate:4.5,
      reviewsCount: 155,
      size: "L"
    ),
    WearableItem(
      imagePath: "https://hourscollection.com/cdn/shop/files/GreyArcHoodie_700x.jpg?v=1766599721",
      name: "Arc Zip Hoodie",
      description: "Performance t-shirt with moisture-wicking fabric for an active lifestyle.",
      price: 600,
      type: WearType.hoodie,
      rate: 4.8,
      reviewsCount: 95,
      size: "M"
    ),
    WearableItem(
      imagePath: "https://hourscollection.com/cdn/shop/files/BaggySweatpants-VintageGrey_2_700x.png?v=1762199978",
      name: "Baggy Sweatpants",
      description: "Comfortable and stylish slim fit pants suitable for work or casual outings.",
      price: 74.5,
      type: WearType.pants,
      rate: 4.9,
      reviewsCount: 70,
      size: "S"
    ),

  ];
}
List<WearableItem> getFakeCartItems() {
  return [
    WearableItem(
      imagePath: "https://hourscollection.com/cdn/shop/files/DropShoulderT-shirt-RoyalBlue-product_700x.jpg?v=1762198064",
      name: "Drop Shoulder T-Shirt",
      description: "Lightweight running shoes designed for maximum comfort and performance.",
      price: 40,
      type: WearType.tShirt,
      rate: 3,
      reviewsCount: 150,
      size: "L"
    ),
    WearableItem(
        imagePath: "https://hourscollection.com/cdn/shop/files/DropShoulderT-shirt-RoyalBlue-product_700x.jpg?v=1762198064",
        name: "Drop Shoulder T-Shirt",
        description: "Lightweight running shoes designed for maximum comfort and performance.",
        price: 40,
        type: WearType.tShirt,
        rate: 3,
        reviewsCount: 150,
        size: "L"
    ),
    WearableItem(
        imagePath: "https://hourscollection.com/cdn/shop/files/DropShoulderT-shirt-RoyalBlue-product_700x.jpg?v=1762198064",
        name: "Drop Shoulder T-Shirt",
        description: "Lightweight running shoes designed for maximum comfort and performance.",
        price: 40,
        type: WearType.tShirt,
        rate: 3,
        reviewsCount: 150,
        size: "L"
    ),
    WearableItem(
      imagePath: "https://hourscollection.com/cdn/shop/files/DropShoulderHoodie-VintageBlack-ClipTag2_700x.png?v=1762199711",
      name: "Drop Shoulder Hoodie",
      description: "A timeless blue t-shirt made from breathable cotton for everyday wear.",
      price: 70,
      type: WearType.hoodie,
      rate:4.5,
      reviewsCount: 155,
      size: "M"
    ),
  ];
}


// deprecated
@riverpod
List<WearableItem> allClothes(ref){
  return getFakeWearableItems();
}

// deprecated
@riverpod
List<WearableItem> cheapClothes(ref){
  return getFakeWearableItems().where((p) => p.price < 1000).toList();
}

@Riverpod(keepAlive: true)
class ClothesNotifier extends _$ClothesNotifier {


  @override
  ClothesState build(){
    return ClothesState(items: getFakeWearableItems(), selectedType: WearType.all,searchQuery: "",cartItems: getFakeCartItems());
  }

  void selectCategory(WearType type){
    if(type != WearType.all){
      state = ClothesState(items: getFakeWearableItems().where((wear) => wear.type == type && wear.name.toLowerCase().contains(state.searchQuery.toLowerCase())).toList(), selectedType: type, searchQuery: state.searchQuery,cartItems: getFakeCartItems());
    }else{
      state = ClothesState(items: getFakeWearableItems(), selectedType: type, searchQuery: state.searchQuery,cartItems: getFakeCartItems());
    }
  }

  void searchForWear(String query){
    state = state.copyWith(searchQuery: query);
    if(query == ""){
      print("selected wear type is: ${state.selectedType}");
      if(state.selectedType == WearType.all) {
        state = state.copyWith(items: getFakeWearableItems());
      } else {
        state = state.copyWith(items: getFakeWearableItems().where((wear) => wear.type == state.selectedType).toList());
      }
    }
    else{
      final cleanQuery = query.trim().toLowerCase();
      state = state.copyWith(
        items: state.items
            .where((wear) => wear.name.toLowerCase().contains(cleanQuery))
            .toList(),
      );
    }
  }

  void updateCartItems(List<WearableItem> wearableItems){
    state = state.copyWith(cartItems: wearableItems);
  }

}

class ClothesState {
  final List<WearableItem> items;
  final WearType selectedType;
  final String searchQuery;
  final List<WearableItem> cartItems;

  ClothesState({
    required this.items,
    required this.selectedType,
    required this.searchQuery,
    required this.cartItems,
  });

  ClothesState copyWith({
    List<WearableItem>? items,
    WearType? selectedType,
    String? searchQuery,
    List<WearableItem>? cartItems,
  }) {
    return ClothesState(
      items: items ?? this.items,
      selectedType: selectedType ?? this.selectedType,
      searchQuery: searchQuery ?? this.searchQuery,
      cartItems: cartItems ?? this.cartItems
    );
  }
}