import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';

class FinanceView extends StatelessWidget {
  const FinanceView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String? selectedValue;
    final List<String> items = ["Applantis Tenis Kulübü"];
    return Scaffold(
      appBar: CustomAppBar(
        title: "Finans İşlemleri",
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.secondary,
            size: 20,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kulüp Seçin",
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.backgroundGrey,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.2),
                ),
              ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  underline: null,
                  hint: Text(
                    "Kulüp seçiniz",
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.black.withValues(alpha: 0.7),
                      fontSize: 15,
                    ),
                  ),
                  value: selectedValue,
                  items: items.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {},
                  dropdownColor: Colors.white,
                  elevation: 0,
                ),
              ),
            ),
            Text("Finans İşlemleri", style: theme.textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
