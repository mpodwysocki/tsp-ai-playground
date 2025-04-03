import "@typespec/http";

namespace GeoJSONDemo;

/// A coordinate can either be a two-item array [longitude, latitude]
/// or a three-item array [longitude, latitude, altitude].
alias Coordinate = [numeric, numeric] | [numeric, numeric, numeric];

/// Represents a single position in coordinate space.
model Point {
  /// The type of geometry (always "Point").
  type: "Point";

  /// The coordinates of the point (longitude, latitude, and optional altitude).
  coordinates: Coordinate;
}

/// Represents an array of multiple positions.
model MultiPoint {
  /// The type of geometry (always "MultiPoint").
  type: "MultiPoint";

  /// An array of coordinates for multiple points.
  coordinates: Coordinate[];
}

/// Represents a sequence of two or more positions forming a line.
model LineString {
  /// The type of geometry (always "LineString").
  type: "LineString";

  /// An array of coordinates forming the line.
  coordinates: Coordinate[];
}

/// Represents an array of LineString coordinate arrays.
model MultiLineString {
  /// The type of geometry (always "MultiLineString").
  type: "MultiLineString";

  /// An array of LineString coordinate arrays.
  coordinates: Coordinate[][];
}

/// Represents a two-dimensional surface bounded by linear rings.
model Polygon {
  /// The type of geometry (always "Polygon").
  type: "Polygon";

  /// An array of linear rings (outer ring first, followed by holes).
  coordinates: Coordinate[][];
}

/// Represents an array of Polygon coordinate arrays.
model MultiPolygon {
  /// The type of geometry (always "MultiPolygon").
  type: "MultiPolygon";

  /// An array of Polygon coordinate arrays.
  coordinates: Coordinate[][][];
}

/// Represents a collection of geometry objects.
model GeometryCollection {
  /// The type of geometry (always "GeometryCollection").
  type: "GeometryCollection";

  /// An array of geometry objects.
  geometries: Geometry[];
}

/// Represents a GeoJSON geometry object.
union Geometry {
  Point | MultiPoint | LineString | MultiLineString | Polygon | MultiPolygon | GeometryCollection;
}

/// Represents a GeoJSON feature.
model Feature {
  /// The type of GeoJSON object (always "Feature").
  type: "Feature";

  /// The geometry of the feature.
  geometry: Geometry;

  /// Additional properties associated with the feature.
  properties?: Record<unknown>;

  /// A unique identifier for the feature.
  id?: string | numeric;
}
/// Represents a collection of GeoJSON features.
model FeatureCollection {
  /// The type of GeoJSON object (always "FeatureCollection").
  type: "FeatureCollection";

  /// An array of features.
  features: Feature[];
}
