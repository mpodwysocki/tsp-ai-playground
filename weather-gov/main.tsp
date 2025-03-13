import "@typespec/http";
import "@typespec/versioning";

using TypeSpec.Http;
using TypeSpec.Versioning;

/// Versions
enum Versions {
  v2: "2.0.0";
}

/// Weather.gov API
@versioned(Versions)
@service(#{ title: "Weather.gov API" })
@server("https://api.weather.gov")
namespace WeatherGov {
  /// Interface for Alerts operations
  @route("/alerts")
  interface AlertsOperations {
    /// Get weather alerts
    @get
    op getAlerts(
      /// Filter alerts by area (state or zone code)
      @query area?: string,
      /// Filter alerts by alert type
      @query event?: string,
      /// Filter alerts by start time (ISO8601 format)
      @query start?: utcDateTime,
      /// Filter alerts by end time (ISO8601 format)
      @query end?: utcDateTime,
      /// Filter alerts by status
      @query status?: string,
      /// Filter alerts by message type
      @query messageType?: string,
      /// Filter alerts by certainty level
      @query certainty?: string,
      /// Filter alerts by urgency level
      @query urgency?: string,
      /// Filter alerts by sender
      @query sender?: string,
      /// Filter alerts by severity level
      @query severity?: string,
      /// Filter alerts by effective date/time (ISO8601 format)
      @query effective?: utcDateTime,
      /// Filter alerts by expiration date/time (ISO8601 format)
      @query expires?: utcDateTime,
      /// Limit the number of returned alerts
      @query limit?: int32
    ): Alerts | ErrorResponse;
  }

  /// Interface for Active Alerts operations
  @route("/alerts/active")
  interface ActiveAlerts {
    /// Get active weather alerts
    @get
    op getActiveAlerts(): Alerts | ErrorResponse;
  }

  /// Interface for Active Alerts Count operations
  @route("/alerts/active/count")
  interface ActiveAlertsCount {
    /// Get count of active weather alerts
    @get
    op getActiveAlertsCount(): AlertsCount | ErrorResponse;
  }

  /// Interface for Alert Types operations
  @route("/alerts/types")
  interface AlertTypes {
    /// Get available alert types
    @get
    op getAlertTypes(): AlertTypesResponse | ErrorResponse;
  }

  /// Represents a collection of alert types
  model AlertTypesResponse {
    /// Array of alert types
    types: string[];
  }

  /// Represents the count of active alerts
  model AlertsCount {
    /// Total number of active alerts
    total: int32;
  }

  /// Represents an error response from the API
  model ErrorResponse {
    /// HTTP status code of the error
    status: int32;
    /// Title of the error
    title: string;
    /// Detailed description of the error
    detail?: string;
    /// Type of the error
    type?: string;
    /// Instance identifier for the error occurrence
    instance?: string;
  }

  /// Represents a collection of weather alerts
  model Alerts {
    /// Type of the response
    type: string;
    /// Features array containing alert details
    features: AlertFeature[];
    /// Title of the alert collection
    title?: string;
    /// Last updated timestamp
    updated?: string;
  }

  /// Represents an individual alert feature
  model AlertFeature {
    /// Unique identifier for the alert
    id: string;
    /// Type of the feature
    type: string;
    /// Properties of the alert
    properties: AlertProperties;
  }

  /// Properties of an alert
  model AlertProperties {
    /// Area description of the alert
    areaDesc: string;
    /// Severity of the alert
    severity: string;
    /// Event type of the alert
    event: string;
    /// Effective timestamp of the alert
    effective?: string;
    /// Expiration timestamp of the alert
    expires?: string;
    /// Description of the alert
    description?: string;
    /// Instruction for the alert
    instruction?: string;
  }
}
