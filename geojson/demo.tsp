import "@typespec/http";

namespace GeoJSONDemo;


  /// A GeoJSON Point
  model Point {
    type: "Point";
    coordinates: [numeric, numeric];
  }

  /// A GeoJSON MultiPoint
  model MultiPoint {
    type: "MultiPoint";
    coordinates: [numeric, numeric][];
  }
