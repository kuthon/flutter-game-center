import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  final Function onTap;
  final String title;
  final bool canPress;

  const CustomTextButton({required this.onTap, required this.title, this.canPress = true});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: 55,
      ),
      onPressed: !canPress ? null : () => onTap(),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.headline2,
          children: [
            if (!canPress)
              WidgetSpan(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.lock, color: Theme.of(context).textTheme.headline2!.color,)
                  )
              ),
            TextSpan(text: title)
          ]
        ),

      ),
      fillColor: canPress ? Theme.of(context).accentColor : Theme.of(context).primaryColor.withOpacity(0.6),
      shape: Theme.of(context).buttonTheme.shape,
    );
  }
}
