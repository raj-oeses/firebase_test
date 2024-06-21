import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/utils/colors.dart';
import 'package:test_project/core/utils/properties.dart';

import '../../../../core/constants/demo_data.dart';

const _borderRadius = 8.0;

//****drop down
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
                          borderRadius: BorderRadius.circular(_borderRadius),
                          borderSide: const BorderSide(color: grey200)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 16.0)),
                  hint: Text(
                    hint,
                    style: TextStyle(
                        color: isIgnoring ?? false ? grey600Opacity : grey600),
                  ),
                  value: selectedStatus,
                  items: status?.map((String status) {
                    return DropdownMenuItem<String>(
                        value: status, child: Text(status));
                  }).toList(),
                  onChanged: (val) => onChanged?.call(val!))),
          sizeBox20
        ],
      ),
    );
  }
}

//***auto complete name field
class AutoCompleteNameField extends StatelessWidget {
  final bool isIgnoring;
  final String title;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;

  const AutoCompleteNameField({
    super.key,
    required this.isIgnoring,
    required this.title,
    required this.onChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isIgnoring,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                color: isIgnoring ? grey600Opacity : grey600),
          ),
          sizeBox10,
          Container(
            decoration: BoxDecoration(
                color: isIgnoring ? null : Colors.white,
                borderRadius: BorderRadius.circular(10.0)),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) =>
                  textEditingValue.text.isEmpty
                      ? const Iterable<String>.empty()
                      : names.where((String name) => name
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase())),
              onSelected: (String val) => onChanged?.call(val),
              fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) =>
                  TextField(
                      readOnly: isIgnoring,
                      controller: textEditingController,
                      focusNode: focusNode,
                      onSubmitted: (String val) => onSubmit?.call(val),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(_borderRadius)),
                          hintText: title)),
              optionsViewBuilder: (BuildContext context,
                      AutocompleteOnSelected<String> onSelected,
                      Iterable<String> options) =>
                  Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  child: SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = options.elementAt(index);
                        return GestureDetector(
                          onTap: () => onSelected(option),
                          child: ListTile(title: Text(option)),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          sizeBox20,
        ],
      ),
    );
  }
}
