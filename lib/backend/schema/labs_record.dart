import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'labs_record.g.dart';

abstract class LabsRecord implements Built<LabsRecord, LabsRecordBuilder> {
  static Serializer<LabsRecord> get serializer => _$labsRecordSerializer;

  @nullable
  String get doctor;

  @nullable
  @BuiltValueField(wireName: 'doctor_number')
  String get doctorNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LabsRecordBuilder builder) => builder
    ..doctor = ''
    ..doctorNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('labs');

  static Stream<LabsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LabsRecord._();
  factory LabsRecord([void Function(LabsRecordBuilder) updates]) = _$LabsRecord;

  static LabsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createLabsRecordData({
  String doctor,
  String doctorNumber,
}) =>
    serializers.toFirestore(
        LabsRecord.serializer,
        LabsRecord((l) => l
          ..doctor = doctor
          ..doctorNumber = doctorNumber));
