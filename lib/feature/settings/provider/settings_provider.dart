import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';

final imagePickerProvider = StateNotifierProvider<ImagePickerNotifier, XFile?>(
  (ref) => ImagePickerNotifier(),
);

final profileCityProvider =
    StateNotifierProvider<SelectedCityNotifier, String?>(
      (ref) => SelectedCityNotifier(),
    );

class ImagePickerNotifier extends StateNotifier<XFile?> {
  ImagePickerNotifier() : super(null);

  final ImagePicker _picker = ImagePicker();

  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      state = image;
    }
  }
}

class ClubSelectionNotifier extends StateNotifier<String?> {
  ClubSelectionNotifier() : super(null);

  void selectionClub(String? club) {
    state = club;
  }
}

final clubSelectionProvider =
    StateNotifierProvider<ClubSelectionNotifier, String?>(
      (ref) => ClubSelectionNotifier(),
    );
