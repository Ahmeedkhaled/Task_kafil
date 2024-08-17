import 'package:flutter/material.dart';
import 'package:task_kafel_company/view/widgets/curd_section.dart';
import 'package:task_kafel_company/view/widgets/custom_appbar.dart';
import 'package:task_kafel_company/view/widgets/item_curd_section.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppbar(text: "Services"),
                const SizedBox(height: 24),
                CurdSection(
                  itemCount: 10, // Customizing itemCount for Services
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: const ItemCurdSection(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                const CustomAppbar(text: "Popular Services"),
                const SizedBox(height: 24),
                CurdSection(
                  itemCount: 5, // Customizing itemCount for Popular Services
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: const ItemCurdSection(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
