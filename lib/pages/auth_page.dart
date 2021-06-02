import 'package:cocos_game/generated/l10n.dart';
import 'package:cocos_game/services/auth_service.dart';
import 'package:cocos_game/services/error_handler.dart';
import 'package:cocos_game/widgets/custom_text_button.dart';
import 'package:cocos_game/widgets/input_text_field.dart';
import 'package:cocos_game/widgets/show_loading.dart';
import 'package:flutter/material.dart';



class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final AuthService _authService = AuthService();
  final TextEditingController _loginEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();

  bool showLoginPage = false;
  bool isAgreement = false;

  @override
  Widget build(BuildContext context) {

    void _login() async{
        await _authService.signInWithEmailAndPassword(_loginEditingController.text.trim(), _passwordEditingController.text.trim())
          .catchError((e) => ErrorHandler(error: e, context: context).showErrorMessage());
    }

    void _register() async{
        await _authService.registerWithEmailAndPassword(_loginEditingController.text.trim(), _passwordEditingController.text.trim())
          .catchError((e) => ErrorHandler(error: e, context: context).showErrorMessage());

    }

    void _forgotPassword() async{
        await _authService.sendPasswordResetEmail(email: _loginEditingController.text.trim())
            .catchError((e) => ErrorHandler(error: e, context: context).showErrorMessage());


    }

    Widget _agreementCheckBox = Container(
        height: 100,
        width: double.infinity,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                  value: isAgreement,
                  onChanged: (newValue) {
                    setState(() {
                      isAgreement = !isAgreement;
                    });
                  }),
              Expanded(
                  child: Text(
                S.of(context).user_agreement,
                overflow: TextOverflow.visible,
                style: Theme.of(context).textTheme.headline5,
              ))
            ]));

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
                showLoginPage ? S.of(context).auth : S.of(context).registration,
                style: Theme.of(context).textTheme.headline1),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          color: Theme.of(context).backgroundColor,
          child: showLoginPage
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    InputTextField(
                      obscure: false,
                      hint: S.of(context).email,
                      textEditingController: _loginEditingController,
                    ),
                    InputTextField(
                      obscure: true,
                      hint: S.of(context).password,
                      textEditingController: _passwordEditingController,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () => _forgotPassword(),
                            child: Text(
                              S.of(context).forgot_your_password,
                              style: Theme.of(context).textTheme.headline4,
                            )),
                      ),
                    ),
                    CustomTextButton(
                        title:
                        S.of(context).login,
                        onTap: () => showLoading(
                            context: context,
                            function: _login)),
                    TextButton(
                        onPressed: () { setState(() { showLoginPage = false; }); },
                        child: Text(
                          S.of(context).not_registered_yet,
                          style: Theme.of(context).textTheme.headline4,
                        )),

                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    InputTextField(
                      obscure: false,
                      hint: S.of(context).email,
                      textEditingController: _loginEditingController,
                    ),
                    InputTextField(
                      obscure: true,
                      hint: S.of(context).password,
                      textEditingController: _passwordEditingController,
                    ),
                    _agreementCheckBox,
                    CustomTextButton(
                        title: S.of(context).register, onTap: () {
                          if (isAgreement)
                            showLoading(
                                context: context,
                                function: _register
                            );
                          },
                        canPress: isAgreement,
                        ),
                    TextButton(
                        onPressed: () { setState(() { showLoginPage = true; });},
                        child: Text(
                          S.of(context).already_registered,
                          style: Theme.of(context).textTheme.headline4,
                        ))
                  ],
                ),
        ),
      ),
    );
  }
}
