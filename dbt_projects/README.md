# Dimensional Modeling with dbt and Snowflake

## Overview

This project focuses on dimensional modeling using dbt (data build tool) and Snowflake for analyzing store sales data. Dimensional modeling is a data modeling technique optimized for data warehousing and analytics. By organizing data into dimensions and facts, dimensional modeling simplifies querying and enables efficient analysis of business metrics.

## Project Structure

The project is structured as follows:

- **dbt Projects**: The `dbt_projects` directory contains the dbt projects used for data transformation.
  - **Stage**: Initial loading of raw data from various sources.
  - **SK_MAP_TABLES**: A surrogate key mapping table is a type of table used in data warehousing to manage the relationships between natural keys (business keys) and surrogate keys.
  - **Dimensions**: Creation of dimension tables representing business entities such as customers, products, and time.
  - **Facts**: Creation of fact tables containing transactional data such as sales.

<img src="https://github.com/drdataSpp/data_projects/blob/master/dbt_projects/dbt_docs/DBT_docs.png" width="250%" height="200%">

## Data Lineage Diagram

<img src="https://github.com/drdataSpp/data_projects/blob/master/dbt_projects/dbt_docs/SALES_data_lineage.png" width="250%" height="200%">

## Sample Analysis Query

<img src="https://github.com/drdataSpp/data_projects/blob/master/dbt_projects/dbt_docs/Sample_Analysis_Query.png" width="250%" height="200%">

## Key Components of this Project

- **Snowflake**: The project leverages Snowflake as the cloud data warehouse for storing and processing data. Snowflake's scalability and performance make it suitable for handling large volumes of data.
  
- **dbt (Data Build Tool)**: dbt is used for data transformation and modeling. It provides a structured and version-controlled approach to building data pipelines and enables data engineers to define transformations using SQL-based models.

## Data Modeling

- **Dimension Tables**: Dimension tables represent business entities and contain descriptive attributes. Examples include `CUSTOMER_TYPE_DIM`, `PAYMENT_TYPE_DIM`, and `PRODUCT_LINE_DIM`.

- **Fact Tables**: Fact tables contain transactional data and quantitative measures. Examples include `STORE_FACT`.

## Data Quality Assurance

- **Data Tests**: Data tests are implemented using dbt to ensure data quality and integrity. These tests validate data against defined expectations, such as uniqueness, null values, and referential integrity. Tests can be found under `sk__models` file.

## Usage

To run the dbt project locally:

1. Clone the repository: `git clone https://github.com/drdataSpp/data_projects.git`
2. Set up a free Snowflake account, guide: `https://medium.com/@sooryaprakparthiban/snowflake-cloud-dw-1-snowflake-dreams-your-journey-to-free-cloud-data-warehousing-begins-here-b23f14a5ea3f`
3. Install dbt: [Installation Guide](https://docs.getdbt.com/dbt-cli/installation)
4. Configure dbt profiles: [Configuration Guide](https://docs.getdbt.com/docs/configure-your-profile)
5. Navigate to the `dbt_projects` directory.
6. Run dbt commands such as `dbt run` to execute the data transformation pipelines.

## Conclusion

This project demonstrates the application of dimensional modeling techniques using dbt and Snowflake for analyzing store sales data. By adopting best practices in data modeling and transformation, organizations can derive valuable insights to drive informed decision-making.
