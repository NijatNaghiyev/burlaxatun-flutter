import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  /// Call phone number method
  static Future<void> launchPhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  /// Write in whatsapp method
  // static Future<void> launchWhatsApp(String phoneNumber,
  //     {String message = ''}) async {
  //   final Uri uri = Uri.parse(
  //       'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}');
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     throw 'Could not launch $uri';
  //   }
  // }

  static Future<void> launchWhatsApp(String phoneNumber,
      {String message = ''}) async {
    final Uri uri = Uri.parse(
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // If Whatsapp is not exist
      final Uri storeUri = Platform.isAndroid
          ? Uri.parse(
              'https://play.google.com/store/apps/details?id=com.whatsapp')
          : Uri.parse(
              'https://apps.apple.com/app/whatsapp-messenger/id310633997');

      if (await canLaunchUrl(storeUri)) {
        await launchUrl(storeUri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch WhatsApp or store link.';
      }
    }
  }

  /// Write in mail method
  static Future<void> launchEmail({
    required String toEmail,
    String subject = '',
    String body = '',
  }) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: toEmail,
      query:
          'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
