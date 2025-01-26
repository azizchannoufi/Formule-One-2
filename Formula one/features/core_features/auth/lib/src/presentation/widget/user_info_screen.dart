import 'package:auth/src/presentation/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class UserInfoScreen extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final bool isValid;
  final VoidCallback? onSubmit;

  const UserInfoScreen({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
    required this.isValid,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            const LogoSection(),
            const SizedBox(height: 30),
            const TitleSection(),
            const SizedBox(height: 20),
            InputFieldsSection(
              firstNameController: firstNameController,
              lastNameController: lastNameController,
            ),
            const SizedBox(height: 30),
            NextButton(
              onPressed: isValid ? onSubmit : null,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
