# NLM API Integration

Sponsored by: In-Game Event, A Red Flag Syndicate LLC.


## End Goal
Create massive health care monitoring system on a personal and global level. A full healthcare data platform!
- Collect and normalize data FHIR, X12, CCD, HL7, Flat files
- Analyze data based on factors, labs, eating habits, environmental factors
    - Vaccines
    - Medication issues
    - Pollution (Air quality, water quality, etc)
- Exercise habits aka Life Style
- Living Location
- Pre-disposed data birth conditions (DNA)
- Food Quality (Chemicals in what you eat, where was the food grown? Do we have soil results for what the food is taking in for nutrients)
- AI integration to detect anomalies and potential outbreaks.
- Natural and functional medicine approaches as well as western medicine.
- Transparency and informed consent.
- Disease discovery from ICD-10 codes alerts to Kafka for interested systems
- And more like High locations for problems on a map and many more ideas.
- This is just the tip of that iceberg 


## Thinking out loud - maybe all of this implemented maybe not. This is brainstorming.
- Kafka of course for events and plug and play systems. Remember they are messages that any "micro" system can use if
  you plug it into kafka as a "service" let me read the events.
- Airflow if we need to programmatically pipe things
- Redis for cache
- GraphQL for FHIR integration
- Cassandra for distributed database. Lots of people... lots of data... 
  - if we make this a personal app as well we can forgo cassandra for Postgres or just use 1 node. with the option to join the main community on a centralize server. 
  - as well as unjoin and have your data removed. 
  - Consent is a big issue and it should be transparent and not behind the scenes.
- Consent should have a toggle for who you allow to access your data in the main shared community.
  - Like we just onboarded this insurance company. Would you like to share your data with them? Full Transparent opt-in/opt-out. 
    - you will never be automatically opted in to any place. You will always need to give permission.
- docker compose/kubernetes
- grafana/prometheus for observability into the systems. 
  - logs to spit out events
  - grafana to view the events over time (metrics)
- spring framework (JPA, Ribbon, Eureka, web, etc... for provider and patient access)
- when we get to patient matching openempi
- probably python for reports
- probably python for AI integrations
- Mirth Connect for ETL's of data.
- Maybe look into druid for analytic support
- 