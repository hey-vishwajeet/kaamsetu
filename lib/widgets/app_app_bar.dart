import 'package:flutter/material.dart';

class KaamSetuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KaamSetuAppBar({required this.title, this.actions, super.key});

  final String title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
    actions: actions,
  );
}
