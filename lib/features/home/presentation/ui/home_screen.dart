import 'package:flutter/material.dart';
import 'package:flutter_chat_app_with_firebase/core/utils/bloc_util.dart';
import 'package:flutter_chat_app_with_firebase/core/widgets/app_scaffold.dart';
import 'package:flutter_chat_app_with_firebase/features/auth/presentation/bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              BlocUtil.of<AuthBloc>(context).add(const LogoutRequestEvent());
            },
          ),
        ],
      ),
    );
  }
}
