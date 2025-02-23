import 'package:flutter/material.dart';
import 'package:flutter_batch_4_project/consts/colors.dart';

ThemeData lightTheme(context) => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    primary: AppColor.primaryLight,
    seedColor: Colors.deepPurple,
    onPrimary: AppColor.onPrimaryLight,
    secondary: AppColor.secondaryLight,
    secondaryContainer: AppColor.secondaryContainerLight,
    onSecondaryContainer: AppColor.black,
    surfaceContainerLowest: AppColor.backgroundCardLight,
    surfaceContainerLow: AppColor.backgroundCardLight,
    surfaceContainer: AppColor.backgroundCardLight,
    surfaceContainerHigh: AppColor.backgroundCardLight,
    surfaceContainerHighest: AppColor.backgroundCardLight,
    error: AppColor.errorLight,
    onError: AppColor.onErrorLight,
  ),
  canvasColor: AppColor.backgroundCardLight,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColor.backgroundLight,
  dividerColor: AppColor.dividerLight,
  dividerTheme: Theme.of(context).dividerTheme.copyWith(
    color: AppColor.dividerLight,
    thickness: 1,
    space: 1
  ),
  appBarTheme: Theme.of(context).appBarTheme.copyWith(
    surfaceTintColor: AppColor.appBarBackgroundLight,
    backgroundColor: AppColor.appBarBackgroundLight,
    foregroundColor: Colors.black,
    shape: Border(
      bottom: BorderSide(color: AppColor.dividerLight, width: 0.5)
    ),
  ),
  bottomNavigationBarTheme: Theme.of(context).bottomNavigationBarTheme.copyWith(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColor.appBarBackgroundLight,
    selectedItemColor: AppColor.primaryLight,
    unselectedItemColor: AppColor.primaryLight.withAlpha(40)
  ),
  badgeTheme: Theme.of(context).badgeTheme.copyWith(
    backgroundColor: AppColor.secondaryLight,
    textColor: AppColor.onSecondaryLight,
  ),
  floatingActionButtonTheme: Theme.of(context).floatingActionButtonTheme.copyWith(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    backgroundColor: AppColor.secondaryLight,
    foregroundColor: AppColor.onSecondaryLight,
    elevation: 0
  ),
  tabBarTheme: TabBarTheme(
    dividerColor: AppColor.dividerLight,
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: AppColor.primaryLight,
    unselectedLabelColor: AppColor.primaryLight.withAlpha(40),
    dividerHeight: 3,
    indicator: BoxDecoration(
      border: Border(bottom: BorderSide(
        width: 3, 
        color: AppColor.primaryLight,
      ))
    ),
    splashFactory: NoSplash.splashFactory,
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        return states.contains(WidgetState.focused) ? null : Colors.transparent;
      }
    ),
  ),
  cardColor: AppColor.backgroundCardLight,
  cardTheme: Theme.of(context).cardTheme.copyWith(
    color: AppColor.backgroundCardLight,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1, color: AppColor.dividerLight),
      borderRadius: BorderRadius.circular(12),
    )
  ),
  listTileTheme: Theme.of(context).listTileTheme.copyWith(
    textColor: AppColor.primaryLight,
    iconColor: const Color(0xff9f9f9f),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    tileColor: AppColor.backgroundCardLight.withAlpha(140),
    visualDensity: VisualDensity.standard,
    selectedTileColor: AppColor.backgroundCardLight.withAlpha(140),
    selectedColor: Colors.black,
    subtitleTextStyle: TextStyle(
      fontSize: 14,
      height: 1.5,
      color: AppColor.placeholderLight
    ),
  ),
  dialogBackgroundColor: AppColor.backgroundCardLight,
  dialogTheme: Theme.of(context).dialogTheme.copyWith(
    backgroundColor: AppColor.backgroundCardLight,
    iconColor: AppColor.primaryLight,
    surfaceTintColor: AppColor.backgroundCardLight,
    actionsPadding: const EdgeInsets.all(16),
    insetPadding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    )
  ),
  textTheme: Theme.of(context).textTheme.copyWith(
    displayLarge: Theme.of(context).textTheme.displayLarge?.copyWith(
      color: AppColor.primaryLight
    ),
    displayMedium: Theme.of(context).textTheme.displayMedium?.copyWith(
      color: AppColor.primaryLight
    ),
    displaySmall: Theme.of(context).textTheme.displaySmall?.copyWith(
      color: AppColor.primaryLight
    ),
    headlineLarge: Theme.of(context).textTheme.headlineLarge?.copyWith(
      color: AppColor.primaryLight
    ),
    headlineMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
      color: AppColor.primaryLight
    ),
    headlineSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
      color: AppColor.primaryLight,
    ),
    titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
      color: AppColor.primaryLight
    ),
    titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
      color: AppColor.primaryLight
    ),
    titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
      color: AppColor.primaryLight,
    ),
    bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: AppColor.primaryLight
    ),
    bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: AppColor.primaryLight
    ),
    bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppColor.primaryLight,
    ),
    labelLarge: Theme.of(context).textTheme.labelLarge?.copyWith(
      color: AppColor.primaryLight
    ),
    labelMedium: Theme.of(context).textTheme.labelMedium?.copyWith(
      color: AppColor.primaryLight
    ),
    labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
      color: AppColor.primaryLight,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: Theme.of(context).iconButtonTheme.style?.copyWith(
      iconColor: WidgetStatePropertyAll(AppColor.primaryLight)
    )
  ),
  iconTheme: Theme.of(context).iconTheme.copyWith(
    color: AppColor.primaryLight
  ),
  searchBarTheme: Theme.of(context).searchBarTheme.copyWith(
    backgroundColor: WidgetStatePropertyAll(AppColor.inputBackgroundLight),
    surfaceTintColor: WidgetStatePropertyAll(AppColor.inputBackgroundLight),
    overlayColor: WidgetStatePropertyAll(AppColor.inputBackgroundLight),
    shadowColor: const WidgetStatePropertyAll(Colors.transparent),
    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
    hintStyle: WidgetStateTextStyle.resolveWith((state) {
      return TextStyle(
        color: AppColor.placeholderLight
      );
    }),
    textStyle: WidgetStateTextStyle.resolveWith((state) {
      return TextStyle(
        color: AppColor.primaryLight
      );
    }),
  ),
  inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
    outlineBorder: BorderSide(width: 1, color: AppColor.dividerLight),
    fillColor: AppColor.white,
    hintStyle: TextStyle(
      color: AppColor.placeholderLight,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: AppColor.dividerLight, width: 1)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: AppColor.dividerLight, width: 1)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: AppColor.dividerLight, width: 1)
    ),
  ),
  bottomSheetTheme: Theme.of(context).bottomSheetTheme.copyWith(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    showDragHandle: true,
    dragHandleColor: AppColor.placeholderLight,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    backgroundColor: AppColor.backgroundCardLight,
  )
);
