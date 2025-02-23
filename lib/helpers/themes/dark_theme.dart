import 'package:flutter/material.dart';
import 'package:flutter_batch_4_project/consts/colors.dart';

ThemeData darkTheme(context) => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    primary: AppColor.primaryDark,
    seedColor: Colors.deepPurple,
    onPrimary: AppColor.onPrimaryDark,
    secondary: AppColor.secondaryDark,
    secondaryContainer: AppColor.secondaryContainerDark,
    onSecondaryContainer: AppColor.onSecondaryDark,
    surfaceContainerLowest: AppColor.surfaceContainerLowestDark,
    surfaceContainerLow: AppColor.surfaceContainerLowDark,
    surfaceContainer: AppColor.surfaceContainerDark,
    surfaceContainerHigh: AppColor.surfaceContainerHighDark,
    surfaceContainerHighest: AppColor.surfaceContainerHighestDark,
    error: AppColor.errorDark,
    onError: AppColor.onErrorDark,
    outline: AppColor.dividerDark
  ),
  canvasColor: AppColor.backgroundCardDark,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColor.backgroundDark,
  dividerColor: AppColor.dividerDark,
  dividerTheme: Theme.of(context).dividerTheme.copyWith(
    color: AppColor.dividerDark,
    thickness: 1,
    space: 1
  ),
  appBarTheme: Theme.of(context).appBarTheme.copyWith(
    surfaceTintColor: AppColor.appBarBackgroundDark,
    backgroundColor: AppColor.appBarBackgroundDark,
    foregroundColor: AppColor.white,
    shape: Border(
      bottom: BorderSide(color: AppColor.dividerDark, width: 0.5)
    ),
  ),
  bottomNavigationBarTheme: Theme.of(context).bottomNavigationBarTheme.copyWith(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColor.appBarBackgroundDark,
    selectedItemColor: AppColor.primaryDark,
    unselectedItemColor: AppColor.primaryDark.withAlpha(125),
    selectedLabelStyle: Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle?.copyWith(
      fontSize: 12
    ),
    unselectedLabelStyle: Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle?.copyWith(
      fontSize: 12
    ),
  ),
  badgeTheme: Theme.of(context).badgeTheme.copyWith(
    backgroundColor: AppColor.secondaryDark,
    textColor: AppColor.onSecondaryDark,
  ),
  floatingActionButtonTheme: Theme.of(context).floatingActionButtonTheme.copyWith(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    backgroundColor: AppColor.secondaryLight,
    foregroundColor: AppColor.onSecondaryLight,
    elevation: 0
  ),
  tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
    dividerColor: AppColor.dividerDark,
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: AppColor.primaryDark,
    unselectedLabelColor: AppColor.primaryDark.withAlpha(125),
    dividerHeight: 3,
    indicator: BoxDecoration(
      border: Border(bottom: BorderSide(
        width: 3, 
        color: AppColor.secondaryDark,
      ))
    ),
    splashFactory: NoSplash.splashFactory,
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        return states.contains(WidgetState.focused) ? null : Colors.transparent;
      }
    ),
  ),
  cardColor: AppColor.backgroundCardDark,
  cardTheme: Theme.of(context).cardTheme.copyWith(
    color: AppColor.backgroundCardDark,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1, color: AppColor.dividerDark),
      borderRadius: BorderRadius.circular(12),
    )
  ),
  listTileTheme: Theme.of(context).listTileTheme.copyWith(
    textColor: AppColor.primaryDark,
    iconColor: const Color(0xff9f9f9f),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    tileColor: AppColor.backgroundCardDark.withAlpha(125),
    visualDensity: VisualDensity.standard,
    selectedTileColor: AppColor.backgroundCardDark.withAlpha(125),
    selectedColor: Colors.white,
    subtitleTextStyle: const TextStyle(
      fontSize: 14,
      height: 1.5,
    ),
  ),
  dialogBackgroundColor: AppColor.backgroundCardDark,
  dialogTheme: Theme.of(context).dialogTheme.copyWith(
    backgroundColor: AppColor.backgroundCardDark,
    iconColor: AppColor.primaryDark,
    surfaceTintColor: AppColor.backgroundCardDark,
    actionsPadding: const EdgeInsets.all(16),
    insetPadding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  textTheme: Theme.of(context).textTheme.copyWith(
    displayLarge: Theme.of(context).textTheme.displayLarge?.copyWith(
      color: AppColor.primaryDark
    ),
    displayMedium: Theme.of(context).textTheme.displayMedium?.copyWith(
      color: AppColor.primaryDark
    ),
    displaySmall: Theme.of(context).textTheme.displaySmall?.copyWith(
      color: AppColor.primaryDark
    ),
    headlineLarge: Theme.of(context).textTheme.headlineLarge?.copyWith(
      color: AppColor.primaryDark
    ),
    headlineMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
      color: AppColor.primaryDark
    ),
    headlineSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
      color: AppColor.primaryDark,
    ),
    titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
      color: AppColor.primaryDark
    ),
    titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
      color: AppColor.primaryDark
    ),
    titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
      color: AppColor.primaryDark,
    ),
    bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: AppColor.primaryDark
    ),
    bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: AppColor.primaryDark
    ),
    bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppColor.primaryDark,
    ),
    labelLarge: Theme.of(context).textTheme.labelLarge?.copyWith(
      color: AppColor.primaryDark
    ),
    labelMedium: Theme.of(context).textTheme.labelMedium?.copyWith(
      color: AppColor.primaryDark
    ),
    labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
      color: AppColor.primaryDark,
    ),
  ),
  searchViewTheme: Theme.of(context).searchViewTheme.copyWith(
    dividerColor: AppColor.dividerDark,
    headerHintStyle: TextStyle(
      color: AppColor.placeholderDark
    ),
    headerTextStyle: TextStyle(
      color: AppColor.primaryDark
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: Theme.of(context).iconButtonTheme.style?.copyWith(
      iconColor: WidgetStatePropertyAll(AppColor.primaryDark)
    )
  ),
  iconTheme: Theme.of(context).iconTheme.copyWith(
    color: AppColor.primaryDark
  ),
  searchBarTheme: Theme.of(context).searchBarTheme.copyWith(
    backgroundColor: WidgetStatePropertyAll(AppColor.inputBackgroundDark),
    surfaceTintColor: WidgetStatePropertyAll(AppColor.inputBackgroundDark),
    overlayColor: WidgetStatePropertyAll(AppColor.inputBackgroundDark),
    shadowColor: const WidgetStatePropertyAll(Colors.transparent),
    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
    hintStyle: WidgetStateTextStyle.resolveWith((state) {
      return TextStyle(
        color: AppColor.placeholderDark
      );
    }),
    textStyle: WidgetStateTextStyle.resolveWith((state) {
      return TextStyle(
        color: AppColor.primaryDark
      );
    }),
  ),
  inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
    outlineBorder: BorderSide(width: 1, color: AppColor.dividerDark),
    filled: true,
    fillColor: AppColor.inputBackgroundDark,
    hintStyle: TextStyle(
      color: AppColor.placeholderDark,
      height: 2,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Colors.transparent, width: 1),
    ),
    alignLabelWithHint: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelAlignment: FloatingLabelAlignment.start
  ),
  bottomSheetTheme: Theme.of(context).bottomSheetTheme.copyWith(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    showDragHandle: true,
    dragHandleColor: AppColor.placeholderDark,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    backgroundColor: AppColor.backgroundCardDark,
  )
);
