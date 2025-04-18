import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TermsScreen extends StatefulWidget {
  final Function(bool) onTermsAccepted;

  const TermsScreen({
    super.key,
    required this.onTermsAccepted,
  });

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool _allChecked = false;
  bool _serviceChecked = false;
  bool _privacyChecked = false;
  bool _ageChecked = false;
  bool _marketingChecked = false;

  void _updateAllChecked() {
    setState(() {
      _allChecked = _serviceChecked && _privacyChecked && _ageChecked && _marketingChecked;
    });
  }

  void _updateTermsChecked(bool value) {
    setState(() {
      _serviceChecked = value;
      _privacyChecked = value;
      _ageChecked = value;
      _marketingChecked = value;
      _updateAllChecked();
    });
  }

  bool get _isValid {
    return _serviceChecked && _privacyChecked && _ageChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('약관 동의'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 전체 동의 섹션
              Card(
                child: CheckboxListTile(
                  title: const Text(
                    '전체 동의',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  value: _allChecked,
                  onChanged: (value) {
                    setState(() {
                      _allChecked = value ?? false;
                      _updateTermsChecked(_allChecked);
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              const SizedBox(height: 16),
              // 필수 약관 섹션
              const Text(
                '필수 약관',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              // 서비스 이용약관 섹션
              Card(
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: const Text('서비스 이용약관 (필수)'),
                      value: _serviceChecked,
                      onChanged: (value) {
                        setState(() {
                          _serviceChecked = value ?? false;
                          _updateAllChecked();
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        '서비스 이용약관 내용...',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // 개인정보 보호약관 섹션
              Card(
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: const Text('개인정보 보호약관 (필수)'),
                      value: _privacyChecked,
                      onChanged: (value) {
                        setState(() {
                          _privacyChecked = value ?? false;
                          _updateAllChecked();
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        '개인정보 보호약관 내용...',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // 만14세 이상 확인 섹션
              Card(
                child: CheckboxListTile(
                  title: const Text('만14세 이상입니다 (필수)'),
                  value: _ageChecked,
                  onChanged: (value) {
                    setState(() {
                      _ageChecked = value ?? false;
                      _updateAllChecked();
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              const SizedBox(height: 16),
              // 선택 약관 섹션
              const Text(
                '선택 약관',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              // 마케팅 활용 동의 섹션
              Card(
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: const Text('마케팅 활용 동의 (선택)'),
                      value: _marketingChecked,
                      onChanged: (value) {
                        setState(() {
                          _marketingChecked = value ?? false;
                          _updateAllChecked();
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        '마케팅 활용 동의 내용...',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // 다음 버튼 섹션
              ElevatedButton(
                onPressed: _isValid
                    ? () {
                        widget.onTermsAccepted(_marketingChecked);
                        Navigator.pop(context);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('다음'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 