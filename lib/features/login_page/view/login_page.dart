import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            const Text('Войти в аккаунт',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: emailController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'e-mail',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Нет аккаунта? Тогда, '),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/sign-up');
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(1),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )),
                    child: const Text(
                      'Зарегистрируйтесь',
                      style: TextStyle(color: Colors.blueAccent),
                    )),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: 180,
              height: 70,
              child: ElevatedButton(
                onPressed: () async {
                  var email = emailController.text.trim();
                  var password = passwordController.text.trim();
                  if (email.isEmpty || password.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Пожалуйста заполните все поля');
                    return;
                  }
                  ProgressDialog progressDialog = ProgressDialog(context,
                      title: const Text('Входим в аккаунт'),
                      message: const Text('Пожалуйста подождите'),
                      backgroundColor: Colors.white,
                      blur: 80);
                  progressDialog.show();

                  try {
                    FirebaseAuth auth = FirebaseAuth.instance;

                    UserCredential userCredential =
                        await auth.signInWithEmailAndPassword(
                            email: email, password: password);
                    if (userCredential.user != null) {
                      progressDialog.dismiss();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushNamed('/top');
                    }
                  } on FirebaseAuthException catch (e) {
                    progressDialog.dismiss();
                    if (e.code == 'user-not-found') {
                      Fluttertoast.showToast(msg: 'Пользователь не найден');
                    } else if (e.code == 'wrong-password') {
                      Fluttertoast.showToast(msg: 'Неверный пароль');
                    } else {
                      Fluttertoast.showToast(msg: 'Что-то пошло не так...');
                    }
                  } catch (e) {
                    Fluttertoast.showToast(msg: 'Что-то пошло не так...');
                    progressDialog.dismiss();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
                child: const Text(
                  'Вход',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
