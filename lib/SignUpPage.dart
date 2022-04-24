import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:assignment/HomePage.dart';
import 'HomePage.dart';
import 'LoginLayout.dart';
import 'package:assignment/userModel.dart';

class SignUpPage extends StatefulWidget {

  @override
  SignUpPagestate createState() => SignUpPagestate();
}

class SignUpPagestate extends State<SignUpPage> {

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final usernameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  bool isObscure = true;
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    final usernameField = TextFormField(
      autofocus: false,
      controller: usernameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Username cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        usernameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    final passwordField = TextFormField(
        obscureText: true,
        autofocus: false,
        controller: passwordEditingController,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Minimum 6 character)");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );

    final confirmPasswordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: confirmPasswordEditingController,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "confirm password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        /* suffixIcon: isObscure
          ? IconButton(
        onPressed: (){
          setState(() {
            isObscure = !isObscure;
            //Navigator.pop(context);
          });
        },
        icon: isObscure
            ? Icon(
          Icons.visibility_off,
          color: Colors.black,

        )
            : Icon(
          Icons.visibility,
          color:Colors.black,
        ),
      )
          : null,*/
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => LoginLayout(),),);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery
              .of(context)
              .size
              .height - 50,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => LoginLayout(),),);
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decorationThickness: 2,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                /* Column(
                children: <Widget>[
                  buildInputDetailsForm(label: "Username", obscureText:false),
                  buildInputDetailsForm(label:"Email Address", obscureText:false),
                  buildInputDetailsForm(label:"Create Password",obscureText:true),
                  buildInputDetailsForm(label:"Confirm Password",obscureText:true),
                  buildInputDetailsForm(label:"Current City", obscureText:false),
                ],
              ),*/
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration:
                  BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x661565C0),
                          Color(0x991976D2),
                          Color(0xcc1E88E5),
                          Color(0xFF42A5F5)
                        ]
                    ),
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 45,),
                usernameField,
                SizedBox(height: 20,),
                emailField,
                SizedBox(height: 20,),
                passwordField,
                SizedBox(height: 20,),
                confirmPasswordField,
                SizedBox(height: 20,),
                PolicyCheck(),
                SizedBox(height: 20,),
                buildSignUpBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

/*  Widget buildInputDetailsForm({label, obscureText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
        obscureText: obscureText? isObscure : false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          suffixIcon: obscureText
            ? IconButton(
              onPressed: (){
                setState(() {
                  isObscure = !isObscure;
                  //Navigator.pop(context);
                });
              },
              icon: isObscure
              ? Icon(
                  Icons.visibility_off,
                  color: Colors.black,

                )
                : Icon(
                  Icons.visibility,
                  color:Colors.black,
                ),
            )
              : null,
          ),
        ),
      ],
    );
  }*/

  Widget PolicyCheck() {
    return Container(
      padding: EdgeInsets.only(top: 3, left: 3),
      height: 20,
      child: Row(
        children: <Widget>[
          SizedBox(width: 10,),
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
            child: Checkbox(
              value: isAgreed,
              checkColor: Colors.green,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  isAgreed = value!;
                });
              },
            ),
          ),
          const Text(
            'I Agree to terms and conditions',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSignUpBtn() {
    return Container(

      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      width: double.infinity,

      child: GestureDetector(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white, shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          )),
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },

          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.userId = user.uid;
    userModel.username = usernameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
  }
}
