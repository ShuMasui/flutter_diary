set -e
dart run drift_dev schema dump lib/core/database.dart drift_schemas/
dart run drift_dev schema steps drift_schemas/ lib/core/database.steps.dart
echo "generate stepbystep code done";