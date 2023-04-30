# Driot Design 

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

## Architecture 

- Base: Phoenix / Ash / Postgresql / CubDB
- GraphQL and Restful Interfaces 
- Periodic export from CubDB to Parquet
- TS Data in Parquet files 
- Data access via Explorer 
- Export from CubDB to InfluxDB periodically 

## Data Model 

- User 
- Source 
- SourceType 

