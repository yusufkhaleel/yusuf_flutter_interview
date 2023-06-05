import 'package:flutter/material.dart';
import 'package:yusuf_flutter_interview/constants/themes.dart';
import 'package:yusuf_flutter_interview/controllers/itembag_controller.dart';
import 'package:yusuf_flutter_interview/controllers/product_controller.dart';
import 'package:yusuf_flutter_interview/views/detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../widgets/ads_banner_widget.dart';
import '../widgets/card_widget.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(proudctNotifierProvider);
    final currentIndex = ref.watch(currentIndexProvider);
    final itemBag = ref.watch(itemBagProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Add your search functionality here
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                IconButton(onPressed: () {

                }, icon: Icon(
                    Icons.local_mall,
                    color: Colors.white,
                    size: 24,
                ) ,),
              ],
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                children: const [
                  Text('Enjoy the world', style: AppTheme.kHeadingOne),
                ],
              ),
              Row(
                children: const [
                  Text('into virtual reality', style: AppTheme.kHeadingOne),
                ],
              ),

              SizedBox(height: 25),
              // Ads banner section
              const AdsBannerWidget(),
              SizedBox(height: 25),
              // Chip section
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff00b0ff),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        ),
                        onPressed: () {},
                        child: Text('All Product', style: AppTheme.ktitles)),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F6FB),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text('Popular',style: AppTheme.kCardTitle),
                    ),
                    SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE8F6FB),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Text('Recent',style: AppTheme.kCardTitle),
                  ),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F6FB),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text('Recent',style: AppTheme.kCardTitle),
                    ),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F6FB),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text('Recent',style: AppTheme.kCardTitle),
                    ),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F6FB),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text('Recent',style: AppTheme.kCardTitle),
                    ),
                  ],
                ),
              ),

              const Gap(12),
              Container(
                padding: const EdgeInsets.all(4),
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(getIndex: index),
                        )),
                    child: SizedBox(
                      height: 250,
                      child: ProductCardWidget(productIndex: index),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) =>
            ref.read(currentIndexProvider.notifier).update((state) => value),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kSecondaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation_outlined),
            label: 'Location',
            activeIcon: Icon(Icons.navigation),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
