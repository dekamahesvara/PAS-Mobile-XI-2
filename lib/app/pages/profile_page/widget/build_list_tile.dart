import 'package:flutter/material.dart';

Widget buildListTile({
  required IconData icon,
  required String text,
  required VoidCallback onPressed,
  Color? iconColor, // Warna ikon
  Color? textColor, // Warna teks
}) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    leading: Icon(
      icon,
      color: iconColor ??
          Colors
              .black, // Gunakan warna default jika tidak ada warna yang diberikan
    ),
    title: Text(
      text,
      style: TextStyle(
        color: textColor ??
            Colors
                .black, // Gunakan warna default jika tidak ada warna yang diberikan
      ),
    ),
    onTap: onPressed,
  );
}
