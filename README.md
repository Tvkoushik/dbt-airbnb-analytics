# Airbnb dbt Project

## Introduction

This dbt project is designed to transform Airbnb data, creating a series of models that can be used for analytical purposes. The project is organized into various directories and files, each serving a specific purpose in the ETL process.

## Project Structure

```plaintext
airbnb/
├── dbt_packages/
│ └── dbt_utils/
│ ├── integration_tests/
│ └── ...
├── logs/
├── models/
│ ├── dim/
│ ├── fct/
│ ├── mart/
│ ├── src/
│ └── ...
├── seeds/
├── snapshots/
├── target/
├── tests/
```

### Directory and File Descriptions

- **dbt_packages/dbt_utils/**: Contains utility functions and macros used in the project.
- **logs/**: Stores log files generated during dbt runs.
- **models/**: Contains the SQL models organized into various subdirectories:
  - **dim/**: Dimension tables.
  - **fct/**: Fact tables.
  - **mart/**: Data marts for specific analytical purposes.
  - **src/**: Source tables loaded from raw data.
- **seeds/**: Contains seed files in CSV format.
- **snapshots/**: Stores snapshot definitions for slowly changing dimensions.
- **target/**: Stores compiled SQL files and run artifacts.
- **tests/**: Contains SQL-based tests to validate the data models.

## Getting Started

### Prerequisites

- dbt (data build tool) installed
- A configured dbt profile with connection details to your data warehouse

### Installation

1. Clone the repository:

   ```bash
   git clone <repository_url>
   cd airbnb
   ```

2. Install dependencies:
   ```bash
   dbt deps
   ```

### Configuration

Ensure that your `profiles.yml` is configured with the appropriate connection details to your data warehouse.

### Running the Project

To run the models and generate the tables in your data warehouse, use:

```bash
dbt run
```

To run tests and validate the data models:

```bash
dbt test
```

Seed Data
To load the seed data into your data warehouse, use:

```bash
dbt seed
```

Snapshots
To create or update snapshots, use:

```bash
dbt snapshot
```

## Models

### Source Models

Source models are located in the `models/src` directory and include:

- `src_hosts.sql`
- `src_listings.sql`
- `src_reviews.sql`

These models are used to load the raw data from the source into the data warehouse.

### Dimension Models

Dimension models are located in the `models/dim` directory and include:

- `dim_hosts.sql`
- `dim_listings.sql`
- `dim_reviews.sql`

These models transform the raw data into cleaned and structured dimension tables.

### Fact Models

Fact models are located in the `models/fct` directory and include:

- `fct_reviews.sql`

These models aggregate the data into fact tables suitable for analytical purposes.

### Data Marts

Data marts are located in the `models/mart` directory and include:

- `mart_fullmoon_reviews.sql`

These models are designed for specific analytical use cases.

## Tests

Tests are located in the `tests` directory and include:

- `consistent_created_at.sql`
- `dim_listings_minumum_nights.sql`
- `no_nulls_in_dim_listings.sql`

These tests ensure the integrity and quality of the data models.

## Snapshots

Snapshots are located in the `snapshots` directory and include:

- `scd_raw_listings.sql`

These snapshots capture changes in the data over time, allowing for historical analysis.

## Logs and Targets

- **logs/**: Contains logs of the dbt runs.
- **target/**: Contains compiled SQL files and run artifacts.
