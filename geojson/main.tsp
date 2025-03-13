import "@typespec/http";

namespace GeoJSON;

model Point {
  type: "Point";
  coordinates: [numeric, numeric];
}

model MultiPoint {
  type: "MultiPoint";
  coordinates: [numeric, numeric][];
}

model LineString {
  type: "LineString";
  coordinates: [numeric, numeric][];
}

model MultiLineString {
  type: "MultiLineString";
  coordinates: [ [numeric, numeric][] ];
}

model Polygon {
  type: "Polygon";
  coordinates: [ [numeric, numeric][] ][];
}

model MultiPolygon {
  type: "MultiPolygon";

  // Each element in `coordinates` is one polygon.
  // Each polygon is an array of linear rings.
  // Each linear ring is an array of coordinate pairs.
  coordinates: [ [ [numeric, numeric][] ] ][];
}

union Geometry {
  Point,
  MultiPoint,
  LineString,
  MultiLineString,
  Polygon,
  MultiPolygon
}

model GeometryCollection {
  type: "GeometryCollection";
  geometries: Geometry[];
}

model Feature {
  type: "Feature";
  geometry?: Geometry | null;
  properties?: {};
  id?: string | float64;
}

model FeatureCollection {
  type: "FeatureCollection";
  features: Feature[];
}
