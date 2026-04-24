def calculate_grade(score):
    if score >= 90:
        return "A"
    elif score >= 80:
        return "B"
    elif score >= 70:
        return "C"
    elif score >= 60:
        return "D"
    else:
        return "F"


students = {}

try:
    with open("students.txt", "r") as file:
        for line in file:
            name, grade = line.strip().split(",")
            students[name] = grade
except FileNotFoundError:
    pass


def save_to_file():
    with open("students.txt", "w") as file:
        for name, grade in students.items():
            file.write(f"{name},{grade}\n")


while True:
    print("\n--- Student Grade Manager ---")
    print("1. Add Student")
    print("2. Update Student")
    print("3. View All Students")
    print("4. Exit")

    choice = input("Enter your choice: ")

    if choice == "1":
        name = input("Enter student name: ")
        score = int(input("Enter student score: "))
        grade = calculate_grade(score)
        students[name] = grade
        save_to_file()   # ✅ ADDED HERE
        print(f"{name} added with grade {grade}")

    elif choice == "2":
        name = input("Enter student name to update: ")
        if name in students:
            score = int(input("Enter new score: "))
            grade = calculate_grade(score)
            students[name] = grade
            save_to_file()   # ✅ ADDED HERE
            print(f"{name} updated to grade {grade}")
        else:
            print("Student not found")

    elif choice == "3":
        print("\nStudent Grades:")
        for name, grade in students.items():
            print(f"{name}: {grade}")

    elif choice == "4":
        print("Exiting program...")
        break

    else:
        print("Invalid choice, try again")