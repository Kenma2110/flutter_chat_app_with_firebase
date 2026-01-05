import 'package:flutter/material.dart';
import 'package:flutter_chat_app_with_firebase/app/router/routes.dart';
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
              // Bloc event later
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
  }
}
