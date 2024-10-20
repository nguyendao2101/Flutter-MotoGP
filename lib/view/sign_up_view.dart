import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/sign_up_view_model.dart';
import '../widgets/common/color_extentionn.dart';
import '../widgets/common/image_extention.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpViewModel());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSocialButton(
                  'Continue with Facebook',
                  Colors.blue[900]!,
                  ImageAssest.facebook,
                ),
                const SizedBox(height: 32),
                _formEmail(controller),
                const SizedBox(height: 16),
                _formPassword(controller),
                const SizedBox(height: 16),
                _formEntryPassword(controller),
                const SizedBox(height: 16),
                _formName(controller),
                const SizedBox(height: 16),
                _formAddress(controller),
                const SizedBox(height: 16),
                _formSex(controller),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: () {
                        if (controller.isValidSignupForm()) {
                          controller.isLoading.value = true;
                          controller.signUp(
                            controller.email ?? '',
                            controller.password ?? '',
                            controller.confirmPassword ?? '',
                            controller.hoTen ?? '',
                            controller.address ?? '',
                            controller.sex ?? '',
                                () {
                              controller.isLoading.value = false;
                              Get.snackbar(
                                'Success',
                                'Đăng ký thành công',
                                snackPosition: SnackPosition.TOP,
                              );
                              controller.resetForm();
                              Get.offAll(() => const LoginView());
                            },
                                (error) {
                              controller.isLoading.value = false;
                              Get.snackbar(
                                'Error',
                                error,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ChatColor.almond,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildSocialButton(String text, Color color, String imageAsset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageAsset, height: 20, width: 20),
            const SizedBox(width: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Padding _formEmail(SignUpViewModel controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
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

  Padding _formPassword(SignUpViewModel controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Obx(
        () => TextFormField(
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

  Padding _formEntryPassword(SignUpViewModel controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Obx(
        () => TextFormField(
          obscureText: controller.isEntryPasswordObscured.value,
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
              onTap: () => controller.toggleEntryPasswordObscureText(),
              child: Icon(
                controller.isEntryPasswordObscured.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey.withOpacity(0.8), // Màu biểu tượng mắt
              ),
            ),
          ),
          onChanged: controller.onChangeConfirmPassword,
          validator: controller.validatorConfirmPassword,
        ),
      ),
    );
  }

  Padding _formName(SignUpViewModel controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        obscureText: false,
        style: const TextStyle(
            color: Colors.black), // Chữ màu đen để hiển thị rõ trên nền trắng
        decoration: InputDecoration(
          labelText: 'Full Name',
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
          hintText: 'Name',
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.6)), // Gợi ý màu xám nhạt
        ),
        onChanged: controller.onChangeCheckName,
        validator: controller.validatorCheck,
      ),
    );
  }

  Padding _formAddress(SignUpViewModel controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        obscureText: false,
        style: const TextStyle(
            color: Colors.black), // Chữ màu đen để hiển thị rõ trên nền trắng
        decoration: InputDecoration(
          labelText: 'Adress',
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
          hintText: 'Adress',
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.6)), // Gợi ý màu xám nhạt
        ),
        onChanged: controller.onChangeCheckAdress,
        validator: controller.validatorCheck,
      ),
    );
  }

  Padding _formSex(SignUpViewModel controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        obscureText: false,
        style: const TextStyle(
            color: Colors.black), // Chữ màu đen để hiển thị rõ trên nền trắng
        decoration: InputDecoration(
          labelText: 'Sex',
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
          hintText: 'Sex',
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.6)), // Gợi ý màu xám nhạt
        ),
        onChanged: controller.onChangeCheckSex,
        validator: controller.validatorCheck,
      ),
    );
  }
}
