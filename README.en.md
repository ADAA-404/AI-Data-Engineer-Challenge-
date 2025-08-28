[Versión en Español](README.md)

# AI-Data-Engineer-Challenge- 📈
This project demonstrates a complete end-to-end data pipeline designed to transform raw advertising spend data into actionable business metrics. The project uses a modern stack for data ingestion, storage in a relational data warehouse, and modeling of key metrics (KPIs) with SQL.  

The main objective is to answer the business question: “How did marketing performance (measured by CAC and ROAS) change between the last 30 days and the previous 30 days?”  

## Project Structure 📁
The project is organized into modular components for each phase of the data pipeline:
- n8n_workflow.json: The file containing the complete data ingestion workflow, from downloading the CSV file to loading it into the PostgreSQL database.  
- kpi_analysis.sql: The SQL script that analyzes the data to calculate CAC, ROAS, and comparison metrics.  
- docs/: Folder containing screenshots and diagrams of the project.  

## Technologies Used 🦾
- n8n Cloud: For data ingestion and orchestration. It is the no-code orchestrator that manages the ETL (Extract, Transform, Load) workflow. 
- Supabase: A relational database service that functions as a data warehouse, optimized for data storage and analysis.
- SQL (PostgreSQL): The programming language used for data modeling and KPI calculation.  
- Google Drive: As the external data source containing the ads_spend CSV file.

## Installation and Configuration ⚙️
- Clone the Repository (Bash):  
git clone https://github.com/ADAA-404/AI-Data-Engineer-Challenge-.git   
cd AI-Data-Engineer-Challenge-  

-  Configure the database:
Create a free account on Supabase and create a new database project.    
Follow the instructions to create the ads_spend_ingested table with the CREATE TABLE script.    

- Configure the n8n flow:
Import the n8n_workflow.json file into your n8n Cloud workspace.
Be sure to update the PostgreSQL node credentials with your Supabase database credentials.  

## How to Use 📎
This project requires the files provided and consideration of your own credentials for use, as is the case with the database.

- Data Entry::
Ensure that your Supabase database is configured and that the ads_spend_ingested table exists.    
In n8n Cloud, click Execute Workflow to run the ingestion pipeline. This will download the CSV, transform the data, and insert the rows into your database.     

- KPI analysis:
In the Supabase SQL Editor, open the kpi_analysis.sql file.   
Replace the reference date in the query with the desired end date of your analysis.   
Run the query to see the CAC and ROAS results.  

## Agent Demonstration (Natural Language to SQL Mapping) 🤖
"Compare the CAC and ROAS for the last 30 days with respect to the previous 30 days."  

Mapping to the SQL Query: This question is mapped directly to the query located in the kpi_analysis.sql file.  
The “Compare” is translated into the calculation of the delta (percentage change).  
CAC and ROAS are metrics calculated based on spend and conversions.  
“last 30 days” and “previous 30 days” translate into date filters (WHERE) within Common Table Expressions (CTEs).  

Result: When running the query with the project date range, the following table is obtained, which accurately answers the business question. 

![Table obtained from SQL query](Images/Streamlit_View_Ex1.png)

## Contributions 🖨️
If you're interested in contributing to this project or using it independently, consider:   
- Forking the repository.
- Creating a new branch (git checkout -b feature/new-feature).
- Making your changes and committing them (git commit -am 'Add new feature').
- Pushing your changes to the branch (git push origin feature/new-feature).
- Opening a Pull Request.

## License 📜
This project is under the MIT License. See the LICENSE file (if applicable) for more details.
