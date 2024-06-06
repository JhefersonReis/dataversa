// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetResponseCollection on Isar {
  IsarCollection<Response> get responses => this.collection();
}

const ResponseSchema = CollectionSchema(
  name: r'Response',
  id: -770670630193068561,
  properties: {
    r'geoLatitude': PropertySchema(
      id: 0,
      name: r'geoLatitude',
      type: IsarType.double,
    ),
    r'geoLongitude': PropertySchema(
      id: 1,
      name: r'geoLongitude',
      type: IsarType.double,
    ),
    r'surveyId': PropertySchema(
      id: 2,
      name: r'surveyId',
      type: IsarType.long,
    ),
    r'syncAt': PropertySchema(
      id: 3,
      name: r'syncAt',
      type: IsarType.long,
    ),
    r'timestamp': PropertySchema(
      id: 4,
      name: r'timestamp',
      type: IsarType.long,
    ),
    r'updateId': PropertySchema(
      id: 5,
      name: r'updateId',
      type: IsarType.long,
    )
  },
  estimateSize: _responseEstimateSize,
  serialize: _responseSerialize,
  deserialize: _responseDeserialize,
  deserializeProp: _responseDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _responseGetId,
  getLinks: _responseGetLinks,
  attach: _responseAttach,
  version: '3.1.0+1',
);

int _responseEstimateSize(
  Response object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _responseSerialize(
  Response object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.geoLatitude);
  writer.writeDouble(offsets[1], object.geoLongitude);
  writer.writeLong(offsets[2], object.surveyId);
  writer.writeLong(offsets[3], object.syncAt);
  writer.writeLong(offsets[4], object.timestamp);
  writer.writeLong(offsets[5], object.updateId);
}

Response _responseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Response(
    geoLatitude: reader.readDouble(offsets[0]),
    geoLongitude: reader.readDouble(offsets[1]),
    id: id,
    surveyId: reader.readLong(offsets[2]),
    syncAt: reader.readLongOrNull(offsets[3]),
    timestamp: reader.readLong(offsets[4]),
    updateId: reader.readLongOrNull(offsets[5]),
  );
  return object;
}

P _responseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _responseGetId(Response object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _responseGetLinks(Response object) {
  return [];
}

void _responseAttach(IsarCollection<dynamic> col, Id id, Response object) {
  object.id = id;
}

extension ResponseQueryWhereSort on QueryBuilder<Response, Response, QWhere> {
  QueryBuilder<Response, Response, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ResponseQueryWhere on QueryBuilder<Response, Response, QWhereClause> {
  QueryBuilder<Response, Response, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Response, Response, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Response, Response, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Response, Response, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ResponseQueryFilter
    on QueryBuilder<Response, Response, QFilterCondition> {
  QueryBuilder<Response, Response, QAfterFilterCondition> geoLatitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition>
      geoLatitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geoLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> geoLatitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geoLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> geoLatitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geoLatitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> geoLongitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition>
      geoLongitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geoLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> geoLongitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geoLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> geoLongitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geoLongitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> surveyIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> surveyIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> surveyIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> surveyIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surveyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> syncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncAt',
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> syncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncAt',
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> syncAtEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> syncAtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> syncAtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> syncAtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> timestampEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> timestampGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> timestampLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> timestampBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> updateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateId',
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> updateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateId',
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> updateIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateId',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> updateIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateId',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> updateIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateId',
        value: value,
      ));
    });
  }

  QueryBuilder<Response, Response, QAfterFilterCondition> updateIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ResponseQueryObject
    on QueryBuilder<Response, Response, QFilterCondition> {}

extension ResponseQueryLinks
    on QueryBuilder<Response, Response, QFilterCondition> {}

extension ResponseQuerySortBy on QueryBuilder<Response, Response, QSortBy> {
  QueryBuilder<Response, Response, QAfterSortBy> sortByGeoLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoLatitude', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> sortByGeoLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoLatitude', Sort.desc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> sortByGeoLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoLongitude', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> sortByGeoLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoLongitude', Sort.desc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> sortBySurveyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyId', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> sortBySurveyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyId', Sort.desc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> sortBySyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncAt', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> sortBySyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncAt', Sort.desc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> sortByUpdateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateId', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> sortByUpdateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateId', Sort.desc);
    });
  }
}

extension ResponseQuerySortThenBy
    on QueryBuilder<Response, Response, QSortThenBy> {
  QueryBuilder<Response, Response, QAfterSortBy> thenByGeoLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoLatitude', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenByGeoLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoLatitude', Sort.desc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenByGeoLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoLongitude', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenByGeoLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoLongitude', Sort.desc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenBySurveyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyId', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenBySurveyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyId', Sort.desc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenBySyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncAt', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenBySyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncAt', Sort.desc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenByUpdateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateId', Sort.asc);
    });
  }

  QueryBuilder<Response, Response, QAfterSortBy> thenByUpdateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateId', Sort.desc);
    });
  }
}

extension ResponseQueryWhereDistinct
    on QueryBuilder<Response, Response, QDistinct> {
  QueryBuilder<Response, Response, QDistinct> distinctByGeoLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoLatitude');
    });
  }

  QueryBuilder<Response, Response, QDistinct> distinctByGeoLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoLongitude');
    });
  }

  QueryBuilder<Response, Response, QDistinct> distinctBySurveyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surveyId');
    });
  }

  QueryBuilder<Response, Response, QDistinct> distinctBySyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncAt');
    });
  }

  QueryBuilder<Response, Response, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<Response, Response, QDistinct> distinctByUpdateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateId');
    });
  }
}

extension ResponseQueryProperty
    on QueryBuilder<Response, Response, QQueryProperty> {
  QueryBuilder<Response, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Response, double, QQueryOperations> geoLatitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoLatitude');
    });
  }

  QueryBuilder<Response, double, QQueryOperations> geoLongitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoLongitude');
    });
  }

  QueryBuilder<Response, int, QQueryOperations> surveyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surveyId');
    });
  }

  QueryBuilder<Response, int?, QQueryOperations> syncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncAt');
    });
  }

  QueryBuilder<Response, int, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<Response, int?, QQueryOperations> updateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateId');
    });
  }
}
