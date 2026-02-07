import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app_with_firebase/app/router/routes.dart';
import 'package:flutter_chat_app_with_firebase/core/utils/bloc_util.dart';
import 'package:flutter_chat_app_with_firebase/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/widgets.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, state) {
        switch (state) {
          case AuthLoading():
            break;
          case AuthSuccess():
            context.go(Routes.home);
            break;
          case AuthFailure():
            print('Error: ${state.message}');
            break;
        }
      },
      builder: (BuildContext context, state) {
        return AppScaffold(
          title: 'Sign Up',
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account 🚀', style: theme.textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                'Start chatting with people instantly',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),

              AppTextField(controller: _nameController, label: 'Full Name'),
              const SizedBox(height: 16),

              AppTextField(
                controller: _emailController,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              AppTextField(
                controller: _passwordController,
                label: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 24),

              AppButton(
                text: 'Create Account',
                onPressed: () {
                  BlocUtil.of<AuthBloc>(context).add(
                    SignUpRequestEvent(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              Center(
                child: TextButton(
                  onPressed: () {
                    context.go(Routes.login);
                  },
                  child: const Text('Already have an account? Login'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
