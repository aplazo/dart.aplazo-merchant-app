import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/inputs/aplazo_dropdown.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoDropDownCustom extends StatelessWidget {
  const AplazoDropDownCustom(
      {super.key,
      required this.optionList,
      required this.dropdownValue,
      required this.label,
      required this.onChange});
  final List<DropDownItem> optionList;
  final String dropdownValue;
  final String label;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.sizePadding, vertical: 16),
      child: Column(
        children: [
          AplazoText(
            textProps: TextProps(
                aligment: Alignment.centerLeft,
                text: label,
                paddingHorizontal: 4,
                paddingVertical: 0,
                type: TextType.smallText),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: AppTheme.sizePadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: AppTheme.borderColor,
                width: 1,
              ),
            ),
            child: DropdownButtonFormField<String>(
                value: dropdownValue == '' ? null : dropdownValue,
                //underline: Container(),
                hint: AplazoText(
                    textProps: TextProps(
                        aligment: Alignment.centerLeft,
                        text: 'Seleciona una opción',
                        type: TextType.smallText)),
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                onChanged: (String? value) {
                  onChange(value);
                },
                items: optionList.map((DropDownItem element) {
                  return DropdownMenuItem(
                    value: element.value,
                    child: Row(
                      children: [
                        Text(element.text),
                      ],
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}
