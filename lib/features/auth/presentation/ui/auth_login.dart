import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../../../core/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      title: 'Login',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome Back 👋', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('Login to continue chatting', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 32),

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
            text: 'Login',
            onPressed: () {
              // Bloc event later
            },
          ),

          const SizedBox(height: 16),

          Center(
            child: TextButton(
              onPressed: () {
                context.go(Routes.signup);
              },
              child: const Text('Don’t have an account? Sign up'),
            ),
          ),
        ],
      ),
    );
  }
}
