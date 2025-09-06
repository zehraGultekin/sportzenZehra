import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';

//final profileCityProvider = StateProvider<String?>((ref) => null);
final imagePickerProvider = StateProvider<XFile?>((ref) => null);

final profileCityProvider =
    StateNotifierProvider<SelectedCityNotifier, String?>(
      (ref) => SelectedCityNotifier(),
    );
