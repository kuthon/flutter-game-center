import 'package:cocos_game/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:loading_alert_dialog/loading_alert_dialog.dart';


showLoading({required BuildContext context, required Function function}) async {
  LoadingAlertDialog.showLoadingAlertDialog(
      context: context,
      builder: (context,) => Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Text("${S.of(context).please_wait}"),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          color: Colors.white,
        ),
      ),
      computation: Future.microtask(() => function())
  );
}


