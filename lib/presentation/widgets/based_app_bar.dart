import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasedAppBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: child,
      leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.pop()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
