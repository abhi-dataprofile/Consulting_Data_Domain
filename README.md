# Data Modeling for Student Consulting System

## Objective:
To design a scalable relational data model to streamline student-related operations for a consulting firm that supports global students in securing placements at U.S. institutions.

## Approach:
1. **Entity-Relationship (ER) Diagram Creation:**
   - Developed an ER diagram to represent relationships between core entities such as `Student`, `Consultant`, `University`, and `Coaching Institute`.
   - Established `primary keys` and `foreign keys` to enforce referential integrity.
   - Represented many-to-many relationships using relational tables such as `student_consultant` and `student_university`.

2. **Data Normalization:**
   - Normalized tables to **Third Normal Form (3NF)** to remove redundancy and maintain data consistency.
   - Separated attributes into logically connected entities (e.g., `State`, `Country`, `University`).
   - Boolean attributes like `is_coaching_req` and `i20_status` were represented using binary flags for simplicity.

3. **Data Transformation:**
   - Populated tables with sample data using SQL `INSERT INTO` queries for validation.
   - Constructed SQL `JOIN` queries to fetch student records with associated consultant and university details. Example:

   ```sql
   SELECT s.student_name, u.university_name, ci.course_name, ci.exam_status
   FROM student s
   JOIN student_university su ON s.student_id = su.student_id
   JOIN university u ON su.university_id = u.university_id
   LEFT JOIN coaching_institute ci ON s.student_id = ci.student_id
   WHERE su.i20_status = 1;

## Key Results:
- **Designed a student-centric relational database:** Created an optimized schema for storing student profiles, university applications, and coaching course details.
- **Improved data integrity:** Minimized redundancy through normalization, ensuring consistent and accurate records.
- **Efficient querying:** Enabled optimized queries for tracking student placement progress, prerequisites, and reports.

## Applications:
- **Automated tracking:** Streamlined tracking of student profiles, coaching exam results, and I-20 statuses.
- **Reporting:** Provides insights and reports on placements by university, program, and geographical location.

## Next Steps:
2. **Query Optimization:** Add indexing to optimize complex queries for faster performance.
3. **Data Expansion:** Incorporate additional attributes such as funding status and admission timelines to improve reporting.
