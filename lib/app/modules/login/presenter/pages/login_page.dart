import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/login/presenter/stores/login_store.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  Widget _background({Widget? body}) {
    double _height = MediaQuery.of(context).size.height * .37;
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: _height,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Positioned(
          top: _height - 120,
          child: Container(
            width: MediaQuery.of(context).size.width * .87,
            height: _height,
            child: Text(
              "Fazer Login",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.lerp(
                  Theme.of(context).primaryColor,
                  Colors.black,
                  .5,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: _height - 50,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  spreadRadius: .4,
                  blurRadius: 25,
                  offset: Offset(0, 15),
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            padding: EdgeInsets.only(
              top: 35,
              right: 27,
              left: 27,
              bottom: 35,
            ),
            width: MediaQuery.of(context).size.width * .88,
            child: body,
          ),
        ),
        _forgetAndRegister()
      ],
    );
  }

  Widget _forgetAndRegister() {
    return Positioned(
      bottom: 10,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {}, //TODO Goto Forgot Password Page
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Text(
                "Esqueci Minha Senha",
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
            ),
          ),
          InkWell(
            onTap: () {}, //TODO Goto SighUp Page
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Text(
                "Cadastrar",
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (input) => {}, //TODO onSaved
          validator: (input) => null, //TODO Validate the Email input
          decoration: InputDecoration(
            labelText: "E-mail",
            labelStyle: TextStyle(
              color: Theme.of(context).accentColor,
            ),
            contentPadding: EdgeInsets.all(12),
            hintText: 'email@dominio.com',
            hintStyle: TextStyle(
              color: Theme.of(context).focusColor.withOpacity(0.7),
            ),
            prefixIcon: Icon(
              Icons.alternate_email,
              color: Theme.of(context).accentColor,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).focusColor.withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).focusColor.withOpacity(0.5),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).focusColor.withOpacity(0.2),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        ScopedBuilder(
          store: store,
          onState: (_, __) {
            return ;
          },
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          onSaved: (input) => {}, //TODO onSaved
          validator: (input) => null, //TODO Validate the Password input
          obscureText: store.state.obscurePassword,
          decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: TextStyle(
              color: Theme.of(context).accentColor,
            ),
            contentPadding: EdgeInsets.all(12),
            hintText: '••••••••••••',
            hintStyle: TextStyle(
              color: Theme.of(context).focusColor.withOpacity(0.7),
            ),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Theme.of(context).accentColor,
            ),
            suffixIcon: IconButton(
              color: Theme.of(context).focusColor,
              icon: Icon(Icons.visibility),
              onPressed: () {
                store.togglePassword();
              },
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).focusColor.withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).focusColor.withOpacity(0.5),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).focusColor.withOpacity(0.2),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {}, //TODO login
          child: Text("Login"),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
          ),
        ),
        SizedBox(height: 15),
        OutlinedButton(
          onPressed: () {
            Modular.to.navigate('/');
          },
          child: Text("Voltar"),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(15),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _background(
        body: _form(),
      ),
    );
  }
}
