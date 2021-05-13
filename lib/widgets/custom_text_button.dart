import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  final Function onTap;
  final String title;

  const CustomTextButton({Key key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: 55,
      ),
      onPressed: () => onTap(),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
      fillColor: Theme.of(context).accentColor,
      shape: Theme.of(context).buttonTheme.shape,
    );
  }
}
