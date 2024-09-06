// date_time_adapter.dart

import 'package:hive/hive.dart';

class DateTimeAdapter extends TypeAdapter<DateTime> {
  @override
  final typeId = 3; // Unique ID for this adapter

  @override
  DateTime read(BinaryReader reader) {
    // Convert the timestamp from milliseconds since epoch back to DateTime
    return DateTime.fromMillisecondsSinceEpoch(reader.readInt());
  }

  @override
  void write(BinaryWriter writer, DateTime obj) {
    // Write the milliseconds since epoch of DateTime
    writer.writeInt(obj.millisecondsSinceEpoch);
  }
}
