import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'procedure_record.g.dart';

abstract class ProcedureRecord
    implements Built<ProcedureRecord, ProcedureRecordBuilder> {
  static Serializer<ProcedureRecord> get serializer =>
      _$procedureRecordSerializer;

  @nullable
  String get parent;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProcedureRecordBuilder builder) => builder
    ..parent = ''
    ..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('procedure');

  static Stream<ProcedureRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProcedureRecord._();
  factory ProcedureRecord([void Function(ProcedureRecordBuilder) updates]) =
      _$ProcedureRecord;

  static ProcedureRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProcedureRecordData({
  String parent,
  String name,
}) =>
    serializers.toFirestore(
        ProcedureRecord.serializer,
        ProcedureRecord((p) => p
          ..parent = parent
          ..name = name));
