// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/settings/provider/settings_provider.dart';
import 'package:sportzenzehra/feature/settings/view/widgets/finance_payment_dialog.dart';

class FinanceView extends ConsumerStatefulWidget {
  const FinanceView({super.key});

  @override
  ConsumerState<FinanceView> createState() => _FinanceViewState();
}

class _FinanceViewState extends ConsumerState<FinanceView> {
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedValue = ref.watch(clubSelectionProvider);
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kulüp Seçin",
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
                  onChanged: (value) {
                    ref
                        .read(clubSelectionProvider.notifier)
                        .selectionClub(value);
                  },
                  dropdownColor: Colors.white,
                  elevation: 6,
                ),
              ),
            ),
            SizedBox(height: 15),
            if (selectedValue != null)
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hesap Bakiyeniz",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 1),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.backgroundGrey,
                      border: Border.all(color: AppColors.opacitygrey),
                    ),
                    child: Center(
                      child: Text(
                        "0,00 ₺",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.secondary,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.backgroundGrey,
                      border: Border.all(color: AppColors.opacitygrey),
                    ),
                    child: Center(
                      child: Text(
                        "Ödemelerinizde bir problem olduğunu düşünüyorsanız lütfen kulübünüzle iletişime geçiniz.",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.black50,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "İşlemler",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.backgroundGrey,
                      border: Border.all(color: AppColors.opacitygrey),
                    ),
                    child: Center(
                      child: Text(
                        "Sistemde kayıtlı işlem bulunmamaktadır",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      final tutar = TextEditingController();
                      showDialog(
                        context: context,
                        builder: (context) => FinancePaymentDialog(
                          formKey: _formKey2,
                          tutar: tutar,
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Center(
                        child: Text(
                          "Ödeme Yap",
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
