import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:preferences/preferences.dart';
import '../../../generated/l10n.dart';
import '../bloc/userinfo_bloc.dart';
// AppBar personnalisée
class UserInfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserInfoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      elevation: 0,
      title: const SizedBox.shrink(),
      centerTitle: true,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(50);
}
// Section du logo
class LogoSection extends StatelessWidget {
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          FoundationAssets.F1logo, // Remplacez par le chemin de votre image
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
// Section des titres
class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Text(
          S.current.lets_get_familiar,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          S.current.intoduce_yourself,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
// Section des champs de saisie
class InputFieldsSection extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  const InputFieldsSection({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserinfoBloc>();

    return Column(
      children: [
        TextField(
          controller: firstNameController,
          decoration: InputDecoration(
            labelText: S.current.first_name,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) {
            bloc.add(firstnameChanged(value));
          },
        ),
        const SizedBox(height: 15),
        TextField(
          controller: lastNameController,
          decoration: InputDecoration(
            labelText:S.current.last_name ,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) {
            bloc.add(lastnameChanged(value));
          },
        ),
      ],
    );
  }
}

// Bouton "Next"
class NextButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const NextButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserinfoBloc, UserinfoState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: state.status == FormzStatus.submissionInProgress
              ? const CircularProgressIndicator(color: Colors.white)
              :  Text(
            S.current.next
              ,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}

