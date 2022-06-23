import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_management/widget/home_widgets/adding_ware_widget.dart';
import '../widget/home_widgets/about_us.dart';
import '../widget/home_widgets/wares_widget.dart';

abstract class NavigationEvents {}
class WaresWidgetTap extends NavigationEvents {}
class AddingWareWidgetTap extends NavigationEvents {}
class AboutUsWidgetTap extends NavigationEvents {}

abstract class NavigationStates {}

class BlocNavigator extends Bloc<NavigationEvents, NavigationStates> {
  BlocNavigator(NavigationStates initialState) : super(initialState){


    on<WaresWidgetTap>((event, emit) => emit(WaresWidget()));
    on<AddingWareWidgetTap>((event, emit) => emit(AddingWareWidget()));
    on<AboutUsWidgetTap>((event, emit) => emit(const AboutUs()));
  }

}