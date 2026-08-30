# KaamSetu

**AI-Powered Workforce Employability, Skill Assessment and Job Matching
System for Civil Workers**

> Connecting skills with suitable construction jobs.

KaamSetu is an academic project that aims to connect construction
workers with builders and employers based on skills, experience,
location and job requirements. The platform also includes a
skill-assessment module so worker profiles can contain more than
self-declared skills.

## Project Goal

Construction workers often depend on local contacts and informal
networks to find work, while builders may struggle to quickly find
workers with the required trade and experience. KaamSetu provides a
common platform where workers can create profiles, complete skill
assessments, discover suitable jobs and apply directly to builders.

## Main Users

-   **Construction Workers:** masons, electricians, plumbers,
    carpenters, painters and general labourers.
-   **Builders / Employers:** create job requirements and review
    suitable workers or applicants.
-   **Admin:** manages users, jobs, skills and platform data.

## Planned Features

### Worker Application

-   Phone/OTP login
-   Worker registration and profile
-   Trade and skill selection
-   Skill assessment
-   Job discovery and search
-   Job details
-   Location-based job recommendations
-   Apply for jobs
-   Application status tracking
-   Notifications

### Builder Dashboard

-   Builder login
-   Dashboard overview
-   Create and manage job posts
-   View applicants
-   View worker profiles, skills and experience
-   Review assessment information
-   Accept or reject applications

### Matching System

The recommendation module is planned to consider factors such as:

-   Worker skills
-   Skill-assessment result
-   Experience
-   Job requirements
-   Worker/job location
-   Availability

Matching weights and model performance will be evaluated during project
testing. No accuracy or employment-improvement claims are assumed in
advance.

## Tech Stack

  Layer                     Technology
  ------------------------- --------------------------
  Worker Mobile App         Flutter / Dart
  Builder Web Dashboard     React + Vite
  Backend API               Python + FastAPI
  Database                  PostgreSQL
  Location Queries          PostGIS
  Authentication            Firebase Authentication
  Notifications             Firebase Cloud Messaging
  AI / ML                   Python, scikit-learn
  Semantic Skill Matching   Sentence Transformers
  Maps / Location           Google Maps API
  Version Control           Git + GitHub

## Proposed Architecture

``` text
Worker Flutter App                 Builder React Dashboard
        |                                   |
        +---------------+-------------------+
                        |
                    FastAPI
                        |
          +-------------+-------------+
          |             |             |
      PostgreSQL    Matching Engine   Firebase
          |             |
          +-------------+
                 |
          Recommended Jobs
```

## Worker Flow

``` text
Login / OTP
    |
Registration
    |
Worker Profile
    |
Skill Selection
    |
Skill Assessment
    |
Job Recommendations
    |
Job Details
    |
Apply for Job
    |
Application Status
```

## Current Development Plan

The first development milestone is the **frontend**. The worker-facing
Flutter application and builder dashboard will initially use mock/local
data so frontend development does not depend on the backend being
complete.

### Initial Frontend Modules

1.  Authentication and worker registration
2.  Worker profile
3.  Skill selection and assessment
4.  Worker home and job listing
5.  Job details and application flow
6.  Builder dashboard
7.  Job management
8.  Applicant and worker profile views

## Repository Structure

The repository can evolve toward the following structure:

``` text
kaamsetu/
├── mobile-app/          # Flutter worker application
├── web-dashboard/      # React builder/admin dashboard
├── backend/            # FastAPI backend
├── ai-engine/          # Matching and assessment logic
├── database/           # Database scripts/schema
├── docs/               # Project documentation
└── README.md
```

## Getting Started

The project is currently under development. Setup instructions will be
added as each application module is implemented.

### Prerequisites

Planned development tools include:

-   Git
-   Flutter SDK
-   Android Studio or VS Code
-   Node.js and npm
-   Python
-   PostgreSQL

## Team

-   **Vishwajeet** --- Frontend lead, project setup and integration
-   **Apurva** --- Worker authentication and profile module
-   **Aboli** --- Job discovery and application module
-   **Vaishnavi** --- Skill assessment and builder dashboard module

Responsibilities may be adjusted as development progresses.

## Project Status

**Status:** In Development

Current focus: **Frontend development and core user flows.**

## Academic Note

KaamSetu is being developed as an engineering academic project.
Features, matching methods and evaluation metrics described in the
repository may change during implementation and testing. Experimental
results will be reported only after they are measured.

## License

This project is currently intended for academic and educational use. A
formal open-source license can be added later if the team decides to
release the project publicly.
