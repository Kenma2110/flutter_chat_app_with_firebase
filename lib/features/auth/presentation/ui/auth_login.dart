import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app_with_firebase/core/utils/bloc_util.dart';
import 'package:flutter_chat_app_with_firebase/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../../../core/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.go(Routes.home);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return AppScaffold(
          title: 'Login',
          body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back 👋', style: theme.textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text(
                  'Login to continue chatting',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),

                /// EMAIL
                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                /// PASSWORD
                AppTextField(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                /// LOGIN BUTTON
                AppButton(
                  text: isLoading ? 'Logging in...' : 'Login',
                  isLoading: isLoading, // if your AppButton supports it
                  onPressed: isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            BlocUtil.of<AuthBloc>(context).add(
                              LoginRequestEvent(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              ),
                            );
                          }
                        },
                ),

                const SizedBox(height: 16),

                Center(
                  child: TextButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            context.go(Routes.signup);
                          },
                    child: const Text('Don’t have an account? Sign up'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
