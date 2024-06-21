import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/utils/colors.dart';
import 'package:test_project/core/utils/properties.dart';

//****mine
class DropDownSection extends ConsumerWidget {
  final String title;
  final String hint;
  final String? selectedStatus;
  final bool? isIgnoring;
  final List<String>? status;
  final Function(String)? onChanged;

  const DropDownSection(
      {super.key,
      required this.title,
      required this.hint,
      required this.status,
      required this.onChanged,
      this.isIgnoring,
      this.selectedStatus});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IgnorePointer(
      ignoring: isIgnoring ?? false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: isIgnoring ?? false ? grey600Opacity : grey600),
            ),
            sizeBox10,
            Container(
                decoration: BoxDecoration(
                    color: isIgnoring ?? true ? null : Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: grey200)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 16.0)),
                    hint: Text(
                      hint,
                      style: TextStyle(
                          color:
                              isIgnoring ?? false ? grey600Opacity : grey600),
                    ),
                    value: selectedStatus,
                    items: status?.map((String status) {
                      return DropdownMenuItem<String>(
                          value: status, child: Text(status));
                    }).toList(),
                    onChanged: (val) => onChanged?.call(val!)))
          ],
        ),
      ),
    );
  }
}

