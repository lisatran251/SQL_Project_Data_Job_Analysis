import pandas as pd
import matplotlib.pyplot as plt

# Data provided by the user
data = {
    "company_name": [
        "Mantys", "ЛАНИТ", "Torc Robotics", "Illuminate Mission Solutions",
        "Care.com", "Anthropic", "OpenAI", "Google", "Asana", "Pinterest Job Advertisements"
    ],
    "avg_salary": [
        650000, 400000, 375000, 375000,
        350000, 295000, 285000, 254000, 235000, 232423
    ]
}

# Creating a DataFrame
df = pd.DataFrame(data)

# Sorting the DataFrame by average salary in descending order
df_sorted = df.sort_values(by="avg_salary", ascending=False)

# Plotting
plt.figure(figsize=(10, 8))
plt.barh(df_sorted["company_name"], df_sorted["avg_salary"], color='skyblue')
plt.xlabel('Average Salary ($)')
plt.ylabel('Company')
plt.title('Average salaries offered by the top 10 highest-paying companies for the DA position')
plt.gca().invert_yaxis()  # Invert y axis for better readability
plt.show()
