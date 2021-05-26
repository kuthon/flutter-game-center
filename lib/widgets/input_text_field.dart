import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {

  final TextEditingController textEditingController;
  final String hint;
  final bool obscure;
  final Widget? counter;

  const InputTextField({
    this.counter,
    required this.textEditingController,
    this.hint = '',
    this.obscure = false
  });

  @override
  _InputTextFieldState createState() => _InputTextFieldState(obscure: obscure, hint: hint, textEditingController: textEditingController, canChangeObscure: obscure, counter: counter);
}

class _InputTextFieldState extends State<InputTextField> {
  final TextEditingController textEditingController;
  final bool canChangeObscure;
  final Widget? counter;
  bool obscure;
  final String hint;
  late IconData icon;

  _InputTextFieldState({this.counter, required this.canChangeObscure, required this.textEditingController, required this.obscure, required this.hint});

  @override
  void initState(){
    reinitialization();
    super.initState();
  }

  void reinitialization(){
    if (canChangeObscure){
      if (obscure) {
        icon = CupertinoIcons.eye_slash;
      } else {
        icon = CupertinoIcons.eye;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: TextFormField(
            controller: textEditingController,
            obscureText: obscure,
            decoration: InputDecoration(
              counter: counter,
              filled: true,
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              hintStyle: Theme.of(context).textTheme.headline3,
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2,
                  ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: canChangeObscure ? IconButton(
                icon: Icon(icon, color: Theme.of(context).primaryColor,),
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                    reinitialization();
                  });
                },
              ) : null,
            )
          ),
    );
  }
}
