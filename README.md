# ad-submission-system-postgres
This project is a modern rebuild of my original academic database system for managing advertising submissions. While the original schema was already normalized up to BCNF, this new version introduces several real-world enhancements to improve data integrity, flexibility, and security.

Key Improvements:

- Rebuilt using PostgreSQL for improved reliability and standards compliance

- Dockerized setup for easy local deployment and reproducibility

- Additional data validation constraints, e.g., age > 0, budget > 0

- Inclusive and flexible data types, such as supporting "Non-binary" and "Prefer not to say" in the gender field

- Separation of user credentials into a dedicated table, with plans for password hashing

- Sample data and query operations demonstrating joins, aggregates, updates, and constraint enforcement

This upgraded version is designed for real-world readiness and integration with web framework (Flask).
> Originally developed as part of a university course, now enhanced for real-world use.
