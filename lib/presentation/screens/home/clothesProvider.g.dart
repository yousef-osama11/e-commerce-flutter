// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothesProvider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allClothes)
final allClothesProvider = AllClothesProvider._();

final class AllClothesProvider
    extends
        $FunctionalProvider<
          List<WearableItem>,
          List<WearableItem>,
          List<WearableItem>
        >
    with $Provider<List<WearableItem>> {
  AllClothesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allClothesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allClothesHash();

  @$internal
  @override
  $ProviderElement<List<WearableItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<WearableItem> create(Ref ref) {
    return allClothes(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WearableItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WearableItem>>(value),
    );
  }
}

String _$allClothesHash() => r'76097a02e8828768fe591880f7f1b15cb4a3e2cd';

@ProviderFor(cheapClothes)
final cheapClothesProvider = CheapClothesProvider._();

final class CheapClothesProvider
    extends
        $FunctionalProvider<
          List<WearableItem>,
          List<WearableItem>,
          List<WearableItem>
        >
    with $Provider<List<WearableItem>> {
  CheapClothesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cheapClothesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cheapClothesHash();

  @$internal
  @override
  $ProviderElement<List<WearableItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<WearableItem> create(Ref ref) {
    return cheapClothes(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WearableItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WearableItem>>(value),
    );
  }
}

String _$cheapClothesHash() => r'541bca05e3508e536248f296cb390887a038b7d9';

@ProviderFor(ClothesNotifier)
final clothesProvider = ClothesNotifierProvider._();

final class ClothesNotifierProvider
    extends $NotifierProvider<ClothesNotifier, ClothesState> {
  ClothesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clothesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clothesNotifierHash();

  @$internal
  @override
  ClothesNotifier create() => ClothesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClothesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClothesState>(value),
    );
  }
}

String _$clothesNotifierHash() => r'1f00fdfa0cc5c9b51845b3c24f8509d1197aa403';

abstract class _$ClothesNotifier extends $Notifier<ClothesState> {
  ClothesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ClothesState, ClothesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ClothesState, ClothesState>,
              ClothesState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
