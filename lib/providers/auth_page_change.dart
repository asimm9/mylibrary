import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/pages/login_page.dart';
import 'package:mylibrary/pages/register_page.dart';
import 'package:mylibrary/providers/all_providers.dart';

class AuthPageChange extends ConsumerWidget {
  const AuthPageChange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.watch(showPageChangeProvider);
    if (read.showPageChange) {
      return LoginPage(read.showPageChangeFunction);
    } else {
      return RegisterPage(read.showPageChangeFunction);
    }
  }
}
