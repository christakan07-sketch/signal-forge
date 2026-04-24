# Record Definitions

## raw_event record
Represents the original captured item before interpretation.

## normalized_event record
Represents the first structured interpretation of the raw event.
This is the handoff bridge between intake and case creation.

## case record
Represents one reusable event case inside the case library.
A case can exist without a full study yet.

## study record
Represents a research question applied to a case.
A case may have multiple studies.

## evidence record
Represents observations collected for a study.
A study may have multiple evidence updates over time.

## benchmark snapshot
Represents the comparison context used to avoid false attribution.

## price snapshot
Represents the market observation for one symbol over one observation point or window.
