import 'package:flutter/material.dart';
import 'package:genzo/src/features/auth_screens/create_account/create_account_signin.dart';
import 'package:genzo/src/features/auth_screens/create_account/create_account_signup.dart';
import 'package:genzo/src/res/strings.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              Onboarding.logo,
              style: TextStyle(
                color: Color(0xFF121212),
                fontSize: 16,
                fontFamily: Fonts.roboto,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            height: 1,
          ),
          TabBar(
            labelColor: Colors.blue,
            tabAlignment: TabAlignment.fill,
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(),
            isScrollable: false,
            tabs: const [
              Tab(text: ElevatedButtonText.signup),
              Tab(text: ElevatedButtonText.signin),
            ],
          ),
          Container(
            height: screenDimensions.screenHeight * 1,
            child: TabBarView(
              controller: _tabController,
              children:  <Widget>[
                Signup(),
                Signin(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
