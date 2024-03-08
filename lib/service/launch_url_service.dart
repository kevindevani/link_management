import 'package:url_launcher/url_launcher.dart';

void launchTheUrl({required String url}) {
  launchUrl(
    Uri.parse(!url.contains('http') ? 'https://$url' : 'url'),
    mode: LaunchMode.externalApplication,
  );
}
