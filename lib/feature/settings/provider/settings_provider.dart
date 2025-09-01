import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final profileCityProvider = StateProvider<String?>((ref) => null);
final imagePickerProvider = StateProvider<XFile?>((ref) => null);
