// ignore_for_file: file_names

import 'package:get/route_manager.dart';

class MyTransition extends Translations {
//  اللغات
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "القوانين",
          "2": "الأخبار",
          "3": "الأسئلة الشائعة",
          "4": "المحامين",
          "5": "الخدمات",
          "6": "البحث عن القانون ....",
          "7": "البحث عن كلمة او جملة في داخل كل القوانين والتشريعات",
          "8": "اخبار عامة",
          "9": "اخبار المحامين",
          "10": "استشارة",
          "11": "استشارات قانونیة",
          "12": "توكیل محامي",
          "13": "العرائض والطلبات القانونیة",
          "14": "بوابة القضاء العراقي",
          "15": "الأسئلة الشائعة",
          "16": "العقود والمكاتبات",
          "17": "قرارات محكمة التمييز",
          "18": "قرارات المحكمة الاتحادیة العلیا",
          "19": "قرارات مجلس قیادة الثورة المنحل",
          "20": "قرارات مجلس الوزراء",
          "21": "البنك المركزي العراقي",
          "22": "كتب الرئاسات الثلاث",
          "23": "اوامر سلطة ائتلاف المؤقتة",
          "24": "جریدة الوقائع العراقیة",
          "25": "الأعدادات",
          "26": "طلب القسام الشرعي",
          "27": "طلب استمارة عقد الزواج",
          "28": "طلبات الحجج الشرعية",
          "29": "اللغة",
          "30": "العربية",
          "31": "الأنكليزية",
          "32": "حجم الخط",
          "33": "اختر حجم الخط",
          "34": "المحافظة",
          "35": "اختصاص المحامي المطلوب",
          "36": "اختيار المحكمة",
          "37": "بحث",
          "38": "نوع الدعوى",
          "39": "العنوان",
          "40": "تفاصيل الدعوى",
          "41": "المرفقات",
          "42": "رقم واتساب",
          "43": "ارسال",
          "44": "ابحث هنا ...",
          "45": "ادخل رقم العدد",
          "46": "بحث",
          "47": "تحميل",
          "48": "تمت العملية بنجاح",
          "49": "يرجى تحميل المرفقات",
          "50": "يرجى الاتصال بالانترنت",
          "51": "يرجى ادخال البيانات",
          "52": "دليل المحاميين العراقيين",
          "53": "لا توجد بيانات",
          "54": "اسم المستخدم",
          "55": "كلمة المرور",
          "56": "انشاء حساب",
          "57": "تسجيل الدخول",
          "58": "ليس لديك حساب ؟",
          "59": "يرجى التحقق من البيانات",
          "60": "تسجيل خروج",
          "61": "الاسم الثلاثي",
          "62": "الجنس",
          "63": "ذكر",
          "64": "أنثى",
          "65": "الاختصاص",
          "66": "المدينة",
          "67": "المحافظة",
          "68": "الوصف",
          "69": "صورة شخصية",
          "70": "صورة هوية المحاميين",
          "71": "رقم الهاتف",
          "72": "غرفة تسجيل المحامي",
          "73": "نشر خبر",
          "74": "جدول القضايا",
          "75": "عنوان الخبر",
          "76": "موجز الخبر",
          "77": "صورة الخبر",
          "78": "نوع الدعوى",
          "79": "السعر",
          "80": "التاريخ",
          "81": "مجموع",
          "82": "حفظ",
          "83": "ادخل رقم القرار",
          "84": "ادخل تاريخ القرار",
          "85": "رجوع",
          "86": "سيرة ذاتية",
          "87": "تم تحميل المرفقات",
          "88": "أدخل رقم المادة",
          "89": "عرض المادة",
          "90": "عرض القانون بالكامل",
          "91": "نشر",
          "92": "تحديد النشر",
          "93": "تم النشر",
          "94": "البحث عن قانون معين",
          "95": "البحث الكلي عن كلمة او عبارة داخل القانون",
          "96": "دردشة قانونية مع الذكاء الاصطناعي",
          "97": "اسم المحامي/ة",
          "98": "عنوان المحامي/ة",
          "99": "عنوان الموكل",
          "100": "اسم الموكل",
          "101": "مبلغ الاتعاب",
          "102": "دينار",
          "103": "دولار",
          "104": "تفاصيل القضية",
          "105": "المبلغ المستلم من الموكل كمقدمة",
          "106": "عقد محاماة",
          "107": "إنشاء العقد",
          "108": "يرجى تسجيل الدخول",
          "109": "Word",
          "110": "Pdf",
          "111": "لوائح تميزية",
          "112": "اسم المحكمة",
          "113": "اسم الدائرة",
          "114": "اسم المحكمة عند نقض العقد",
          "115": "طريقة دفع الاتعاب",
          "116": "عقد بيع العقار",
          "117": "اسم البائع",
          "118": "م",
          "119": "ز",
          "120": "د",
          "121": "اسم المشتري",
          "122": "نوع الهوية",
          "123": "رقم الهوية",
          "124": "معلومات البائع",
          "125": "معلومات المشتري",
          "126": "نوع الملك",
          "127": "الرقم والتسلسل",
          "128": "محلة",
          "129": "زقاق",
          "130": "دار",
          "131": "العربون",
          "132": "رسوم النقل على الطرف ؟",
          "133": "رسوم الدوائر على الطرف ؟",
          "134": "مقدار الدلالية بالمائة",
          "135": "اسم الدلال",
          "136": "فقرات اضافية",
          "137": "بدل البيع",
          "138": "ورقة عقد الزواج الشرعي",
          "139": "اسم الزوج",
          "140": "اسم الزوجة",
          "141": "الحالة الزوجية",
          "142": "المعرف",
          "143": "العنوان",
          "144": "الشاهد الاول البالغ سن الرشد",
          "145": "الشاهد الثاني البالغ سن الرشد",
          "146": "معلومات الزوج",
          "147": "معلومات الزوجة",
          "148": "الاسم",
          "149": "المهر المعجل",
          "150": "المهر المؤجل",
          "151": "ورقة الطلاق الرجعي",
          "152": "عدد الطلاق",
          "153": "جواب الزوج",
          "154": "ورقة الطلاق الخلعي",
          "155": "جواب الزوجة",
          "156": "كتب ومؤلفات قانونية",
          "157": "اعلان المزايدات العقارية",
          "158": "تم تحميل الصورة",
          "159": "رقم الهوية",
          "160": "الصلاحية",
          "161": "وكالة جزائية خاصة",
          "162": "الوكيل",
          "163": "الموكل",
          "164": "الخصم",
          "165": "رقم الدعوى",
          "166": "رقم المادة",
          "167": "اسم المحكمة",
          "168": "نوع الملك",
          "169": "المالكين",
          "170": "المساحة",
          "171": "العنوان",
          "172": "السعر",
          "173": "موعد المزايدة العلنية",
          "174": "صورة المزاد",
          "175": "نبذة عن الشيء المراد بيعه",
          "176": "المعرفة",
          "177": "هذا القانون يتألف من",
          "178": "مادة فقط",
          "179": "السابق",
          "180": "التالي",
          "181": "عرض القانون كاملا",
          "182": "حسنا",
          "183": "يرجى الاختيار",
          "184": "اختيار المذهب",
          "185": "عقد بيع وشراء السيارات",
          "186": "جهة الاصدار",
          "187": "يرجى تحميل الصور",
          "188": "معلومات السيارة",
          "189": "الرقم",
          "190": "النوع",
          "191": "الموديل",
          "192": "اللون",
          "193": "رقم المحرك",
          "194": "رقم الشاصي",
          "195": "المبلغ كامل",
          "196": "المبلغ مقدما",
          "197": "المبلغ المتبقي",
          "198": "مبلغ الضمان",
          "199": "منطقة السكن",
          "200": "عقد بيع وشراء الدراجات والتكتك",
          "201": "الغرض المراد بيعه",
          "202": "معلومات بيع الدراجات والتكتك",
          "203": "وصل أمانة",
          "204": "المبلغ المستلم",
          "205": "عن اقرار",
          "206": "تاريخ الهوية",
          "207": "اسم الشاهد الاول",
          "208": "اسم الشاهد الثاني",
          "209": "وصل قبض",
          "210": "عـن قـيـمـة",
          "211": "اسم المسلم",
          "212": "اسم المستلم",
          "213": "العملة",
          "214": "اسم المستلم (المدين)",
          "215": "اسم المسلم (الدائن)",
          "216": "التزامات البائع",
          "217": "التزامات المشتري",
          "218": "خدمة العملاء",
          "219": "حول التطبيق",
          "220": "جميع الحقوق محفوظة 2024",
          "221": "نسخة"
        },
        "en": {
          "1": "Laws",
          "2": "News",
          "3": "Frequently Asked Questions",
          "4": "Lawyers",
          "5": "Services",
          "6": "Searching For The Law....",
          "7": "Search For A Word Or Phrase Within All Laws And Legislation",
          "8": "General News",
          "9": "Lawyers' News",
          "10": "Consultation",
          "11": "Legal Consultations",
          "12": "Appointment Of A Lawyer",
          "13": "Petitions And Legal Requests",
          "14": "Iraqi Judiciary Portal",
          "15": "Frequently Asked Questions",
          "16": "Contracts And Correspondences",
          "17": "Decisions Of The Court Of Cassation",
          "18": "Decisions Of The Federal Supreme Court",
          "19": "Decisions Of The Dissolved Revolutionary Command Council",
          "20": "Decisions Of The Council Of Ministers",
          "21": "Central Bank Of Iraq",
          "22": "Books of the Three Presidencies",
          "23": "Coalition Provisional Authority Orders",
          "24": "Iraqi Gazette",
          "25": "Setting",
          "26": "Request Of The Sharia Qassam",
          "27": "Request A Marriage Contract Form",
          "28": "Requests For Legal Arguments",
          "29": "Language",
          "30": "Arabic",
          "31": "English",
          "32": "Font Size",
          "33": "Choose Font Size",
          "34": "The Governorate",
          "35": "The Jurisdiction Of The Requested Lawyer",
          "36": "Choice Of Court",
          "37": "Search",
          "38": "Type Of Lawsuit",
          "39": "Title",
          "40": "Details Of The Case",
          "41": "Attachments",
          "42": "WhatsApp No.",
          "43": "Send",
          "44": "Search Here...",
          "45": "Enter The Issue No.",
          "46": "Search",
          "47": "Download",
          "48": "Success",
          "49": "Please Upload Attachments ",
          "50": "Please Connect To The Internet",
          "51": "Please Enter Data",
          "52": "Guide To Iraqi Lawyers",
          "53": "No Data",
          "54": "Username",
          "55": "Password",
          "56": "Create An Account",
          "57": "Log In",
          "58": "You Don't Have An Account?",
          "59": "Please Check The Data",
          "60": "Sign Out",
          "61": "The Triple Name",
          "62": "Gender",
          "63": "Male",
          "64": "Female",
          "65": "Jurisdiction",
          "66": "The City",
          "67": "The Governorate",
          "68": "Description",
          "69": "Personal Image",
          "70": "Lawyers' ID photo",
          "71": "phone Number",
          "72": "Lawyer Registration Room",
          "73": "Publish News",
          "74": "Cases Table",
          "75": "News Title",
          "76": "News Summary",
          "77": "Picture Of The News",
          "78": "Type Of Claim",
          "79": "Price",
          "80": "Date",
          "81": "Total",
          "82": "Save",
          "83": "Enter The Number Of Decision",
          "84": "Enter The Date Of The Decision",
          "85": "Back",
          "86": "Biography",
          "87": "Attachments Have Been Uploaded",
          "88": "Enter The Sentence Of The Law",
          "89": "View Article",
          "90": "View The Entire Law",
          "91": "Published",
          "92": "Determine Publication",
          "93": "Published",
          "94": "Searching For A Specific Law",
          "95": "Complete Search For A Word Or Phrase Within The Law",
          "96": "Legal Chat With Artificial Intelligence",
          "97": "Lawyer's Name",
          "98": "Lawyer's Address",
          "99": "Address Of The Principal",
          "100": "Name Of Principal",
          "101": "Amount Of Fees",
          "102": "Dinar",
          "103": "Dollar",
          "104": "Case Details",
          "105": "The Amount Received From The Principal As An Advance",
          "106": "Lawyer Contract",
          "107": "Create The Contract",
          "108": "Please Log In",
          "109": "Word",
          "110": "PDF",
          "111": "Discriminatory Regulations",
          "112": "Court Name",
          "113": "Department Name",
          "114": "Name Of The Court When The Contract Is Annulled",
          "115": "Method of Paying Fees",
          "116": "Real Estate Sale Contract",
          "117": "Name of Seller",
          "118": "M",
          "119": "Z",
          "120": "D",
          "121": "Name of Buyer",
          "122": "ID Type",
          "123": "ID Number",
          "124": "Seller Information",
          "125": "Buyer Information",
          "126": "King Type",
          "127": "Number And Sequence",
          "128": "Mahalla",
          "129": "Alley",
          "130": "Dar",
          "131": "The Deposit",
          "132": "Transportation Fees On The Party?",
          "133": "Circuit Fees On The Party?",
          "134": "Semantic Amount Percent",
          "135": "Name Of Auctioneer",
          "136": "Additional Paragraphs",
          "137": "Sale Consideration",
          "138": "Legal Marriage Contract Paper",
          "139": "Husband's Name",
          "140": "Wife's Name",
          "141": "Marital Status",
          "142": "Identifier",
          "143": "Title",
          "144": "The First Witness Who Has Reached The Age Of Majority",
          "145": "The Second Witness Who Has Reached The Age Of Majority",
          "146": "Husband's information",
          "147": "Wife's Information",
          "148": "Name",
          "149": "Accelerated Dowry",
          "150": "Deferred Dowry",
          "151": "Revocable Divorce Paper",
          "152": "number Of Divorce",
          "153": "The Husband's Answer",
          "154": "Khula Divorce Paper",
          "155": "The Wife's Answer",
          "156": "Books And Legal Writings",
          "157": "Announcing More Real Estate",
          "158": "Image Has been uploaded",
          "159": "ID Number",
          "160": "Validity",
          "161": "Special Penal Agency",
          "162": "Agent",
          "163": "The Client",
          "164": "Opponent",
          "165": "Case Number",
          "166": "Article Number",
          "167": "Court Name",
          "168": "King Type",
          "169": "The Owners",
          "170": "Area",
          "171": "Title",
          "172": "Price",
          "173": "Public Auction Date",
          "174": "Auction Image",
          "175": "An Pverview Of The Item To Be Sold",
          "176": "Knowledge",
          "177": "This Law Consists Of",
          "178": "Material Only",
          "179": "previous",
          "180": "Next",
          "181": "View The Entire Law",
          "182": "Okay",
          "183": "Please Select",
          "184": "Choice Of Doctrine",
          "185": "Car Sale And Purchase Contract",
          "186": "Issuing Body",
          "187": "Please Upload Photos",
          "188": "Vehicle Information",
          "189": "Number",
          "190": "Type",
          "191": "Model",
          "192": "Color",
          "193": "Engine Number",
          "194": "Chassis Number",
          "195": "Full Amount",
          "196": "Amount In Advance",
          "197": "Remaining Amount",
          "198": "Guarantee Amount",
          "199": "Residence Area",
          "200": "Contract For The Sale And Purchase Of Bicycles And Tuk-Tuks",
          "201": "The Item To Be Sold",
          "202": "Information On The Sale Of Bicycles And Tuk-Tuks",
          "203": "Deposit Receipt",
          "204": "Amount Received",
          "205": "About Acknowledgment",
          "206": "History Of Identity",
          "207": "Name Of The First Witness",
          "208": "Name Of The Second Witness",
          "209": "Catch Receipt",
          "210": "About Value",
          "211": "Muslim Name",
          "212": "recipient's Name",
          "213": "Currency",
          "214": "Name Of Recipient (Debtor)",
          "215": "Name Of The Muslim (Creditor)",
          "216": "Seller's Obligations",
          "217": "Buyer's Obligations",
          "218": "Customer Service",
          "219": "About the application",
          "220": "All rights reserved 2024",
          "221": "copy"
        }
      };
}
