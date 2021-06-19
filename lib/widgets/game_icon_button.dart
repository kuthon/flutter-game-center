import 'package:flutter/material.dart';

class GameIconButton extends StatelessWidget {

  final MaterialPageRoute materialPageRoute;

  //   MaterialPageRoute(
  //      builder: (BuildContext context) => MeteorRainGame(),
  //   ),

  final bool isReplacement;
  final Widget image;
  final String name;

  const GameIconButton({Key? key, required this.image, required this.name, required this.materialPageRoute, this.isReplacement = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              materialPageRoute,
              (route) => !isReplacement);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: Container(child: image, padding: const EdgeInsets.all(5),)),
            Text(
              name,
              style: Theme.of(context).textTheme.headline5,
              softWrap: true,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
