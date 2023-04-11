import pandas as pd
import sqlite3

# Read CSV file into a DataFrame
data = pd.read_csv("food_inspection_data.csv")
# Create an in-memory SQLite database
conn = sqlite3.connect(":memory:")

# Write DataFrame to the SQLite table
data.to_sql("inspections", conn, if_exists="replace", index=False)
query1 = """
SELECT Type, COUNT(*) as inspections_count
FROM inspections
GROUP BY Type
ORDER BY inspections_count DESC;
"""

establishment_counts = pd.read_sql_query(query1, conn)
print(establishment_counts)
query2 = """
SELECT Inspection_type, COUNT(*) as violation_count
FROM inspections
WHERE Inspection_results = 'Non-Compliant - Violations Observed'
GROUP BY Inspection_type
ORDER BY violation_count DESC
LIMIT 5;
"""

common_violations = pd.read_sql_query(query2, conn)
print(common_violations)
query3 = """
SELECT COUNT(DISTINCT Establishment_id) as establishments_with_issues
FROM inspections
WHERE
  Food_from_approved_source = 'Out of Compliance'
  OR Food_protected_from_contamination = 'Out of Compliance'
  OR Ill_workers_restricted = 'Out of Compliance'
  OR Proper_hand_washing = 'Out of Compliance'
  OR Cooling_time_and_temperature = 'Out of Compliance'
  OR Cold_holding_temperature = 'Out of Compliance'
  OR Hot_holding_temperature = 'Out of Compliance'
  OR Cooking_time_and_temperature = 'Out of Compliance'
  OR Reheating_time_and_temperature = 'Out of Compliance'
  OR Hot_and_cold_running_water_provided = 'Out of Compliance'
  OR Proper_sewage_disposal = 'Out of Compliance'
  OR No_bare_hand_contact = 'Out of Compliance'
  OR Adequate_hand_washing_facilities = 'Out of Compliance'
  OR Rodent_and_insects = 'Out of Compliance'
  OR Food_contact_surfaces_and_equipment = 'Out of Compliance';
"""

establishments_with_issues = pd.read_sql_query(query3, conn)
print(establishments_with_issues)
conn.close()
