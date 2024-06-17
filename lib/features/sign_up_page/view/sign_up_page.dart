import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Добро пожаловать!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: nameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Имя',
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
                  onSubmitted: (value) {
                    setState(() {});
                  },
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
              height: 5,
            ),
            (passwordController.text.trim().length < 7)
                ? Text(
                    '* Пароль должен содержать больше 6 символов',
                    style: TextStyle(color: Colors.red.shade400),
                  )
                : Text(
                    '* Пароль безопасный',
                    style: TextStyle(color: Colors.green.shade400),
                  ),
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: confirmController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Повторите пароль',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 70,
              child: ElevatedButton(
                onPressed: () async {
                  var name = nameController.text.trim();
                  var email = emailController.text.trim();
                  var password = passwordController.text.trim();
                  var confirmPass = confirmController.text.trim();

                  if (name.isEmpty ||
                      email.isEmpty ||
                      password.isEmpty ||
                      confirmPass.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Пожалуйста заполните все поля');
                    return;
                  }
                  if (password.length < 6) {
                    Fluttertoast.showToast(
                        msg: 'Слабый пароль. Должно быть не менее 6 символов');
                    return;
                  }
                  if (password != confirmPass) {
                    Fluttertoast.showToast(msg: 'Пароли не совпадают');
                    return;
                  }
                  try {
                    FirebaseAuth auth = FirebaseAuth.instance;

                    UserCredential userCredential =
                        await auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                    if (userCredential.user != null) {
                      DatabaseReference userRef =
                          FirebaseDatabase.instance.ref().child('users');

                      String uid = userCredential.user!.uid;

                      await userRef.child(uid).set({
                        'name': name,
                        'email': email,
                        'uid': uid,
                      });
                      auth.currentUser!.updateDisplayName(name.toString());
                      Fluttertoast.showToast(msg: 'Успешно');
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushNamed('/top');
                    } else {
                      Fluttertoast.showToast(msg: 'Ошибка');
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      Fluttertoast.showToast(msg: 'Почта уже использована');
                    } else if (e.code == 'weak-password') {
                      Fluttertoast.showToast(msg: 'Пароль слишком легкий');
                    }
                  } catch (e) {
                    Fluttertoast.showToast(msg: 'Что-то пошло не так');
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
                child: const Text(
                  'Зарегистрироваться',
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
