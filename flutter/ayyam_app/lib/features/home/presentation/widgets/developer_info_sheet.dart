import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';

class DeveloperInfoSheet extends StatelessWidget {
  const DeveloperInfoSheet({super.key});

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
  }

  void _copyToClipboard(BuildContext context, String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.accentGold,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _buildSocialTile({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              FaIcon(icon, color: iconColor, size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Icon(Icons.open_in_new, size: 16, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            
            // Developer Info Section
            _buildSectionTitle(context, "معلومات المطور"),
            _buildSocialTile(
              context: context,
              icon: FontAwesomeIcons.linkedin,
              iconColor: const Color(0xFF0A66C2),
              title: "LinkedIn",
              onTap: () => _launchUrl('https://www.linkedin.com/in/mohamed-hassan-pro/'),
            ),
            const SizedBox(height: 12),
            _buildSocialTile(
              context: context,
              icon: FontAwesomeIcons.github,
              iconColor: isDark ? Colors.white : Colors.black,
              title: "GitHub",
              onTap: () => _launchUrl('https://github.com/mohamed-hassan-pro'),
            ),
            const SizedBox(height: 12),
            _buildSocialTile(
              context: context,
              icon: FontAwesomeIcons.shieldHalved,
              iconColor: Colors.blueGrey,
              title: "سياسة الخصوصية (Privacy Policy)",
              onTap: () => _launchUrl('https://mohamed-hassan-pro.github.io/ayyam-privacy/'),
            ),

            // Support Section
            _buildSectionTitle(context, "الدعم والتواصل"),
            _buildSocialTile(
              context: context,
              icon: FontAwesomeIcons.whatsapp,
              iconColor: const Color(0xFF25D366),
              title: "تواصل عبر واتساب",
              onTap: () => _launchUrl('https://wa.me/201015231933'),
            ),
            const SizedBox(height: 12),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => _copyToClipboard(context, "01015231933", "تم نسخ رقم الجوال الخاص بالدعم"),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE60000).withValues(alpha: 0.1),
                    border: Border.all(color: const Color(0xFFE60000).withValues(alpha: 0.2)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.account_balance_wallet, color: Color(0xFFE60000), size: 24),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          "دعم عبر فودافون كاش و فوري",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFE60000)),
                        ),
                      ),
                      Icon(Icons.copy, size: 20, color: Color(0xFFE60000)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
