# Online Tutor Marketplace

## Project Overview
This project demonstrates the full data modeling lifecycle for an **Online Tutor Marketplace** platform.  
The goal is to design and implement an **OLTP (Online Transaction Processing)** database schema that supports the core business processes of an e-learning marketplace — users, roles, courses, schedules, enrollments, and reviews.

The project applies **conceptual, logical, and physical modeling** techniques, including **normalization (1NF–5NF)**, and is implemented using **Oracle SQL Developer Data Modeler**.

---

## Repository Structure

```
online_tutor_marketplace/
│
├── docs/                   
│   ├── business_requirements.pdf             # Business requirements document (BRD)
│   ├── conceptual_model.svg                  # Conceptual model diagram
│   ├── logical_model_report.pdf              # Logical model report
│   ├── physical_model_report.pdf             # Physical model report
│
├── images/                
│   ├── conceptual_model.png                  # Exported conceptual model diagram
│   └── conceptual_model_transparent_bg.png
│
├── model/                
│   ├── online_tutor_marketplace.dmd          # Oracle Data Modeler project file
│   ├── online_tutor_marketplace/             # Supporting folder for .dmd project
│   └── ddl_script.sql                        # Generated DDL script
│
├── README.md
```

---

## Project Scope
The platform supports the following business processes:

- **Users & Roles** — Users can act as Students or Trainers, with roles managed in a dedicated table.  
- **Courses & Categories** — Trainers create courses, which are grouped into categories.  
- **Scheduling** — Courses are scheduled with start/end times and timezone support.  
- **Enrollments** — Students enroll into scheduled courses.  
- **Reviews & Ratings** — Students leave reviews and ratings for courses.  
- **Reference Data** — Supporting tables include Currency, Country, Language, and Timezone.  

---

## Data Modeling Lifecycle
1. **Business Requirements** — defined the business rules and system scope.  
2. **Conceptual Model** — high-level ERD showing entities and relationships.  
3. **Logical Model** — fully normalized (1NF–5NF), ensuring integrity and no redundancy.  
4. **Physical Model** — implemented with datatypes, indexes, PK/FK/UQ constraints.  
5. **DDL Script** — schema generated for Oracle DB deployment.  

---

## Tech Stack
- **Lucidchart** — conceptual model.
- **Oracle SQL Developer Data Modeler** — logical, and physical models.  

---

## How to Use
1. Clone this repository.  
2. Open `model/online_tutor_marketplace.dmd` in **Oracle SQL Developer Data Modeler** to view/edit the models.  
3. Review diagrams and reports under `docs/` and `images/`.  
4. Run `model/ddl_script.sql` in an Oracle Database environment to create the schema.  

---

## Author
Artemie Țurcanu - Data Analyst.