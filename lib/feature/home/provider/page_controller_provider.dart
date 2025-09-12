import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageControllerNotifier extends StateNotifier<PageController> {
  PageControllerNotifier(Ref ref) : super(PageController()) {
    ref.onDispose(() {
      state.dispose();
    });
  }
}

final tournamePageProvider =
    StateNotifierProvider.autoDispose<PageControllerNotifier, PageController>(
      (ref) => PageControllerNotifier(ref),
    ); //autoDisposu provider artık kullanılmadığı için otomatik olarak kapatma , temizleme için kullandık.

final clubProvider =
    StateNotifierProvider.autoDispose<PageControllerNotifier, PageController>(
      (ref) => PageControllerNotifier(ref),
    );
