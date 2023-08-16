import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final Widget? prefix;
  final Widget widget;

  CustomInputField({
    Key? key,
    required this.labelText,
    this.prefix,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          // if (prefix != null) ...[
          //   prefix!,
          //   const SizedBox(width: 10),
          // ],
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          widget,
          // TextFormField(
          //   obscureText: (widget.obscureText && _obscureText),
          //   decoration: InputDecoration(
          //     isDense: (widget.isDense != null) ? widget.isDense : false,
          //     hintText: widget.hintText,
          //     suffixIcon: widget.suffixIcon
          //         ? IconButton(
          //             icon: Icon(
          //               _obscureText
          //                   ? Icons.remove_red_eye
          //                   : Icons.visibility_off_outlined,
          //               color: Colors.black54,
          //             ),
          //             onPressed: () {
          //               setState(() {
          //                 _obscureText = !_obscureText;
          //               });
          //             },
          //           )
          //         : null,
          //     suffixIconConstraints: (widget.isDense != null)
          //         ? const BoxConstraints(maxHeight: 33)
          //         : null,
          //   ),
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   validator: widget.validator,
          // ),
        ],
      ),
    );
  }
}
