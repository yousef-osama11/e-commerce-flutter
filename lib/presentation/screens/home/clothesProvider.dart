import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'homeScreen.dart';
part 'clothesProvider.g.dart';

List<WearableItem> getFakeWearableItems(){
  return [
    WearableItem(
      imagePath: "images/shoes.png",
      name: "Running Shoes",
      price: 1200,
      type: WearType.shoes,
    ),
    WearableItem(
      imagePath: "images/tshirt_blue.png",
      name: "Casual Sneakers Tee",
      price: 550,
      type: WearType.shoes,
    ),
    WearableItem(
      imagePath: "images/tshirt_blue.png",
      name: "Classic T-Shirt",
      price: 500,
      type: WearType.tShirt,
    ),
    WearableItem(
      imagePath: "images/shoes.png",
      name: "Sport Style T-Shirt",
      price: 600,
      type: WearType.tShirt,
    ),
    WearableItem(
      imagePath: "images/shoes.png",
      name: "Slim Fit Pants",
      price: 900,
      type: WearType.pants,
    ),
    WearableItem(
      imagePath: "images/tshirt_blue.png",
      name: "Cotton Pants",
      price: 750,
      type: WearType.pants,
    ),
    WearableItem(
      imagePath: "images/tshirt_blue.png",
      name: "Light Hoodie",
      price: 850,
      type: WearType.hoodie,
    ),
    WearableItem(
      imagePath: "images/shoes.png",
      name: "Winter Hoodie",
      price: 950,
      type: WearType.hoodie,
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
    return ClothesState(items: getFakeWearableItems(), selectedType: WearType.all,searchQuery: "");
  }

  void selectCategory(WearType type){
    if(type != WearType.all){
      state = ClothesState(items: getFakeWearableItems().where((wear) => wear.type == type && wear.name.toLowerCase().contains(state.searchQuery.toLowerCase())).toList(), selectedType: type, searchQuery: state.searchQuery);
    }else{
      state = ClothesState(items: getFakeWearableItems(), selectedType: type, searchQuery: state.searchQuery);
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

}

class ClothesState {
  final List<WearableItem> items;
  final WearType selectedType;
  final String searchQuery;

  ClothesState({
    required this.items,
    required this.selectedType,
    required this.searchQuery,
  });

  ClothesState copyWith({
    List<WearableItem>? items,
    WearType? selectedType,
    String? searchQuery,
  }) {
    return ClothesState(
      items: items ?? this.items,
      selectedType: selectedType ?? this.selectedType,
      searchQuery: searchQuery ?? this.searchQuery
    );
  }
}