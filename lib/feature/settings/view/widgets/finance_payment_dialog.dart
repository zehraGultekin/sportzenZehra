import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/settings/view/widgets/finance_error_dialog.dart';

class FinancePaymentDialog extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController tutar;

  const FinancePaymentDialog({
    super.key,
    required this.formKey,
    required this.tutar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: theme.colorScheme.surface,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 10,
            children: [
              Icon(
                Icons.credit_card,
                color: theme.colorScheme.secondary,
                size: 28,
              ),
              Text(
                "Ödeme Yap",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 25),
              ),
            ],
          ),
        ],
      ),
      content: Column(
        spacing: 15,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ödeme yapacağınız tutarı giriniz",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.black50,
            ),
          ),
          Form(
            key: formKey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tutar boş olamaz';
                }
                final int? amount = int.tryParse(value);
                if (amount == null) {
                  return 'Geçerli bir sayı giriniz';
                }
                if (amount < 20) {
                  return 'En az 20 ₺ ödeme yapabilirsiniz';
                }
                return null;
              },
              controller: tutar,
              decoration: InputDecoration(
                hintText: "Tutar (₺)",
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.black70,
                  fontSize: 16,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                filled: true,
                fillColor: AppColors.backgroundGrey,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.opacitygrey),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.opacitygrey),
                ),
              ),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.black70,
                fontSize: 16,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.blue.withValues(alpha: 0.1),
              border: Border.all(color: const Color(0xff3687d8)),
            ),
            child: Row(
              spacing: 5,
              children: [
                const Icon(
                  Icons.info_outline,
                  color: Color(0xff3687d8),
                  size: 20,
                ),
                Text(
                  "En az 20 ₺ ödeme yapabilirsiniz",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xff3687d8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffe0e0e0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "İptal",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.pop();
                          Future.delayed(Duration(milliseconds: 100), () {
                            showDialog(
                              context: context,
                              builder: (_) => FinanceErrorDialog(theme: theme),
                            );
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "İleri",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
