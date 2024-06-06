// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_properties_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestionPropertiesCollection on Isar {
  IsarCollection<QuestionProperties> get questionProperties =>
      this.collection();
}

const QuestionPropertiesSchema = CollectionSchema(
  name: r'QuestionProperties',
  id: -4430847684130649962,
  properties: {
    r'answerOptions': PropertySchema(
      id: 0,
      name: r'answerOptions',
      type: IsarType.string,
    ),
    r'availableAnswers': PropertySchema(
      id: 1,
      name: r'availableAnswers',
      type: IsarType.string,
    ),
    r'gid': PropertySchema(
      id: 2,
      name: r'gid',
      type: IsarType.long,
    ),
    r'mandatory': PropertySchema(
      id: 3,
      name: r'mandatory',
      type: IsarType.string,
    ),
    r'maxNumOfFiles': PropertySchema(
      id: 4,
      name: r'maxNumOfFiles',
      type: IsarType.string,
    ),
    r'other': PropertySchema(
      id: 5,
      name: r'other',
      type: IsarType.string,
    ),
    r'parentQid': PropertySchema(
      id: 6,
      name: r'parentQid',
      type: IsarType.long,
    ),
    r'questionOrder': PropertySchema(
      id: 7,
      name: r'questionOrder',
      type: IsarType.long,
    ),
    r'questionThemeName': PropertySchema(
      id: 8,
      name: r'questionThemeName',
      type: IsarType.string,
    ),
    r'sid': PropertySchema(
      id: 9,
      name: r'sid',
      type: IsarType.long,
    ),
    r'subquestions': PropertySchema(
      id: 10,
      name: r'subquestions',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 11,
      name: r'title',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 12,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _questionPropertiesEstimateSize,
  serialize: _questionPropertiesSerialize,
  deserialize: _questionPropertiesDeserialize,
  deserializeProp: _questionPropertiesDeserializeProp,
  idName: r'qid',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _questionPropertiesGetId,
  getLinks: _questionPropertiesGetLinks,
  attach: _questionPropertiesAttach,
  version: '3.1.0+1',
);

int _questionPropertiesEstimateSize(
  QuestionProperties object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.answerOptions.length * 3;
  bytesCount += 3 + object.availableAnswers.length * 3;
  {
    final value = object.mandatory;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.maxNumOfFiles;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.other.length * 3;
  bytesCount += 3 + object.questionThemeName.length * 3;
  bytesCount += 3 + object.subquestions.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _questionPropertiesSerialize(
  QuestionProperties object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.answerOptions);
  writer.writeString(offsets[1], object.availableAnswers);
  writer.writeLong(offsets[2], object.gid);
  writer.writeString(offsets[3], object.mandatory);
  writer.writeString(offsets[4], object.maxNumOfFiles);
  writer.writeString(offsets[5], object.other);
  writer.writeLong(offsets[6], object.parentQid);
  writer.writeLong(offsets[7], object.questionOrder);
  writer.writeString(offsets[8], object.questionThemeName);
  writer.writeLong(offsets[9], object.sid);
  writer.writeString(offsets[10], object.subquestions);
  writer.writeString(offsets[11], object.title);
  writer.writeString(offsets[12], object.type);
}

QuestionProperties _questionPropertiesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionProperties(
    answerOptions: reader.readString(offsets[0]),
    availableAnswers: reader.readString(offsets[1]),
    gid: reader.readLong(offsets[2]),
    mandatory: reader.readStringOrNull(offsets[3]),
    maxNumOfFiles: reader.readStringOrNull(offsets[4]),
    other: reader.readString(offsets[5]),
    parentQid: reader.readLong(offsets[6]),
    qid: id,
    questionOrder: reader.readLong(offsets[7]),
    questionThemeName: reader.readString(offsets[8]),
    sid: reader.readLong(offsets[9]),
    subquestions: reader.readString(offsets[10]),
    title: reader.readString(offsets[11]),
    type: reader.readString(offsets[12]),
  );
  return object;
}

P _questionPropertiesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionPropertiesGetId(QuestionProperties object) {
  return object.qid;
}

List<IsarLinkBase<dynamic>> _questionPropertiesGetLinks(
    QuestionProperties object) {
  return [];
}

void _questionPropertiesAttach(
    IsarCollection<dynamic> col, Id id, QuestionProperties object) {
  object.qid = id;
}

extension QuestionPropertiesQueryWhereSort
    on QueryBuilder<QuestionProperties, QuestionProperties, QWhere> {
  QueryBuilder<QuestionProperties, QuestionProperties, QAfterWhere> anyQid() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionPropertiesQueryWhere
    on QueryBuilder<QuestionProperties, QuestionProperties, QWhereClause> {
  QueryBuilder<QuestionProperties, QuestionProperties, QAfterWhereClause>
      qidEqualTo(Id qid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: qid,
        upper: qid,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterWhereClause>
      qidNotEqualTo(Id qid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: qid, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: qid, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: qid, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: qid, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterWhereClause>
      qidGreaterThan(Id qid, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: qid, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterWhereClause>
      qidLessThan(Id qid, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: qid, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterWhereClause>
      qidBetween(
    Id lowerQid,
    Id upperQid, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerQid,
        includeLower: includeLower,
        upper: upperQid,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuestionPropertiesQueryFilter
    on QueryBuilder<QuestionProperties, QuestionProperties, QFilterCondition> {
  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      answerOptionsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      answerOptionsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      answerOptionsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      answerOptionsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answerOptions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      answerOptionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      answerOptionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      answerOptionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      answerOptionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answerOptions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      answerOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerOptions',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      answerOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answerOptions',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      availableAnswersEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'availableAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      availableAnswersGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'availableAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      availableAnswersLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'availableAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      availableAnswersBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'availableAnswers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      availableAnswersStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'availableAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      availableAnswersEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'availableAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      availableAnswersContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'availableAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      availableAnswersMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'availableAnswers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      availableAnswersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'availableAnswers',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      availableAnswersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'availableAnswers',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      gidEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      gidGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      gidLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      gidBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mandatory',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mandatory',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mandatory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mandatory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mandatory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mandatory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mandatory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mandatory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mandatory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mandatory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mandatory',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      mandatoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mandatory',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxNumOfFiles',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxNumOfFiles',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxNumOfFiles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxNumOfFiles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxNumOfFiles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxNumOfFiles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'maxNumOfFiles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'maxNumOfFiles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'maxNumOfFiles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'maxNumOfFiles',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxNumOfFiles',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      maxNumOfFilesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'maxNumOfFiles',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      otherEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      otherGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      otherLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      otherBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'other',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      otherStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      otherEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      otherContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'other',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      otherMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'other',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      otherIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'other',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      otherIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'other',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      parentQidEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentQid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      parentQidGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentQid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      parentQidLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentQid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      parentQidBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentQid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      qidEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      qidGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      qidLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      qidBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionThemeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionThemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionThemeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionThemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionThemeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionThemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionThemeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionThemeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionThemeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionThemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionThemeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionThemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionThemeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionThemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionThemeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionThemeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionThemeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionThemeName',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      questionThemeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionThemeName',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      sidEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      sidGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      sidLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sid',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      sidBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      subquestionsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subquestions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      subquestionsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subquestions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      subquestionsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subquestions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      subquestionsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subquestions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      subquestionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subquestions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      subquestionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subquestions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      subquestionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subquestions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      subquestionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subquestions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      subquestionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subquestions',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      subquestionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subquestions',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension QuestionPropertiesQueryObject
    on QueryBuilder<QuestionProperties, QuestionProperties, QFilterCondition> {}

extension QuestionPropertiesQueryLinks
    on QueryBuilder<QuestionProperties, QuestionProperties, QFilterCondition> {}

extension QuestionPropertiesQuerySortBy
    on QueryBuilder<QuestionProperties, QuestionProperties, QSortBy> {
  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByAnswerOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerOptions', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByAnswerOptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerOptions', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByAvailableAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableAnswers', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByAvailableAnswersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableAnswers', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByGid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gid', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByGidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gid', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByMandatory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mandatory', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByMandatoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mandatory', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByMaxNumOfFiles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxNumOfFiles', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByMaxNumOfFilesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxNumOfFiles', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByOther() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'other', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByOtherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'other', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByParentQid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentQid', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByParentQidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentQid', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByQuestionOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionOrder', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByQuestionOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionOrder', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByQuestionThemeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionThemeName', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByQuestionThemeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionThemeName', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortBySid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sid', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortBySidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sid', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortBySubquestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subquestions', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortBySubquestionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subquestions', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension QuestionPropertiesQuerySortThenBy
    on QueryBuilder<QuestionProperties, QuestionProperties, QSortThenBy> {
  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByAnswerOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerOptions', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByAnswerOptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerOptions', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByAvailableAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableAnswers', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByAvailableAnswersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableAnswers', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByGid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gid', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByGidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gid', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByMandatory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mandatory', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByMandatoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mandatory', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByMaxNumOfFiles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxNumOfFiles', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByMaxNumOfFilesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxNumOfFiles', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByOther() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'other', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByOtherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'other', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByParentQid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentQid', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByParentQidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentQid', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByQid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qid', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByQidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qid', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByQuestionOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionOrder', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByQuestionOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionOrder', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByQuestionThemeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionThemeName', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByQuestionThemeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionThemeName', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenBySid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sid', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenBySidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sid', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenBySubquestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subquestions', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenBySubquestionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subquestions', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension QuestionPropertiesQueryWhereDistinct
    on QueryBuilder<QuestionProperties, QuestionProperties, QDistinct> {
  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctByAnswerOptions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answerOptions',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctByAvailableAnswers({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'availableAnswers',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctByGid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gid');
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctByMandatory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mandatory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctByMaxNumOfFiles({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxNumOfFiles',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctByOther({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'other', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctByParentQid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentQid');
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctByQuestionOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionOrder');
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctByQuestionThemeName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionThemeName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctBySid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sid');
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctBySubquestions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subquestions', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionProperties, QuestionProperties, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension QuestionPropertiesQueryProperty
    on QueryBuilder<QuestionProperties, QuestionProperties, QQueryProperty> {
  QueryBuilder<QuestionProperties, int, QQueryOperations> qidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qid');
    });
  }

  QueryBuilder<QuestionProperties, String, QQueryOperations>
      answerOptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answerOptions');
    });
  }

  QueryBuilder<QuestionProperties, String, QQueryOperations>
      availableAnswersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'availableAnswers');
    });
  }

  QueryBuilder<QuestionProperties, int, QQueryOperations> gidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gid');
    });
  }

  QueryBuilder<QuestionProperties, String?, QQueryOperations>
      mandatoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mandatory');
    });
  }

  QueryBuilder<QuestionProperties, String?, QQueryOperations>
      maxNumOfFilesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxNumOfFiles');
    });
  }

  QueryBuilder<QuestionProperties, String, QQueryOperations> otherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'other');
    });
  }

  QueryBuilder<QuestionProperties, int, QQueryOperations> parentQidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentQid');
    });
  }

  QueryBuilder<QuestionProperties, int, QQueryOperations>
      questionOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionOrder');
    });
  }

  QueryBuilder<QuestionProperties, String, QQueryOperations>
      questionThemeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionThemeName');
    });
  }

  QueryBuilder<QuestionProperties, int, QQueryOperations> sidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sid');
    });
  }

  QueryBuilder<QuestionProperties, String, QQueryOperations>
      subquestionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subquestions');
    });
  }

  QueryBuilder<QuestionProperties, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<QuestionProperties, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
