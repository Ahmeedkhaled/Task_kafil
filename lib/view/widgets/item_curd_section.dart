import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/image.dart';
import 'package:task_kafel_company/constant/my_theme.dart';

class ItemCurdSection extends StatelessWidget {
  const ItemCurdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    ImageApp.productImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.13,
                  left: MediaQuery.of(context).size.width * 0.02,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: MyTheme.primaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        '\$100',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: MyTheme.whiteColor,
                              fontSize: 16,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.01),
              child: Text(
                'Logo Design -Graphic\nDesign Graphic Design',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14,
                      color: const Color(0xff000000),
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xffFFCB31)),
                    Text(
                      " (4.5) ",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: const Color(0xffFFCB31), fontSize: 14),
                    )
                  ],
                ),
                Container(
                  width: 1,
                  height: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.shopping_basket_outlined,
                      color: Color(0xff828282),
                    ),
                    Text(
                      " 20",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: const Color(0xff828282), fontSize: 14),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
