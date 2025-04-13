import 'package:flutter_bloc/flutter_bloc.dart';


class AppBlocObserver extends BlocObserver {
 @override
 void onCreate(BlocBase bloc) {
   super.onCreate(bloc);
   print('🔍 Bloc Created: ${bloc.runtimeType}');
 }


 @override
 void onChange(BlocBase bloc, Change change) {
   super.onChange(bloc, change);
   print('🔁 Bloc Change in ${bloc.runtimeType}: $change');
 }


 @override
 void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
   print('❌ Bloc Error in ${bloc.runtimeType}: $error');
   super.onError(bloc, error, stackTrace);
 }


 @override
 void onClose(BlocBase bloc) {
   print('🛑 Bloc Closed: ${bloc.runtimeType}');
   super.onClose(bloc);
 }
}
