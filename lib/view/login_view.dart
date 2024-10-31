import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/view/sign_up_view.dart';
import 'package:flutter_moto_gp/view_model/login_view_model.dart';
import 'package:get/get.dart';
import '../widgets/common/image_extention.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 10,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageAssest.facebook,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Continue with Facebook',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _textOrContinueWith(),
                    const SizedBox(
                      height: 40,
                    ),
                    _formEmail(controller),
                    const SizedBox(
                      height: 20,
                    ),
                    _formPassword(controller),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState?.validate() ==
                            true) {
                          controller.onlogin();
                          controller.emailController.clear();
                          controller.passwordController.clear();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 153, 23, 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 150,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const SignUpView());
                      },
                      child: Column(
                        children: [
                          const Text(
                            "D O N ' T  H A V E  A N  A C C O U N T ?  R E G I S T E R  N O W !",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _textOrContinueWith() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'OR',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF353232)),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Padding _formPassword(LoginViewModel controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Obx(
        () => TextFormField(
          controller: controller.passwordController,
          obscureText: controller.isObscured.value,
          style: const TextStyle(
              color: Colors.black), // Chữ màu đen để dễ nhìn trên nền trắng
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle:
                const TextStyle(color: Colors.black), // Nhãn màu xám nhạt
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), // Bo góc đường viền
              borderSide: BorderSide(
                  color: Colors.grey.shade400, width: 2), // Viền màu xám
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Colors.blue, width: 2), // Viền màu xanh khi được chọn
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Colors.red, width: 2), // Viền màu đỏ khi có lỗi
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Colors.redAccent,
                  width: 2), // Viền đỏ khi có lỗi và đang được chọn
            ),
            filled: true,
            fillColor: Colors.grey[200], // Màu nền xám nhạt cho trường nhập
            hintText: 'Password',
            hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.6)), // Gợi ý màu xám nhạt
            suffixIcon: GestureDetector(
              onTap: () => controller.toggleObscureText(),
              child: Icon(
                controller.isObscured.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey.withOpacity(0.8), // Màu biểu tượng mắt
              ),
            ),
          ),
          onChanged: controller.onChangePassword,
          validator: controller.validatorPassword,
        ),
      ),
    );
  }

  Padding _formEmail(LoginViewModel controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        controller: controller.emailController,
        obscureText: false,
        style: const TextStyle(
            color: Colors.black), // Chữ màu đen để hiển thị rõ trên nền trắng
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: const TextStyle(color: Colors.black), // Nhãn màu xám nhạt
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // Bo góc đường viền
            borderSide: BorderSide(
                color: Colors.grey.shade400, width: 2), // Viền màu xám nhạt
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                color: Colors.blue, width: 2), // Viền màu xanh khi được chọn
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                color: Colors.red, width: 2), // Viền màu đỏ khi có lỗi
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
                color: Colors.redAccent,
                width: 2), // Viền đỏ khi có lỗi và đang được chọn
          ),
          filled: true,
          fillColor: Colors.grey[200], // Màu nền xám nhạt cho trường nhập
          hintText: 'Email',
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.6)), // Gợi ý màu xám nhạt
        ),
        onChanged: controller.onChangeUsername,
        validator: controller.validatorUsername,
      ),
    );
  }
}
