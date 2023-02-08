import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lore_keeper_frontend/repository/auth_repository.dart';
import 'package:lore_keeper_frontend/util/hex_color.dart';

import '../../success.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthRepository _authRepository = AuthRepository();

  bool _isUsernameValid = true, _isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("68A7AD"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width / 15,
          MediaQuery.of(context).size.height / 15,
          MediaQuery.of(context).size.width / 2,
          MediaQuery.of(context).size.height / 15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor("99C4C8"),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SelectableText(
                      "Lore Manager",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 60),
                    SelectableText(
                      "Good to have you back ;)",
                      style: GoogleFonts.montserrat(fontSize: 20),
                    ),
                    const SizedBox(height: 40),
                    _buildTextField(hintText: "Username", prefixIcon: const Icon(Icons.person), controller: _usernameController, isValid: _isUsernameValid),
                    const SizedBox(height: 10),
                    _buildTextField(hintText: "Password", prefixIcon: const Icon(Icons.key), controller: _passwordController, isValid: _isPasswordValid, obscureText: true),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        SelectableText(
                          "Forgot your password?",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: HexColor("#00008b"),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: HexColor("9dc4b5"),
                      ),
                      onPressed: _login,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SelectableText(
                          "Sign In",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text(
                            "Not a member yet? ",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SelectableText(
                          "Create an account",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: HexColor("#00008b"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {

    setState(() {
      _validateFields();
    });

    if (_isPasswordValid && _isUsernameValid) {

      Map<String, dynamic> loginMap = {
        "username" : _usernameController.text,
        "password" : _passwordController.text
      };

      _authRepository.login(loginMap).then((value) {
        
        if (value) {
          
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SuccessPage()));
          
        } else {

          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(title: SelectableText("Username or password incorrect!"));
              }
          );

        }
        
      });

    }

  }

  void _validateFields() {

    if (_usernameController.text.isEmpty) {

      _isUsernameValid = false;

    } else {

      _isUsernameValid = true;

    }

    if (_passwordController.text.isEmpty) {

      _isPasswordValid = false;

    } else {

      _isPasswordValid = true;

    }

  }

  Widget _buildTextField({
    required String hintText,
    required Icon prefixIcon,
    required TextEditingController controller,
    required bool isValid,
    bool? obscureText
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelStyle: GoogleFonts.montserrat(),
          errorText: isValid ? null : "Please, fill the field.",
          hintText: hintText,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("CEE5D0")),
          ),
        ),
      ),
    );
  }

}
