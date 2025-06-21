import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FieldEditor extends HookWidget {
  final String label;
  final String value;
  final ValueChanged<String> onChanged;

  const FieldEditor({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
      text: value,
    );

    useEffect(() {
      if (controller.text != value) {
        controller.value = TextEditingValue(
          text: value,
          selection: TextSelection.collapsed(
            offset: value.length,
          ),
        );
      }
      return null;
    }, [value]);

    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
    );
  }
}
