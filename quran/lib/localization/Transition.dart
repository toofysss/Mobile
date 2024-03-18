// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class MyTransition extends Translations {
//  اللغات
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          // الاقسام
          "S1": "الأدعية",
          "S2": "أحاديث",
          "S3": "أسماء الله الحسنى",
          "S4": "التعقيبات",
          "S5": "الاذكار",
          "S6": "اوقات الصلاة",
          "S7": "الزيارات",
          "S8": "المناجاة",
          "S9": "التسبيحات",
          "S10": "المسبحة الألكترونية",
          "S11": "التقويم الهجري",
          "S12": "اتجاه القبلة",
          "S13": "اهل البيت",
          "S14": "الاعدادات",
          "S15": "النغمات",
          "S16": "دليل المراقد",
          "S17": "الصلوات على الحجج الطاهرين",
          "S18": "الاعمال",
          "S19": "تعلم الوضوء",
          // زيارة
          "Zyara0": "زيارة الأيام",
          "Zyara1": "زيارة الأنبياء",
          // تسبيحات
          "Tasbeeh0": "تسبيحات",
          "Tasbeeh1": "تسبيحات الزهراء",
          "Tasbeeh2": "تسبيحات مفتوحة",
          // اذكار
          "azkar0": "اذكار الصباح",
          "azkar1": "اذكار المساء",
          "azkar2": "اذكار قبل النوم",
          "azkar3": "اذكار الاستيقاظ",
          "azkar4": "اذكار الصلاة",
          // اللغة
          "Lang": "لغة النظام",
          "ar": "العربية",
          "en": "الأنكليزية",
          // الوضع
          "Mode": "وضع النظام",
          "on": "الوضع الليلي",
          "off": "الوضع النهاري",
          // تواصل معنا
          "Contact": "تواصل معنا",
          // الدعاء
          "Duaa0": "دعاء الأيام",
          "Duaa1": "دعاء القرأن",
          "Duaa2": "الادعية العامة",
          // اهل البيت
          "Information0": "اهل البيت",
          "Information1": "الأئمة المعصومين",
          // الاذان
          "fjr": "الفجر",
          "sunrise": "شروق الشمس",
          "dhuhr": "الظهر",
          "asr": "العصر",
          "magrib": "المغرب",
          "isha": "العشاء",
          // الاعدادات
          "Setting1": "لغة التطبيق",
          "Setting2": "مظهر التطبيق",
          "Setting3": "حجم الخط",
          "Setting4": "تعديل التقويم الهجري",
          // دليل المراقد
          "Guide0": "المراقد الدينية",
          "Guide1": "المقامات الدينية",
          // Alamal
          "Alamal0": "شهر محرم",
          "Alamal1": "شهر صفر",
          "Alamal2": "شهر ربيع الاول",
          "Alamal3": "شهر ربيع الاخر",
          "Alamal4": "شهر جمادي الاول",
          "Alamal5": "شهر جمادي الاخر",
          "Alamal6": "شهر رجب",
          "Alamal7": "شهر شعبان",
          "Alamal8": "شهر رمضان",
          "Alamal9": "شهر شؤال",
          "Alamal10": "شهر ذو القعدة",
          "Alamal11": "شهر ذو الحجة",
          //
          "0": "بِسْمِ اللَّهِ الرَّحْمنِ الرَّحِيمِ",
          "1": "سورة",
          "2": "جزء",
          "4": "تأريخ الولادة",
          "5": "تأريخ الوفاة",
          "6": "التاريخ",
          "7": "التاريخ الهجري",
          "9": "-1 يوم",
          "10": "لم يتم التعديل",
          "11": "كم",
          "12": "اظغط هنا",
          "13": "إعادة ضبط",
          "14": "المسافة بينك وبين الكعبة المشرفة"
        },
        "en": {
          // Section
          "S1": "Supplications",
          "S2": "Hadith",
          "S3": "Asma Allah Ul Husna",
          "S4": "Feedback",
          "S5": "Al-Azkar",
          "S6": "Prayers Times",
          "S7": "Visits",
          "S8": "Al-Munajat",
          "S9": "Tasbihat",
          "S10": "Electronic Rosary", "S11": "Hijri Calendar",
          "S12": "Qibla Direction",
          "S13": "Ahl Al-Bayt",
          "S14": "Settings",
          "S15": "Ringtones",
          "S16": "Guide to Shrines",
          "S17": "Prayers For The Pure Hujjat",
          "S18": "Deeds",
          "S19": "Learn Wudhu",
          //Tasbeeh
          "Tasbeeh0": "Tasbihat",
          "Tasbeeh1": "Tasbihat Of Al-Zahra",
          "Tasbeeh2": "Open Tasbihat",
          // Azkar
          "azkar0": "morning remembrance",
          "azkar1": "evening remembrance",
          "azkar2": "Remembrance before sleep",
          "azkar3": "Remembrance of waking up",
          "azkar4": "Remembrance of prayer",
          // Zyara
          "Zyara0": "Visits Days",
          "Zyara1": "Visits Anbiaa",
          // Lang
          "Lang": "System Language",
          "ar": "Arabic",
          "en": "English",
          // Mode
          "Mode": "System Mode",
          "on": "Dark Mode",
          "off": "Light Mode",
          // Contact Us
          "Contact": "Contact Us",
          // Duaa
          "Duaa0": "Supplication Days",
          "Duaa1": "Supplication Qur'an",
          "Duaa2": "General Supplications",
          // ahlalbay
          "Information0": "Ahl Al-Bayt",
          "Information1": "The Infallible Imams",
          // Adhan
          "fjr": "Fjr",
          "sunrise": "Sunrise",
          "dhuhr": "Dhuhr",
          "asr": "Asr",
          "magrib": "Magrib",
          "isha": "Isha",
          // Setting
          "Setting1": "Language",
          "Setting2": "Mode",
          "Setting3": "Font Size",
          "Setting4": "Modify The Hijri Calendar",
          // Guide Information
          "Guide0": "Almaraqid shrines",
          "Guide1": "Almaqamat shrines",
          // Alamal
          "Alamal0": "the month of Muharram",
          "Alamal1": "the month of Safar",
          "Alamal2": "The month of Rabi' al-Awwal",
          "Alamal3": "The month of Rabi' al-Akhir",
          "Alamal4": "The month of Jumada al-Awwal",
          "Alamal5": "The last month of Jumada",
          "Alamal6": "The month of Rajab",
          "Alamal7": "The month of Shaban",
          "Alamal8": "The month of Ramadan",
          "Alamal9": "The month of Shawwal",
          "Alamal10": "The month of Dhul-Qa'dah",
          "Alamal11": "The month of Dhul-Hijjah",
          //
          "0": "In the name of Allah",
          "1": "Surah",
          "2": "Juz",
          "4": "Date of Birth",
          "5": "Date of Death",
          "6": "Date",
          "7": "Hijri Date",
          "9": "-1 Day",
          "10": "Not modified",
          "11": "Km",
          "12": "Press Here",
          "13": "Reset",
          "14": "The Distance Between You And The Holy Kaaba"
        }
      };
}
