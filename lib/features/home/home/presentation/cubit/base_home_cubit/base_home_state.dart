part of 'base_home_cubit.dart';

// @immutable
abstract class BaseHomeState {}

class BaseHomeInitial extends BaseHomeState {
  int currentIndex = 0;
  BaseHomeInitial({required this.currentIndex});
  final List<String> bottomAppBarTitleList = [
    translateDataBaseLang("الرئيسية", "Home"),
    // translateDataBaseLang("طلباتي", "My Orders"),
    translateDataBaseLang("المفضلة", "Favorite"),
    translateDataBaseLang("الأقسام", "category"),
    translateDataBaseLang("الشخصية", "Profile"),
  ];
  final List<IconData> bottomAppBarIconList = [
    Icons.home_outlined,
    Icons.favorite,
    Icons.category_outlined,
    Icons.person_outline
  ];
  final List<IconData> bottomBarActiveIconList = [
    Icons.home,
    // Icons.summarize_outlined,
    Icons.favorite,
    Icons.settings,
    Icons.person,
  ];
  final List pages = [
    HomeScreen(
      userId: getUserId(),
    ),
    // const OrdersScreen(),
    const FavoriteScreen(),
    const CategoryScreen(),
    ProfileScreen(),
  ];
}
