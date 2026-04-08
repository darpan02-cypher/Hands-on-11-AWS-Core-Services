# AWS Core Services Hands-on (S3, Glue, CloudWatch, Athena)

## Overview
This project demonstrates the use of AWS S3, IAM, Glue, CloudWatch, and Athena to process and analyze e-commerce sales data.

## Approach
1. **S3 Buckets**: Created separate buckets for raw and processed data. Uploaded the Kaggle dataset to the raw data bucket.
2. **IAM Role**: Created a role with S3 and Glue access for the Glue crawler.
3. **Glue Crawler**: Set up a crawler to scan the raw data and create tables in the Glue Data Catalog.
4. **CloudWatch**: Monitored the crawler's run and status.
5. **Athena**: Queried the crawled data using SQL.

## Athena Queries
See [athena_queries.sql](athena_queries.sql) for all queries used.

## Results
CSV results for each query are in the `sql_results/` folder.

## Screenshots
- **S3 Buckets**: ![S3 Screenshot](screenshots/s3.png)
- **IAM Role**: ![IAM Role Screenshot](screenshots/iam_role.png)
- **CloudWatch**: ![CloudWatch Screenshot](screenshots/cloudwatch.png)

## How to Reproduce
1. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data).
2. Follow the steps in this README to set up AWS resources and run the queries.

---

**Replace `your_table` in the SQL with your actual table name.**

---

