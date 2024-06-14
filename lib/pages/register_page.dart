import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pvis/components/my_textfield.dart';
import 'package:pvis/components/my_button.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Pvis title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PVIS',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -6.dm,
                        shadows: [
                          Shadow(
                              color: Theme.of(context).colorScheme.secondary,
                              offset: Offset(3, -1),
                              blurRadius: 1)
                        ]),
                  )
                ],
              ),
              SizedBox(height: 30.h),
              //messege to login
              Row(
                children: [
                  Text(
                    'Create account',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, letterSpacing: -1),
                  ),
                ],
              ),

              SizedBox(height: 25.h),
              MyTextField(
                controller: emailController,
                label: 'email',
                hintText: 'emshinapaul@gmail.com',
                obscureText: false,
              ),     
              SizedBox(height: 25.h),         
              MyTextField(
                controller: emailController,
                label: 'username',
                hintText: 'emshinapaul',
                obscureText: false,
              ),
              SizedBox(
                height: 25.h,
              ),
              MyTextField(
                label: 'password',
                controller: passwordController,
                hintText: '******',
                obscureText: false,
              ),
              // SizedBox(height: 25.h),
              // MyTextField(
              //   label: 'confirm password',
              //   controller: confirmController,
              //   hintText: '******',
              //   obscureText: false,
              // ),

              SizedBox(height: 30.h),
              MyButton(onTap: () {}, text: 'SIGN UP'),
              SizedBox(
                  height: 40.h,
                ),
            
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    SizedBox(
                      width: 10,
                    ),
                 
                    Text('or sign up with'),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                // Icon('icon')
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          fixedSize: const MaterialStatePropertyAll(Size(0, 50)),
                          // elevation: MaterialStatePropertyAll(6000),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2))),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          // padding: MaterialStatePropertyAll(
                          //     EdgeInsets.symmetric(vertical: 14.h)),
                          textStyle: MaterialStatePropertyAll(TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold))),
                      child: const Text('Google')),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'have account?',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    const SizedBox(
                      width:4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            shadows: const [
                              Shadow(
                                  color: Colors.blue,
                                  offset: Offset(1, 1),
                                  blurRadius: 0)
                            ]),
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
