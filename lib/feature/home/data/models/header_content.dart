import 'package:sportzenzehra/feature/home/data/models/category_model.dart';

class HeaderContent {
  final List<CategoryModel> cards;
  final bool showCitySelection;
  final bool showBranchSelection;

  HeaderContent({
    required this.cards,
    required this.showCitySelection,
    required this.showBranchSelection,
  });
}
