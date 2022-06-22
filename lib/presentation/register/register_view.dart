import 'package:bank_misr/business_logic/Auth/currentIndexBloc/cubit/currentindex_cubit.dart';
import 'package:bank_misr/presentation/register/register_widgets.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterNamePageState();
}

class _RegisterNamePageState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentindexCubit, int>(
      builder: (context, currentIndex) {
        return WillPopScope(
            onWillPop:() => backFunction(currentIndex,context),
            child: Scaffold(
              backgroundColor: ColorManager.white,
              appBar: AppBar(
                leadingWidth: 120,
                backgroundColor: ColorManager.white,
                title: appBarTitle(),
                leading: leadingAppBar(),
              ),
              body: BlocBuilder<CurrentindexCubit, int>(
                builder: (context, currentIndex) {
                  return SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 20),
                          currentTextFormField(currentIndex),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 20),
                          currentImage(currentIndex),
                          circlesRow(currentIndex, context),
                          const SizedBox(height: AppSize.s12),
                          ContinueButton(
                            formKey,
                            fullNameController,
                            emailController,
                            ageController,
                            userNameController,
                            passwordController,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ));
      },
    );
  }

  Widget currentTextFormField(int index) {
    if (index == 0) {
      return nameTextFormField(fullNameController);
    } else if (index == 1) {
      return emailTextFormField(emailController);
    } else if (index == 2) {
      return ageTextFormField(ageController);
    } else if (index == 3) {
      return userNameTextFormField(userNameController);
    } else if (index == 4) {
      return passwordTextFormField(passwordController);
    } else {
      return passwordTextFormField(passwordController);
    }
  }

  Widget currentImage(int index) {
    if (index == 0) {
      return imageLottieWidget(ImageAssets.nameLottie, context);
    } else if (index == 1) {
      return imageLottieWidget(ImageAssets.emailLottie, context);
    } else if (index == 2) {
      return imageLottieWidget(ImageAssets.ageLottie, context);
    } else if (index == 3) {
      return imageLottieWidget(ImageAssets.userNameLottie, context);
    } else if (index == 4) {
      return imageLottieWidget(ImageAssets.passwordLottie, context);
    } else {
      return imageWidget(ImageAssets.welcomePic, context);
    }
  }
}
