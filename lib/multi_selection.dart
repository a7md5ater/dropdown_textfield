import 'package:dropdown_textfield/tooltip_widget.dart';
import 'package:flutter/material.dart';

import 'dropdown_textfield.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({
    Key? key,
    required this.onChanged,
    required this.dropDownList,
    required this.list,
    required this.height,
    this.buttonColor,
    this.buttonText,
    this.buttonTextStyle,
    required this.listTileHeight,
    required this.listPadding,
    this.listTextStyle,
    this.checkBoxProperty,
    this.selectionColor,
  }) : super(key: key);
  final List<DropDownValueModel> dropDownList;
  final ValueSetter onChanged;
  final List<bool> list;
  final double height;
  final Color? buttonColor;
  final String? buttonText;
  final TextStyle? buttonTextStyle;
  final double listTileHeight;
  final TextStyle? listTextStyle;
  final ListPadding listPadding;
  final CheckBoxProperty? checkBoxProperty;
  final Color? selectionColor;

  @override
  _MultiSelectionState createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<bool> multiSelectionValue = [];

  @override
  void initState() {
    multiSelectionValue = List.from(widget.list);
    super.initState();
  }

  @override
  void dispose() {
    // print("MULTI SELECTION DISPOSED");
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.onChanged(multiSelectionValue));
    // widget.onChanged(multiSelectionValue);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: Scrollbar(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: widget.dropDownList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: widget.listTileHeight,
                    child: Container(
                      color: multiSelectionValue[index]
                          ? widget.selectionColor
                          : null,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: widget.listPadding.bottom,
                            top: widget.listPadding.top),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      multiSelectionValue[index] =
                                          !multiSelectionValue[index];
                                    });
                                    print("======>$index");
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                            widget.dropDownList[index].name,
                                            style: widget.listTextStyle),
                                      ),
                                      if (widget
                                              .dropDownList[index].toolTipMsg !=
                                          null)
                                        ToolTipWidget(
                                            msg: widget.dropDownList[index]
                                                .toolTipMsg!)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
        // Row(
        //   children: [
        //     const Expanded(
        //       child: SizedBox.shrink(),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(
        //           right: 8.0, left: 8.0, top: 4, bottom: 10),
        //       child: InkWell(
        //         onTap: () => widget.onChanged(multiSelectionValue),
        //         child: Container(
        //           // height: widget.listTileHeight * 0.9,
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        //           decoration: BoxDecoration(
        //             color: widget.buttonColor ?? Colors.green,
        //             borderRadius: const BorderRadius.all(Radius.circular(16)),
        //           ),
        //           child: Align(
        //             child: FittedBox(
        //               fit: BoxFit.contain,
        //               child: Text(
        //                 widget.buttonText ?? "SELECT",
        //                 style: widget.buttonTextStyle ??
        //                     const TextStyle(fontWeight: FontWeight.bold),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
