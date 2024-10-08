import 'package:famplay/domain/helper/form_helper.dart';
import 'package:famplay/domain/helper/messages.dart';
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.orange,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: Image.asset(ImageConstants.orangeBg).image,
          ),
        ),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageConstants.starLogo,
                            height: 150,
                            width: 150,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'FAMPLAY',
                            style: TextStyle(
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                              color: ColorsConstants.brown,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Usuário',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: ColorsConstants.brown,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    TextFormField(
                                      onTapOutside: (_) => unfocus(context),
                                      validator: Validatorless.required(
                                          'Usuário é obrigatório'),
                                      controller: emailEC,
                                      style: const TextStyle(
                                        color: ColorsConstants.wine,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      decoration: const InputDecoration(
                                        errorStyle: TextStyle(
                                          color: ColorsConstants.yellow,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    const Text(
                                      'Senha',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: ColorsConstants.brown,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    TextFormField(
                                      onTapOutside: (_) => unfocus(context),
                                      validator: Validatorless.multiple([
                                        Validatorless.required(
                                            'Senha é obrigatória'),
                                        Validatorless.min(8,
                                            'Senha deve conter pelo menos 8 caracteres'),
                                      ]),
                                      obscureText: true,
                                      controller: passwordEC,
                                      style: const TextStyle(
                                        color: ColorsConstants.wine,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      decoration: const InputDecoration(
                                        errorStyle: TextStyle(
                                          color: ColorsConstants.yellow,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorsConstants.brown,
                                    minimumSize: const Size.fromHeight(
                                      56,
                                    ),
                                  ),
                                  onPressed: () {
                                    switch (formKey.currentState?.validate()) {
                                      case (false || null):
                                        Messages.showError(
                                          'Verifique usuário e senha',
                                          context,
                                        );
                                      case true:
                                        Navigator.of(context)
                                            .pushNamed('/home');
                                      // login(emailEC.text, passwordEC.text);
                                    }
                                  },
                                  child: const Text(
                                    'Entrar',
                                    style: TextStyle(
                                      color: ColorsConstants.white,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/auth/register/user');
                          },
                          child: const Text(
                            'Nova conta',
                            style: TextStyle(
                              fontSize: 18,
                              color: ColorsConstants.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
