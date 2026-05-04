// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Stream型は扱いにくいので，一旦ProviderでRiverpodのエコシステムにぶち込む

@ProviderFor(diaryStream)
const diaryStreamProvider = DiaryStreamProvider._();

/// Stream型は扱いにくいので，一旦ProviderでRiverpodのエコシステムにぶち込む

final class DiaryStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Diary>>,
          List<Diary>,
          Stream<List<Diary>>
        >
    with $FutureModifier<List<Diary>>, $StreamProvider<List<Diary>> {
  /// Stream型は扱いにくいので，一旦ProviderでRiverpodのエコシステムにぶち込む
  const DiaryStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'diaryStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$diaryStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<Diary>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Diary>> create(Ref ref) {
    return diaryStream(ref);
  }
}

String _$diaryStreamHash() => r'43df5c7af1e1c19121c8d98a10d9f090a2d40553';

/// Stream型は扱いにくいので，一旦ProviderでRiverpodのエコシステムにぶち込んで，AsyncValueを変換して，元の形に直す

@ProviderFor(diaryList)
const diaryListProvider = DiaryListProvider._();

/// Stream型は扱いにくいので，一旦ProviderでRiverpodのエコシステムにぶち込んで，AsyncValueを変換して，元の形に直す

final class DiaryListProvider
    extends $FunctionalProvider<List<Diary>, List<Diary>, List<Diary>>
    with $Provider<List<Diary>> {
  /// Stream型は扱いにくいので，一旦ProviderでRiverpodのエコシステムにぶち込んで，AsyncValueを変換して，元の形に直す
  const DiaryListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'diaryListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$diaryListHash();

  @$internal
  @override
  $ProviderElement<List<Diary>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Diary> create(Ref ref) {
    return diaryList(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Diary> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Diary>>(value),
    );
  }
}

String _$diaryListHash() => r'c1dc454f576ab40cc14a4a633aaeba01e4a520a7';

@ProviderFor(HomeNotifier)
const homeProvider = HomeNotifierProvider._();

final class HomeNotifierProvider
    extends $AsyncNotifierProvider<HomeNotifier, List<Diary>> {
  const HomeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeNotifierHash();

  @$internal
  @override
  HomeNotifier create() => HomeNotifier();
}

String _$homeNotifierHash() => r'28e781e9b897cf6482afa31ad8847fd296085534';

abstract class _$HomeNotifier extends $AsyncNotifier<List<Diary>> {
  FutureOr<List<Diary>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Diary>>, List<Diary>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Diary>>, List<Diary>>,
              AsyncValue<List<Diary>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(diaryFamily)
const diaryFamilyProvider = DiaryFamilyFamily._();

final class DiaryFamilyProvider extends $FunctionalProvider<Diary, Diary, Diary>
    with $Provider<Diary> {
  const DiaryFamilyProvider._({
    required DiaryFamilyFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'diaryFamilyProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$diaryFamilyHash();

  @override
  String toString() {
    return r'diaryFamilyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Diary> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Diary create(Ref ref) {
    final argument = this.argument as String;
    return diaryFamily(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Diary value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Diary>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DiaryFamilyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$diaryFamilyHash() => r'e9b486e3d5e59f5bc22fe1696bcca891f781c3fb';

final class DiaryFamilyFamily extends $Family
    with $FunctionalFamilyOverride<Diary, String> {
  const DiaryFamilyFamily._()
    : super(
        retry: null,
        name: r'diaryFamilyProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DiaryFamilyProvider call(String id) =>
      DiaryFamilyProvider._(argument: id, from: this);

  @override
  String toString() => r'diaryFamilyProvider';
}
