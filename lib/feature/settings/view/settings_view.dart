import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppBar(title: "Seçenekler"));
  }
}
