import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  // I wanted to add "copy on long press" here, but recognizer can detect only
  // one :sob:
  TextSpan _link(String text, [String? url]) {
    return TextSpan(
      text: text,
      style: const TextStyle(color: Colors.blue),
      recognizer: TapGestureRecognizer()
        ..onTap = () =>
            launchUrlString(url ?? text, mode: LaunchMode.externalApplication),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final t = Theme.of(context);
    final tt = t.textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(l.pageAboutTitle)),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text("About this app and me", style: tt.headlineMedium),
            const SizedBox(height: 4.0),
            Text(
                "Hi there 👋 I'm @TheLastGimbus, creator of this app 🧑‍💻 I hope you're enjoying it! I created it out of pure passion 💖"),
            const SizedBox(height: 4.0),
            Text(
                "If you have *ANY* questions, suggestions, or just want to chat, feel free to contact me on any of below:"),
            const SizedBox(height: 4.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "Email 📧: "),
                  _link("mateusz.soszynski.2003@gmail.com",
                      "mailto:mateusz.soszynski.2003@gmail.com"),
                  TextSpan(text: "\n"),
                  TextSpan(text: "Twitter 🐦: "),
                  _link("@TheLastGimbus", "https://twitter.com/TheLastGimbus"),
                  TextSpan(text: "\n"),
                  TextSpan(text: "Reddit: "),
                  _link("/u/TheLastGimbus",
                      "https://www.reddit.com/u/TheLastGimbus"),
                ],
                style: tt.bodyLarge,
              ),
            ),
            const SizedBox(height: 4.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text:
                          "FreeBuddy is 💯% open source - meaning you can read whole source code it was made with - here, on it's GitHub: "),
                  _link("https://github.com/TheLastGimbus/FreeBuddy/"),
                  WidgetSpan(child: SizedBox(height: 8.0)),
                  TextSpan(text: "\n"),
                  TextSpan(
                      text:
                          "I also made a blog about how it was created 🧑‍🎓 you can give it a read here: "),
                  _link("https://the.lastgimbus.com/blog/"),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 1.0,
              color: t.dividerColor,
              margin: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(l.privacyPolicyTitle, style: t.textTheme.headlineSmall),
            const SizedBox(height: 4.0),
            Text(l.privacyPolicyText),
            TextButton(
              onPressed: () => launchUrlString(l.privacyPolicyUrl,
                  mode: LaunchMode.externalApplication),
              child: Text(l.privacyPolicyUrlBtn),
            ),
            Container(
              height: 1.0,
              color: t.dividerColor,
              margin: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/settings/about/licenses'),
              child: Text(l.pageAboutOpenSourceLicensesBtn),
            ),
          ],
        ),
      ),
    );
  }
}