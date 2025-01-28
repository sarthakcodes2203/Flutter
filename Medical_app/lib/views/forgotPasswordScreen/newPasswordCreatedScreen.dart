import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Newpasswordcreatedscreen extends StatefulWidget {
        String routeName="/newPasswordCreatedScreen";

   Newpasswordcreatedscreen({super.key});

  @override
  State<Newpasswordcreatedscreen> createState() =>
      _NewpasswordcreatedscreenState();
}

class _NewpasswordcreatedscreenState extends State<Newpasswordcreatedscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _obscureText = true;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
              opacity: 0.1,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 16, top: 200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Create New Password",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.02),
                        ),
                        SizedBox(height: 15),

                        Text(
                          "Create your new password to login",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 30),

                        // Password Field
                        TextFormField(
                          // controller: _passwordController,
                          obscureText: _obscureText,
                          style: const TextStyle(height: 1.0, fontSize: 15.0),
                          decoration: InputDecoration(
                            hintText: "Password",
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Color.fromRGBO(38, 43, 106, 1),
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromRGBO(38, 43, 106, 1),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(38, 43, 106, 1),
                              ),
                            ),
                            errorText: _passwordError,
                          ),
                        ),
                        SizedBox(height: 15),

                        // Confirm Password Field
                        TextFormField(
                          // controller: _confirmPasswordController,
                          obscureText: _obscureText,
                          style: const TextStyle(height: 1.0, fontSize: 15.0),
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color.fromRGBO(38, 43, 106, 1),
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromRGBO(38, 43, 106, 1),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(38, 43, 106, 1),
                              ),
                            ),
                            // errorText: _passwordError,
                          ),
                        ),
                        SizedBox(height: 30),

                        ElevatedButton(
                          onPressed: () {
                            print("abc");
                          },
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                            minimumSize: Size(double.infinity, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          // if (_created)
          Center(
            child: Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Icon(
                      Icons.check_circle,
                      color: Color.fromRGBO(51, 56, 124, 0.949),
                      size: 50,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Success",
                      style: TextStyle(
                        fontSize: 20,
                        // color: Color.fromRGBO(38, 43, 106, 1),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "You have successfully reset your password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: () {
                                              Navigator.pushNamedAndRemoveUntil(
                        context,
                        // Routes().ciHome,
                        Routes().mainScreen,
                        (route) => false,
                      );

                        setState(() {
                          // _signedIn = false;
                        });
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                        minimumSize: Size(120, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
