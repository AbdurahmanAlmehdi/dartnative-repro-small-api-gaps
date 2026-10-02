import 'package:dartnative/dartnative.dart';

import 'dartnative_plugin_registrant.dart';

void main() {
  DartNativePluginRegistrant.registerAll();
  runApp(const SmallGapsRepro());
}

class SmallGapsRepro extends StatelessWidget {
  const SmallGapsRepro({super.key});

  static const _fields = [
    'Vehicle', 'Plate', 'Odometer (km)', 'Workshop', 'Date', 'Oil (L)',
    'Parts', 'Labour', 'Total (LYD)', 'Paid by', 'Notes', 'Next service (km)',
    'Driver', 'Route', 'Fuel (L)', 'Fuel cost', 'Tyres', 'Battery',
    'Invoice no.', 'Warranty', 'Reminder', 'Tags',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      brightness: Brightness.light,
      appBar: AppBar(title: const Text('Maintenance record')),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        // No keyboardDismissBehavior parameter here (ListView has one).
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('SingleChildScrollView has no keyboardDismissBehavior',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            const Text(
              'Expected (Flutter): with keyboardDismissBehavior: onDrag, dragging the '
              'form closes the keyboard.',
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 4),
            const Text(
              'Actual: the parameter does not exist here; focus a field, drag the form, '
              'and the keyboard stays up.',
              style: TextStyle(fontSize: 13, color: Color(0xFFC62828)),
            ),
            const SizedBox(height: 4),
            const Text(
              'Also missing (see README): Rect.fromCenter, '
              'EdgeInsetsDirectional.fromSTEB, ListView.separated.',
              style: TextStyle(fontSize: 13, color: Color(0xFF616161)),
            ),
            const SizedBox(height: 12),
            for (final label in _fields)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(decoration: InputDecoration(labelText: label)),
              ),
          ],
        ),
      ),
    );
  }
}
