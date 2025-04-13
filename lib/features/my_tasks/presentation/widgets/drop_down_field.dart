import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const DropdownField({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: items.contains(value) ? value : null,
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(labelText: label),
        ),
      ],
    );
  }
}
