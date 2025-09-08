import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/core/widgets/city_selection_modal.dart';
import 'package:sportzenzehra/feature/settings/provider/settings_provider.dart';
import 'package:sportzenzehra/feature/settings/view/widgets/profile_textfied_widget.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  TextEditingController cityController = TextEditingController();
  TextEditingController adresController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final image = ref.watch(imagePickerProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Profil",
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.secondary,
            size: 20,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            Stack(
              children: [
                ClipOval(
                  child: image == null
                      ? Image.asset(
                          "assets/images/user.png",
                          height: 180,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(image.path),
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                ),

                Positioned(
                  bottom: 40,
                  left: 110,
                  child: GestureDetector(
                    onTap: ref
                        .read(imagePickerProvider.notifier)
                        .pickFromGallery,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 10,
                  left: 40,
                  child: Text(
                    "Zehra Gültekin",
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),

            ProfileTextField(
              enabled: false,
              preffixIcon: Icons.mail,
              label: "Mail",
              initialValue: "zehragltekin10@gmail.com",
            ),
            ProfileTextField(
              enabled: false,
              preffixIcon: Icons.phone,
              label: "Telefon",
              initialValue: "05519329535",
            ),
            ProfileTextField(
              enabled: false,
              preffixIcon: Icons.flag,
              label: "Ülke",
              initialValue: "Türkiye",
            ),
            Consumer(
              builder: (context, ref, child) {
                final selectedCity = ref.watch(profileCityProvider);
                cityController.text = selectedCity ?? "Şehir";
                return ProfileTextField(
                  enabled: true,
                  preffixIcon: Icons.location_city,
                  controller: cityController,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SelectionCityModal(profileCityProvider);
                      },
                    );
                  },
                );
              },
            ),
            ProfileTextField(
              enabled: false,
              initialValue: "Belirtilmemiş",
              label: "Cinsiyet",
              preffixIcon: Icons.family_restroom_outlined,
            ),
            ProfileTextField(
              enabled: true,
              initialValue: "Adres",
              preffixIcon: Icons.location_city,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Center(
                  child: Text(
                    "Kaydet",
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
