part of 'locale_cubit.dart';


class LocaleState {
 final Locale locale;


 const LocaleState(this.locale);


 @override
 bool operator ==(Object other) {
   if (identical(this, other)) return true;
   return other is LocaleState && other.locale == locale;
 }


 @override
 int get hashCode => locale.hashCode;
}
