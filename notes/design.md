# Datacat Design 

## Home and Vehicle Data Collection 

Van and Home IOT Data 
- sensors
- security systems
- alerts 
- device control (lights, alarms)
- lightweight analytics 
- export to TSDB 

Sensors 
- Shelly H&T 
- Esp32 Temp & Humidity 
- GPS 
- Voltage and Current (van) 
- Internet Data Rate 
- Camera Classification 
- Audio Signals
- RF Signals 

Data 
- Log files 
- Metrics

## Architecture 

- Base: Phoenix / Ash / Postgresql / CubDB
- GraphQL and Restful Interfaces 
- Periodic export from CubDB to Parquet
- TS Data in Parquet files 
- Data access via Explorer 
- Export from CubDB to InfluxDB periodically 

## FS Layout 

Recommendation 

| lib/            | base dir                  |                       |
| > datacat/      |                           |                       |
| >> blog/        | bounded context dir       |                       |
| >>> blog.ex     | "api" for bounded context | Datacat.Blog          |
| >>> registry.ex | registry                  | Datacat.Blog.Registry |
| >>> resources/  | resources dir             |                       |
| >>>> post.ex    | post resource             | Datacat.Blog.Post     |

Modified Ash 

| lib/            | base dir                    |                       |
| > datacat/      |                             |                       |
| >> afm          | directory for ash framework |                       |
| >>> blog.ex     | "api" for bounded context   | Datacat.Blog          |
| >> blog/        | bounded context dir         |                       |
| >>> registry.ex | registry                    | Datacat.Blog.Registry |
| >>> resources/  | resources dir               |                       |
| >>>> post.ex    | post resource               | Datacat.Blog.Post     |

Decision: 
- organize Ash assets under the 'afm' (ash framework) namespace
- use their recommended layouts 

## Data Model 

- User 
- Source 
- SourceType 
- Repo

Repo Fields:
- schema 
- name 
- type 
- owner 
- encryption 
- public key 

Repo Types: 
- CubDB 
- CSV 
- JSON 
- ndJSON 
- Parquet 
- Sqlite 
- Duckdb 

Operations: 
- move / copy / rename 
- transform 
- bash 
- exec 
- alert 

Operations: a standalone repo, upstream of Datacat and Jobex 
- defined in yaml - like ansible 
- 

Repos are: 
- portable
- single-file or single-directory 

Repo access: 
- local file path  
- s3 
- http url 
- ftp url 
