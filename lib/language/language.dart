import 'package:get/get.dart';

class LanguageTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'hi': hi};
}

const Map<String, String> en = {
  'home': 'Home',
  'feeds': 'Feeds',
  'category': 'Category',
  'search': 'Search',
  'profile': 'Profile',

  'bookmarks': 'Bookmarks',
  'language': 'Language',
  'auto_play_video': 'Auto Video play',
  'darkMode': 'Dark Mode',
  'notification': 'Notification',
  'share_application': 'Share Application',
  'rate_our_app': 'Rate our App',
  'contactUs': 'Contact Us',
  'privacyPolicy': 'Privacy Policy',
  'terms': 'Terms & Conditions',

  'trendingNews': 'Trending News',
  'top': 'Top News',
  'all': 'All',
  'unRead': 'Unread Only',

  'category_hashtags': 'Category & Hashtags',

  'searchNews': 'Search News',

  'dataNotFoundMessage': 'Data not found!',
  'dioRequestCancellation': 'Request cancellation',
  'dioConnectionTimeOut': 'Connection timed out',
  'dioRequestTimeOut': 'Request timed out',
  'dioResponseTimeout': 'Response timeout',
  'dioRequestSyntaxError': 'Request syntax error',
  'dioServerRefusedToExecute': 'Server refused to execute',
  'dioNotConnectServer': 'Can not connect to the server',
  'dioRequestForbidden': 'Request method is forbidden',
  'dioServerInternalError': 'Server internal error',
  'dioInvalidRequest': 'Invalid request',
  'dioServerDown': 'Server is down',
  'dioHttpNotSupport': 'Does not support HTTP protocol request',
  'dioUnknownMistake': 'Unknown mistake',
  'dioUnknownError': 'Unknown error',
};

const Map<String, String> hi = {
  'home': 'होम',
  'feeds': 'फ़ीड',
  'category': 'श्रेणियाँ',
  'search': 'सर्च',
  'profile': 'प्रोफाइल',

  'bookmarks': 'बुकमार्क',
  'language': 'भाषा',
  'auto_play_video': 'वीडियो ऑटो प्ले',
  'darkMode': 'डार्क मोड',
  'notification': 'नोटिफ़िकेशन ',
  'share_application': 'Share Application',
  'rate_our_app': 'Rate our App',
  'contactUs': 'संपर्क करें',
  'privacyPolicy': 'गोपनीयता नीति',
  'terms': 'नियम और शर्तें',

  'trendingNews': 'रुझान वाली खबरें',
  'top': 'मुख्य समाचार',
  'all': 'सभी',
  'unRead': 'केवल अपठित',

  'category_hashtags': 'Category & Hashtags',

  'searchNews': 'समाचार खोजें',

  'dataNotFoundMessage': 'डेटा नहीं मिला!',
  'dioRequestCancellation': 'अनुरोध रद्द',
  'dioConnectionTimeOut': 'कनेक्शन का समय समाप्त',
  'dioRequestTimeOut': 'अनुरोध का समय समाप्त',
  'dioResponseTimeout': 'प्रतिक्रिया समयबाह्य',
  'dioRequestSyntaxError': 'सिंटैक्स त्रुटि का अनुरोध करें',
  'dioServerRefusedToExecute': 'सर्वर ने निष्पादित करने से इनकार कर दिया',
  'dioNotConnectServer': 'सर्वर से जुड़ नहीं सकता',
  'dioRequestForbidden': 'अनुरोध विधि निषिद्ध है',
  'dioServerInternalError': 'सर्वर आंतरिक त्रुटि',
  'dioInvalidRequest': 'अमान्य अनुरोध',
  'dioServerDown': 'सर्वर डाउन है',
  'dioHttpNotSupport': 'HTTP प्रोटोकॉल अनुरोध का समर्थन नहीं करता है',
  'dioUnknownMistake': 'अज्ञात गलती',
  'dioUnknownError': 'अज्ञात त्रुटि',
};
