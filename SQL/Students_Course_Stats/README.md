
# Calculating Free-to-Paid Conversion Rate with SQL

## Case Description

This project demonstrates how SQL can be used to extract and analyze data to calculate the fraction of students who convert from free users to paying subscribers after starting a course. The project involves working with an excerpt of data—stripped of personally identifiable information—from the 365 platform to estimate the free-to-paid conversion rate among students who have engaged with video content.

## Project Requirements

The aim of this project is to put SQL skills into practice by working with three tables that store information about students' registration dates, engagement dates, and subscription purchase dates. The key tasks include:

1. **Extracting Data**: Using SQL to correctly extract data from the database.
2. **Calculating Key Metrics**: Estimating the fraction of students who purchase a subscription after starting a lecture.
3. **Analyzing Results**: Calculating several other key metrics and analyzing the results.

## Data Description

The data consists of three tables:
- **students**: Contains information about student registration dates.
- **engagement**: Contains information about student engagement dates with video content.
- **purchases**: Contains information about student subscription purchase dates.

### Table Schemas

#### students
| Column         | Type    | Description               |
|----------------|---------|---------------------------|
| student_id     | INT     | Unique ID of the student  |
| date_registered| DATE    | Date the student registered|

#### engagement
| Column         | Type    | Description               |
|----------------|---------|---------------------------|
| student_id     | INT     | Unique ID of the student  |
| date_watched   | DATE    | Date the student watched the video content|

#### purchases
| Column         | Type    | Description               |
|----------------|---------|---------------------------|
| purchase_id    | INT     | Unique ID of the purchase |
| student_id     | INT     | Unique ID of the student  |
| date_purchased | DATE    | Date the subscription was purchased|
